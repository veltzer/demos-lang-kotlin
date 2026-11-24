# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `rsconstruct.toml:28` - `processor.ruff` (and `processor.mypy` at line 32) list `src` in `src_dirs`, but `src/` holds only `.kt` files; list just the folders with Python (`scripts`, `config`) per the precise-src_dirs rule.

## Low

- `tera.snippets/main.md.tera:1` - the snippet does not start with a blank line, so the rendered `README.md:20-21` glues the build badge line to the `## Number of examples` heading; add a leading empty line (as `pyvardump`'s snippet does).
- `tera.snippets/main.md.tera:3` - renders "there are 1 examples"; reword so the count reads correctly for one example (e.g. "Number of examples: N").
- `rsconstruct.toml:42` - comment says "The Makefile compiled each src/**/*.kt", and `scripts/kotlinc_build.py:3` says it reproduces "the Makefile's" command, but there is no Makefile in the repo any more; describe the generator directly.
- `pyproject.toml:10` - `pytest` is in the dev group but the repo has no tests and no `processor.pytest`; drop it.
