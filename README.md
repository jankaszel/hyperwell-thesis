# Master's Thesis on Collaborative Peer-to-Peer Annotation

This repository contains the source code of my Master's thesis on collaborative distributed annotation, titled "Hyperwell: Local-First, Collaborative Notebooks for Digital Annotation", where I present a peer-to-peer system called _Hyperwell_.

## Abstract

Highlights, scribbling, and marginal notes: Annotation is often a private practice that we only occasionally share with others, or even more rarely share publicly. Once considered fundamental to hypertext systems, the potential of annotating digital documents is often overlooked in today's technology. As data commonly leaves our devices when collaborating, further questions arise on digital ownership and privacy. In this thesis, I examine the question of how both ownership and privacy can be ensured in the context of Digital Humanities research, which increasingly leverages interoperable infrastructures and Linked Open Data. 

In an explorative study, I first investigate the aspects of real-time collaboration in research tools, followed by an examination of institutional services on Peer-to-Peer (P2P) networks. By establishing interoperability between such networks and the web, I then propose two approaches for bridging those networks and strengthening privacy, ownership, and private collaboration following the paradigm of local-first software.

I argue that by balancing the autonomy of peers and the determinism of the web, gateways can translate across the separation of both networks while supporting peers by providing archiving and data availability. This enables researchers to perform private and collaborative annotation, while the underlying data can be embedded into existing workflows due to the bridge between both systems. Future work concerns the viability of this approach in scholarly environments and further research on the usability of distributed systems in the academic context.

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

The LaTeX and Pandoc structure is roughly based on Tom Pollard's PhD thesis Pandoc template:

> Tom Pollard et al. (2016). Template for writing a PhD thesis in Markdown. Zenodo. http://dx.doi.org/10.5281/zenodo.58490

## How to Cite

tbc.

## License

The thesis itself is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-sa/4.0/). The related open-source code of the [Hyperwell project](https://github.com/hyperwell) is licensed under a more permissive MIT license.
