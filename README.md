# jaehho.github.io

Personal CV and application materials, authored in [Typst](https://typst.app/).

## Layout

- `cv/` — master CV (`cv.typ`) and resume variants (`resume-*.typ`). Shared data, layout helpers, and bibliography live in `cv/shared/` and `cv/publications.bib`.
- `personal_statement.typ` — generic master statement; per-application versions are derived from it.
- `applications/` — one directory per application (statements, cover letters, notes, exhibits).
- `scripts/` — repo utilities (e.g., `compare.py`).

## Build

```sh
typst compile path/to/file.typ
```

PDFs are gitignored; commit only the source.

## Compare CV variants

```sh
python scripts/compare.py
```

Defaults to scanning `cv/`. Pass a different directory as the first argument to compare elsewhere.
