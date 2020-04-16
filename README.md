# Master's Thesis on Collaborative Peer-to-Peer Annotation

This repository contains the source code of my Master's thesis on collaborative distributed annotation, titled "Hyperwell: Local-First, Collaborative Notebooks for Digital Annotation", where I present a peer-to-peer system called Hyperwell.

The LaTeX and Pandoc structure is roughly based on Tom Pollard's PhD thesis Pandoc template:

> Tom Pollard et al. (2016). Template for writing a PhD thesis in Markdown. Zenodo. http://dx.doi.org/10.5281/zenodo.58490

### Building the Document

I wouldn't recommend anyone to attempt building this, as I've run into countless issues with particular versions of Pandoc and XeLaTeX. If you, however, still want to take on this, you'll need the following software installed:

* `make`
* Pandoc
* LaTeX (with XeLaTeX---I would recommend against installing BasicTeX, as you'll need to install countless plugins. Rather opt for a complete TeX installation!).
* Biber
* Typefaces: This thesis is set in Suisse Works and Suisse Int'l of the [Suisse family](https://www.swisstypefaces.com/fonts/suisse/), as well as IBM Plex Mono of the [IBM Plex family](https://github.com/IBM/plex). You'll need to purchase a license for Suisse family fonts and install them locally on your computer.

Then, run `make` with various commands:

* `make` or `make pdf`: Build a PDF version of this thesis.
* `make clean`: Clean all LaTeX output files.
* `make test`: Check bibliography consistency and validate all (HTTP) hyperlinks from the output PDF.
* `make stats`: Run a wordcount (`wc -w`) on the Markdown input files.

## Legacy Instructions

There are some minor annoyances:
- ~~there is no straightforward way of specifying image size in the markdown right now, though this functionality is coming (see: https://github.com/tompollard/phd_thesis_markdown/issues/15)~~ (Image size can now be specified. Thanks to @rudolfbyker for [highlighting this](https://github.com/tompollard/phd_thesis_markdown/issues/15)).

### How do I get started?

1. Install the following software:
    - A LaTeX distribution (for example, [MacTeX](https://tug.org/mactex/) for Mac users).
    - [Pandoc](http://johnmacfarlane.net/pandoc), for converting the Markdown to the output format of your choice.  You may also need to install [Pandoc cite-proc](http://pandoc.org/demo/example19/Extension-citations.html) to create the bibliography.
    - Install @martisak's shortcaption module for Pandoc, with `pip install pandoc-shortcaption`
    - Git, for version control.
2. [Fork the repository](https://github.com/tompollard/phd_thesis_markdown/fork) on Github  
3. Clone the repository onto your local computer (or [download the Zip file](https://github.com/tompollard/phd_thesis_markdown/archive/master.zip)).  
4. Navigate to the directory that contains the Makefile and type "make pdf" (or "make html") at the command line to update the PDF (or HTML) in the output directory.  
**In case of an error** (e.g. `make: *** [pdf] Error 43`) run the following command:  
    ```
    sudo tlmgr install \
        truncate tocloft wallpaper morefloats sectsty \
        threeparttable l3packages l3kernel l3experimental \
        lstfiracode tlmgr csquotes footmisc pgfplots xstring \
        catchfile biblatex-chicago biblatex biber
    ```
    
5. Edit the files in the 'source' directory, then goto step 4.  

### What else do I need to know?

Some useful points, in a random order:
- add two spaces at the end of a line to force a line break.

