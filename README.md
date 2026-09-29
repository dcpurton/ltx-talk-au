# ltx-talk-au

A `ltx-talk` style for Adelaide University.

## Installation

`ltx-talk-au` uses the `l3build` system.

Clone the git repository using:

```
git clone https://github.com/dcpurton/ltx-talk-au.git
```

Change to the `ltx-talk-au` directory, and then the style file
(`afesbrand.cls`), its support files and documentation (`ltx-talk-au.pdf` and
`ltx-talk-au-example.pdf`) can be installed by running:

```
l3build install --full
```

You will need to install [Barlow
Condensed](https://fonts.google.com/specimen/Barlow+Condensed) font to
recompile the documentation and use the class.

## Fonts

Adelaide University specifies [National 2
Condensed](https://klim.co.nz/fonts/national-2-condensed/) from Klim Type
Foundry for headings and subheadings. Unfortunately this font is commercial.

If National 2 Condensed is not available, `ltx-talk-au` falls back to [Barlow
Condensed](https://fonts.google.com/specimen/Barlow+Condensed). This font is
not distributed with TeXLive so you'll need to download and install the Medium
and Bold weights yourself in order to use `ltx-talk-au`. Barlow Condensed is
much closer in style and metrics to National 2 Condensed than Arial Bold which
is what the University brand guidelines recommend.

For testing, Klim Type Foundry offers a set of test fonts with limited
character support and no OpenType features. Note that the test font licence
does not permit using these fonts in a real presentation. If you have the test
fonts installed, `ltx-font-au` can be instructed to use them, falling back to
Barlow Condensed for missing characters. The `l3build` test files are built
using this configuration.

The body font is [Roboto
Serif](https://fonts.google.com/specimen/Roboto+Serif) which is distributed
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
