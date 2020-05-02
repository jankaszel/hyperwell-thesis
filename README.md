# Master's Thesis on Collaborative Peer-to-Peer Annotation

This repository contains the source code of my Master's thesis on collaborative distributed annotation, titled "Hyperwell: Local-First, Collaborative Notebooks for Digital Annotation", where I present a peer-to-peer system called Hyperwell.

The LaTeX and Pandoc structure is roughly based on Tom Pollard's PhD thesis Pandoc template:

> Tom Pollard et al. (2016). Template for writing a PhD thesis in Markdown. Zenodo. http://dx.doi.org/10.5281/zenodo.58490

## Abstract

tbc.

## Building the Document

Creating a PDF of this thesis is harder than it should be. I wouldn't recommend anyone to attempt building this, as I've run into countless issues with particular versions of Pandoc and XeLaTeX. If you nevertheless insist on doing this, you'll need the following software installed: `make`, [Pandoc](https://pandoc.org/), and [LaTeX](https://tug.org/mactex/) (with XeLaTeX).

You will also need additional typefaces: This thesis is typeset in Suisse Works and Suisse Int'l of the [Suisse family](https://www.swisstypefaces.com/fonts/suisse/), as well as IBM Plex Mono of the [IBM Plex family](https://github.com/IBM/plex). You'll need to purchase a license for Suisse family fonts and install them locally on your computer.

Then, run `make` with various commands:

* `make` or `make pdf`: Build a PDF version of this thesis.
* `make docx`: Create a Microsoft Word (docx) version of this thesis. Good for spellchecking, but lacks support for additional LaTeX commands.
* `make clean`: Clean all LaTeX output files.
* `make test`: Check bibliography consistency and validate all HTTP hyperlinks from the output PDF.
* `make stats`: Run a wordcount (`wc -w`) on the Markdown input files.
* `make diff`: Estimate a wordcount diff for all uncommitted changes on Git.
 
**In case of an error** (e.g., `make: *** [pdf] Error 43`) run the following command: 
```bash
sudo tlmgr install \
  truncate tocloft wallpaper morefloats sectsty \
  threeparttable l3packages l3kernel l3experimental \
  csquotes footmisc pgfplots xstring \
  biblatex-chicago biblatex biber
```

## How to Cite

tbc.

## License

The thesis itself is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-sa/4.0/). The related open-source code of the [Hyperwell project](https://github.com/hyperwell) is licensed under a more permissive MIT license.
