# ltx-talk-au

The `ltx-talk-au` class implements an unofficial style for `ltx-talk` for
Adelaide University. The various frame layouts, colours and fonts specified
for presentations at the Adelaide University [branded
templates](https://staff.adelaide.edu.au/external-engagement/access-marketing-communications-resources/use-brand-and-logo/branded-and-self-service-templates/)
staff web page are supported. `ltx-talk-au` is compatible with the LaTeX
tagging project and so tagged accessible PDFs conforming with the PDF/UA-2
standard (including mathematics tagged with MathML) can be produced.

## Installation

`ltx-talk-au` uses the `l3build` system.

Clone the git repository using:

```
git clone https://github.com/dcpurton/ltx-talk-au.git
```

Change to the `ltx-talk-au` directory, and then the class file, its support
files and documentation can be installed by running:

```
l3build install --full
```

This will install the following files into your local texmf tree:

- `doc/latex/ltx-talk-au/README.md`
- `doc/latex/ltx-talk-au/ltx-talk-au-example.pdf`
- `doc/latex/ltx-talk-au/ltx-talk-au.pdf`
- `fonts/truetype/github/monasans/MonaSans-Italic-VariableFont_wdth,wght.ttf`
- `fonts/truetype/github/monasans/MonaSans-VariableFont_wdth,wght.ttf`
- `tex/latex/ltx-talk-au/ltx-talk-au-logo.def`
- `tex/latex/ltx-talk-au/ltx-talk-au.cls`

## Fonts

Adelaide University specifies [*National 2
Condensed*](https://klim.co.nz/fonts/national-2-condensed/) from Klim Type
Foundry for headings and subheadings. Unfortunately, this font is commercial.

If *National 2 Condensed* is not available, `ltx-talk-au` falls back to
[*Mona Sans*](https://github.com/mona-sans). *Mona Sans* is licensed under the
SIL Open Font Licence Version 1.1 and is distributed with `ltx-talk-au`.

The body font is [*Roboto
Serif*](https://fonts.google.com/specimen/Roboto+Serif) which is distributed
with TeXLive.

*TeX Gyre DejaVu Math* is used for mathematics. This font is also distributed
with TeXLive.

## Licence

```
Copyright (c) 2026 David Purton <david.purton@adelaide.edu.au>

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, either version 1.3c of this license
or (at your option) any later version. The latest version of this
license is in
   http://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work is "maintained" (as per the LPPL maintenance status)
by David Purton.
```
