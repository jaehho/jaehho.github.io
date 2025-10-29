import os, re, json, yaml, subprocess
from jinja2 import Environment, FileSystemLoader, select_autoescape

def typst_str(s: str) -> str:
    # Escape for Typst string literals
    t = (s or "")
    t = t.replace("\\", "\\\\").replace('"', '\\"')
    t = t.replace("\n", "\\n")
    return t

def tel_href(s: str) -> str:
    return re.sub(r"[^\d+]", "", s or "")

env = Environment(
    loader=FileSystemLoader("templates"),
    autoescape=select_autoescape(["html", "xml", "j2"])
)
env.filters["typst_str"] = typst_str
env.filters["tel_href"] = tel_href

def load_data(path="data/CV.yml"):
    with open(path, "r", encoding="utf-8") as f:
        d = yaml.safe_load(f)
    d["ldjson"] = json.dumps({
        "@context":"https://schema.org","@type":"Person",
        "name": d.get("name"),
        "email": f"mailto:{d.get('email')}",
        "telephone": tel_href(d.get("phone","")),
        "url": d.get("website"),
        "address":{"@type":"PostalAddress","addressLocality":"New York","addressRegion":"NY","addressCountry":"US"},
        "sameAs":[f"https://www.linkedin.com/in/{d.get('linkedin','')}"]
    })
    return d

def render_html(data):
    html = env.get_template("cv.html.j2").render(**data)
    os.makedirs("dist", exist_ok=True)
    with open("dist/index.html","w",encoding="utf-8") as f: f.write(html)

def render_typst(data):
    typ = env.get_template("cv.typ.j2").render(**data)
    os.makedirs("dist", exist_ok=True)
    out = "dist/cv.typ"
    with open(out,"w",encoding="utf-8") as f: f.write(typ)
    return out

def maybe_typst_pdf(typst_file, pdf_out="dist/Jaeho_Cho_CV.pdf"):
    try:
        # typst compile --package-path ./typst dist/cv.typ dist/Jaeho_Cho_CV.pdf
        subprocess.run(
            ["typst", "compile", "--package-path", "./typst", typst_file, pdf_out],
            check=True
        )

    except Exception:
        # Typst not installed or compile failed; skip quietly
        pass

if __name__ == "__main__":
    data = load_data()
    render_html(data)
    typst_file = render_typst(data)
    maybe_typst_pdf(typst_file)
    print("wrote dist/index.html and dist/cv.typ")
