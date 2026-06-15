# Portfolio site (`docs/`)

Static site served by GitHub Pages from `main` → `/docs`. No build step, no framework.

## Files

| File | What it is |
|------|------------|
| `index.html` | Page shell (hero + about text live here). |
| `data.js` | **Your editing surface** — projects, profile, publications. |
| `styles.css` | All styling + theming. |
| `main.js` | Renders projects from `data.js`; theme, motion, modal. |
| `assets/projects/<id>/` | Media for each project. |
| `assets/img/` | `portrait.jpg`, optional `og.png`. |

## Add or update media

1. Drop the file into `assets/projects/<id>/` (e.g. `assets/projects/neural-amp/layout.png`).
2. Make sure it's referenced in that project's `media` array in `data.js`.

Until a referenced file exists, a clean labelled placeholder shows in its place —
so the layout always looks intentional. Recommended: images ≤ ~1600 px wide,
short clips as `.mp4`. A square `assets/img/portrait.jpg` fills the hero photo
(falls back to a monogram if absent).

## Add a project

Copy any object in `PROJECTS` (`data.js`), give it a unique kebab-case `id`,
create `assets/projects/<id>/`, fill in the fields. `featured: true` gives it the
large case-study treatment at the top.

## Preview locally

```sh
make serve      # serves docs/ at http://localhost:8000
```

## CV

`Cho_Jaeho_Resume.pdf` lives in this folder. Refresh it with `make site-cv`
after editing the Typst source. If it's missing, the CV links hide themselves.
