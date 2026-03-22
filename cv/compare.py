#!/usr/bin/env python3
"""Compare CV/resume Typst documents to show structural differences."""

import re
import sys
from io import StringIO
from pathlib import Path
from collections import OrderedDict
from typing import Optional

import typer

app = typer.Typer(help="Compare CV/resume Typst documents.")


def parse_typ(path):
    text = path.read_text()
    lines = text.split("\n")

    styling = OrderedDict()
    sections = []  # ordered section names
    education = {"scholarships": False, "courses": []}
    research = OrderedDict()
    projects = OrderedDict()
    work = OrderedDict()
    publications = False
    skills = []

    section_key = {
        "Education": "education",
        "Research Experience": "research",
        "Publications": "publications",
        "Projects": "projects",
        "Work Experience": "work",
        "Skills": "skills",
    }

    # Parse conf.with(...) block for styling
    conf_match = re.search(r"#show:\s*conf\.with\((.*?)\)", text, re.DOTALL)
    if conf_match:
        for m in re.finditer(r"(\w[\w-]*):\s*(.+?)(?:,\s*$|$)", conf_match.group(1), re.MULTILINE):
            key = m.group(1).strip()
            val = m.group(2).strip().rstrip(",")
            if key != "author":
                styling[key] = val

    cur_section = None
    cur_entry = None  # (dict_ref, entry_name)

    for line in lines:
        s = line.strip()

        # Section heading
        m = re.match(r"^==\s+(.+)$", s)
        if m:
            name = m.group(1)
            sections.append(name)
            cur_section = section_key.get(name)
            cur_entry = None
            if name == "Publications":
                publications = True
            continue

        # Work/research entry
        m = re.match(r"#work\(\.\.data\.experience\.(\w+)\.header\)", s)
        if m:
            entry = m.group(1)
            target = research if cur_section == "research" else work
            target[entry] = []
            cur_entry = (target, entry)
            continue

        # Project entry
        m = re.match(r"#project\(name:\s*data\.project\.(\w+)\.header\.name\)", s)
        if m:
            entry = m.group(1)
            projects[entry] = []
            cur_entry = (projects, entry)
            continue

        # Experience/work bullet
        m = re.match(r"^-\s+#data\.experience\.\w+\.bullets\.(.+)$", s)
        if m and cur_entry:
            cur_entry[0][cur_entry[1]].append(m.group(1))
            continue

        # Project bullet
        m = re.match(r"^-\s+#data\.project\.\w+\.bullets\.(.+)$", s)
        if m and cur_entry:
            cur_entry[0][cur_entry[1]].append(m.group(1))
            continue

        # Scholarships
        if "data.education.scholarships" in s:
            education["scholarships"] = True

        # Courses
        courses = re.findall(r"data\.courses\.(\w+\.\w+)", s)
        if courses:
            education["courses"] = courses

        # Skills
        m = re.match(r"^-\s+\*(.+?)\*:\s+#data\.skills\.(.+)$", s)
        if m:
            skills.append((m.group(1), m.group(2)))

    return {
        "styling": styling,
        "sections": sections,
        "education": education,
        "research": research,
        "projects": projects,
        "work": work,
        "publications": publications,
        "skills": skills,
    }


def ordered_union(*dicts):
    """Collect all keys across multiple OrderedDicts, preserving first-seen order."""
    seen = []
    for d in dicts:
        for k in d:
            if k not in seen:
                seen.append(k)
    return seen


def format_table(headers, rows, indent=0):
    """Format an aligned table. Each row is (label, [values...]). Returns lines."""
    prefix = " " * indent
    if not rows:
        return []

    out = []

    # Calculate column widths
    label_width = max(len(r[0]) for r in rows)
    col_widths = []
    for i, h in enumerate(headers):
        w = len(h)
        for r in rows:
            if i < len(r[1]):
                w = max(w, len(str(r[1][i])))
        col_widths.append(w)

    # Header
    line = f"{prefix}{'':>{label_width}}  "
    for h, w in zip(headers, col_widths):
        line += f"  {h:^{w}}"
    out.append(line)

    # Separator
    line = f"{prefix}{'─' * label_width}──"
    for w in col_widths:
        line += f"──{'─' * w}"
    out.append(line)

    # Rows
    for label, vals in rows:
        line = f"{prefix}{label:>{label_width}}  "
        for v, w in zip(vals, col_widths):
            line += f"  {str(v):^{w}}"
        out.append(line)

    return out


def compare(docs):
    """Generate comparison output as a list of lines."""
    names = list(docs.keys())
    out = []

    # Styling
    all_style_keys = ordered_union(*[d["styling"] for d in docs.values()])
    rows = []
    for key in all_style_keys:
        vals = [d["styling"].get(key, "--") for d in docs.values()]
        rows.append((key, vals))

    out.append("\n  STYLING")
    out.extend(format_table(names, rows, indent=2))

    # Section Order
    all_sections = ordered_union(
        *[OrderedDict.fromkeys(d["sections"]) for d in docs.values()]
    )
    rows = []
    for sec in all_sections:
        vals = []
        for d in docs.values():
            if sec in d["sections"]:
                vals.append(str(d["sections"].index(sec) + 1))
            else:
                vals.append("--")
        rows.append((sec, vals))

    out.append("\n  SECTION ORDER")
    out.extend(format_table(names, rows, indent=2))

    # Education
    out.append("\n  EDUCATION")
    rows = [
        (
            "Scholarships",
            ["yes" if d["education"]["scholarships"] else "--" for d in docs.values()],
        )
    ]
    all_courses = ordered_union(
        *[OrderedDict.fromkeys(d["education"]["courses"]) for d in docs.values()]
    )
    for c in all_courses:
        rows.append(
            (c, ["✓" if c in d["education"]["courses"] else "" for d in docs.values()])
        )
    out.extend(format_table(names, rows, indent=2))

    # Entry-based sections
    for section_label, section_key in [
        ("RESEARCH EXPERIENCE", "research"),
        ("PROJECTS", "projects"),
        ("WORK EXPERIENCE", "work"),
    ]:
        all_entries = ordered_union(*[d[section_key] for d in docs.values()])
        if not all_entries:
            continue

        all_bullets = OrderedDict()
        for entry in all_entries:
            bullets = ordered_union(
                *[
                    OrderedDict.fromkeys(d[section_key].get(entry, []))
                    for d in docs.values()
                ]
            )
            all_bullets[entry] = bullets

        rows = []
        for entry in all_entries:
            # Entry header row
            vals = []
            for d in docs.values():
                if entry in d[section_key]:
                    vals.append(f"{len(d[section_key][entry])} bullets")
                else:
                    vals.append("--")
            rows.append((entry, vals))

            # Individual bullets
            for bullet in all_bullets[entry]:
                vals = []
                for d in docs.values():
                    if bullet in d[section_key].get(entry, []):
                        vals.append("✓")
                    else:
                        vals.append("")
                rows.append((f"  .{bullet}", vals))

        out.append(f"\n  {section_label}")
        out.extend(format_table(names, rows, indent=2))

    # Publications
    out.append("\n  PUBLICATIONS")
    rows = [
        (
            "Included",
            ["yes" if d["publications"] else "--" for d in docs.values()],
        )
    ]
    out.extend(format_table(names, rows, indent=2))

    # Skills
    all_labels = ordered_union(
        *[OrderedDict.fromkeys(label for label, _ in d["skills"]) for d in docs.values()]
    )
    rows = []
    for label in all_labels:
        vals = []
        for d in docs.values():
            found = next((v for l, v in d["skills"] if l == label), "--")
            vals.append(found)
        rows.append((label, vals))

    out.append("\n  SKILLS")
    out.extend(format_table(names, rows, indent=2))
    out.append("")

    return out


@app.command()
def main(
    cv_dir: Optional[Path] = typer.Argument(None, help="Directory containing .typ files."),
    output: Optional[Path] = typer.Option(None, "--output", "-o", help="Write output to a file."),
):
    """Compare CV/resume Typst documents to show structural differences."""
    if cv_dir is None:
        cv_dir = Path(__file__).parent

    typ_files = sorted(
        f for f in cv_dir.glob("*.typ") if "shared" not in str(f.relative_to(cv_dir))
    )

    if not typ_files:
        typer.echo(f"No .typ files found in {cv_dir}")
        raise typer.Exit(1)

    docs = OrderedDict()
    for f in typ_files:
        docs[f.stem] = parse_typ(f)

    lines = [f"\n  Comparing {len(docs)} documents: {', '.join(docs.keys())}"]
    lines.extend(compare(docs))
    text = "\n".join(lines)

    if output:
        output.write_text(text + "\n")
        typer.echo(f"Written to {output}")
    else:
        typer.echo(text)


if __name__ == "__main__":
    app()
