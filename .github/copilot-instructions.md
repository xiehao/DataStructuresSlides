# Data Structures and Algorithms Slides

## Build and validation

All chapter sources and PDFs are at the repository root. They use XeLaTeX and
the locally installed `cuzbeamer` class (verify with `kpsewhich cuzbeamer.cls`).

```sh
# Build the active deck; use chapter-00 through chapter-04 for individual decks.
make chapter-04

# Build all decks and 2x2 handouts.
make all

# Remove generated auxiliary files without removing PDFs.
make clean
```

There is no automated test suite or lint configuration. PDFs are tracked slide
artifacts, so rebuild both the presentation and handout PDFs when changing a
deck. `make handouts` builds all handouts.

## Source architecture

- Each deck entry point (`DSA00-Introduction.tex` through
  `DSA04-BasicAlgorithms.tex`) is deliberately thin: it declares
  `cuzbeamer` and presentation-specific packages, inputs `initialization.tex`,
  creates the title page, then inputs a `*-data.tex` content aggregator.
- Content aggregators own the chapter opening, table of contents, summary, and
  high-level `\input` composition. Topic files (`*-data1.tex`,
  `*-data2.tex`, and numbered continuations) own the sections, subsections,
  frames, and animations. Keep this split when extending a chapter.
- `initialization.tex` is the repository-wide presentation metadata.
  `slide-config.tex` sets code font sizes and the 2x2 handout layout. Handouts
  share the corresponding deck content and suppress thinking-question answers.
- Slide styling and many environments/macros, including `standout`, `fragile`,
  `bicolumns`, and `algorithmx`, come from the external `cuzbeamer` class.
  Preserve the existing package and TikZ-library declarations in the deck
  entry point when using those features.

## Content conventions

- Slides are bilingual Chinese/English where appropriate; retain the existing
  Chinese instructional prose and English parenthetical technical terms.
- Use `\input{...}` for slide composition, with paths relative to the deck's
  existing source layout. Store reusable teaching fragments in `supplements/`
  and figures in `images/`.
- Use `fragile` frames for minted code content and preserve overlay commands
  such as `\pause`, `\only`, and overlay ranges when editing animated slides.
- Follow the established label namespaces for cross-references: figures use
  `fig:...` (commonly `fig:demo_...`) and algorithms use `alg:...`.
