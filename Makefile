PYTHON ?= .venv/bin/python

.DEFAULT_GOAL := help
.PHONY: tui status compare cv serve site-cv help

tui:
	@$(PYTHON) scripts/apptui.py

status:
	@$(PYTHON) scripts/applications.py status

compare:
	@$(PYTHON) scripts/compare.py

cv:
	typst compile cv/cv.typ

serve:
	@$(PYTHON) -m http.server 8000 --directory docs

site-cv:
	typst compile cv/cv.typ docs/Cho_Jaeho_Resume.pdf

help:
	@echo "make          - show this help (default)"
	@echo "make tui      - launch the tracker TUI"
	@echo "make status   - non-interactive dashboard"
	@echo "make compare  - compare CV / resume variants"
	@echo "make cv       - compile cv/cv.typ"
	@echo "make serve    - preview docs/ at http://localhost:8000"
	@echo "make site-cv  - compile cv/cv.typ into docs/Cho_Jaeho_Resume.pdf"
