# Introduction {#introduction}

Introduce to digital annotation. Hypothes.is. Dokieli.

Annotation.


Describing the complixity of digital knowledge, taking inspiration from Ted Nelson:

> _EVERYTHING IS DEEPLY INTERTWINGLED. In an important sense there are no "subjects" at all; there is only all knowledge, since the cross-connections among the myriad topics of this world simply cannot be divided up neatly._ [@nelson1987b]

How to relate data to each other? Linked Data.

Physical artifacts became digital resources, analogue workflows became digital ones. The digital nature of the contemporary humanist’s work suddenly demanded additional, extensive knowledge of gathering, analyzing, and maintaining data repositories. Best practices were formed, namely the FAIR principles [@wilkinson2016]: Findable, Accessible, Interoperable, and Reusable data. 

Usability of P2P systems: Thus, technologies for _theoretically_ decentralizing a system have been researched extensively, but the aspects of how to make this functionality accessible to users are still opaque.

_TODO:_ Transitioning to collaboration---offline as well as online. Being an umbrella for various disciplines, the Humanities historically embraced academic collaboration to a great extend [@siemens2015]. Something on Linked Data [@simon2015; @simon2017]? Something on annotation [@marshall1997; @marshall1998; @sanderson2013; @kahan2002]?

In the wake of the new web, the wake of technological development that happened after the bust of the dot-com bubble in 2001, the internet became more open and accessible to the common people, as opposed to purely experts (Davidson, 2008). Collaboration, again, has been facilitated by this change, as the web tended towards social media, sharing of resources, and semantic description of data.

## Motivation: A Question of Ownership

> Well, by ‘hypertext’ I mean non-sequential writing--text that branches and allows choices to the reader, best read at an interactive screen. [@nelson1993]

The way humanity treats its expression sets implications on how research can reflect on these. @marshall1997 introduced a fundamental notion on this in regard to books and readers’ markings: The physical representation of a book bears the respective physical limitations of adding further information to paper-based text—being it highlights or marginal notes, for instance. The digital medium, however, lifts those physical limitations. Almost encouragingly, adding annotations to a digital text is just a matter of switching bits from zero to one. (…)

The Web has historically considered the client-server architecture a natural part of its architecture.

> When data is stored on “someone else’s computer”, that third party assumes a degree of control over that data. Cloud apps are provided as a service; if the service is unavailable, you cannot use the software, and you can no longer access your data created with that software. If the service shuts down, even though you might be able to export your data, without the servers there is normally no way for you to continue running your own copy of that software. Thus, you are at the mercy of the company providing the service. [@kleppmann2019]

Give a note on how the internet benefits businesses rather than individuals [@robinson2018]. Platforms bear a very strong notion of servers in the client-server model---technically as well as strategically. Issues on data ownership arise when storing personal data on centralized services.

_Introduce decentralized, distributed systems_

TODO: PROSPECTS OF P2P SYSTEMS

## Research Goals and Related Publications {#sec:introduction:research}

During the very early phase of this work, the initial research question emerged out of a personal frustration about the status quo of platform-centric tools in the Digital Humanities:

> How could a P2P systems for annotations be realized in the environment of tools and platforms in Digital Humanities research?

This open-ended question carries the belief that decentralized storage for users, computer scientists commonly tend to approach technical solutions before questioning user needs. However, research and feedback showed that platforms—as they are servers—are not necessarily evil: Federated services

1. _ How do users perceive real-time collaboration on digital annotation in contemporary Digital Humanities tools?
2. Does there exist an architectural issue regarding ownership with personal data such as annotations in contemporary services on the web?
3. How could kind of architecture could provide personal, distributed storage, and fit the requirements of academic Digital Humanities research?

Over the course of this whole project, I have had the opportunity to talk publicly about the architecture of Hyperwell, as well as publish openly on particular results of this thesis. First, I gave a talk titled _From Me to You: Peer-to-Peer Collaboration With Linked Data_ at the second DARIAH Digital Humanities workshop at the University of Neuchâtel, Switzerland. A short paper about the Hyperwell architecture---co-authored by my thesis supervisor, Dr. Thomas Koentges---was published in the conference proceedings [@kassel2020a] as an open publication on the newly released DARIAH Campus[^dariah-campus] website. 

Second, Chiara Palladino from Furman University and I collaborated on a joint open publication on using Recogito, an open annotation environment, for collaborative learning in classrooms. The results of the study described in @sec:study yielded not only feedback on collaborative annotation in general, but also on how students could collaborate with digital tools in classrooms. The open publication (forthcoming) and accompanying blog post[^pelagios-blog-post] on the Pelagios blog set out to provide educators with fundamental insights on how (digital) classes could benefit from using collaborational tools such as Recogito.

I have utilized  user interface design and software development for building prototypes of novel technology and architectures---mainly of the P2P systems discussed in chapter \ref{sec:implementation}. While all of the respective code repositories are included on the digital media attached to the official print version of this thesis, a subset of these repositories---standalone software that is subject to future development sketched in @sec:future-work---are published online and are being mirrored by the Zenodo open-access repository for long-term archival. These repositories are provided with each its own Digital Object Identifier (DOI).

[^dariah-campus]: <https://campus.dariah.eu/>.

## Synopsis {#sec::synopsis}

This thesis is aimed towards readers with an affinity for computer technology, but not _necessarily_ computer scientists. While my own practice resides in computer science, this work involves research on digital collaborative systems, collaborative research workflows, and digital ownership. By incorporating novel technologies that effectively concern research data management, I attempt to _convince_ readers with a non-technical background to reflect on their digital practice. For this matter, parts of this thesis with less technical ambition will be highlighted below.

Throughout parts of this thesis, I will use a technological vocabulary and related terminology; _P2P, DHT, TCP_, these acronyms majorly describe concepts and technology related to computer networks. I aspire to successively introduce such terms as I progress, yet readers may find it helpful to conduct the list of abbreviations in the front matter of this thesis.

Followign this introduction, chapter \ref{sec:related} contains a discussion of related work that concerns hypertext, digital annotation, P2P applications, and research infrastructure in the Digital Humanities. Mostly focusing on scholarly research, I will cover fundamental and academically documented technology that is used in this thesis throughout that chapter. I will state further technological decisions in footnotes in later parts of this thesis.

In chapter \ref{sec:study}, I will address a study on collaborative annotation workflows in the Digital Humanities. Arguing for shift in personal data ownership, particularly on annotation, I will discuss aspects of governance on power on decentralized and distributed systems in chapter \ref{sec:annotation}. For a sustainable, ownership-preserving separation of personal and public data on P2P systems, I introduce the notions of digital notebooks and public entities.

@Sec:implementation concerns the technical work of the thesis. I will present two designs and their respective implementations of an architecture for decentralized, collaborative annotation called Hyperwell. I will then discuss observations, issues, and shortcomings in chapter \ref{sec:discussion}. Chapter \ref{sec:conclusion} will then the revisit the contributions of this thesis and sketch future work.

