# Introduction {#introduction}

<!-- I'll start this thesis by making a confession: This is a hypertext document. Bowing to my way of thought, I didn't start writing the introduction before finishing the argumentation of chapter \ref{sec:annotation}, and I did not even think about writing down related work before explaining the technical implementation. I suppose that the reader will not proceed sequentially either. They might read the abstract and skim the introduction before heading to the study results of @sec:study:results, yet I ask them to bear with me for this moment. -->

Ideas on hypertext emerged from the work of digital researchers as early as in the 1960s, originally describing the need for expressing non-sequential patterns of thought in writing. Ted Nelson described this with the _intertwingling_ of knowledge:

> _EVERYTHING IS DEEPLY INTERTWINGLED. In an important sense there are no "subjects" at all; there is only all knowledge, since the cross-connections among the myriad topics of this world simply cannot be divided up neatly._ [@nelson1987b, DM 45]

For the matter of expressing non-linearity, hypertext systems adopted the notion of hyperlinks, which would express semantic relations between documents and could be used for hypertext fiction[^hypertext-fiction] and cohesive scientific documentation [@berners-lee1989a]. The ubiquitous `<a>` element of the Hypertext Markup Language (HTML), conceived by @berners-lee1995, realizes such relations on today's World Wide Web. It lacks further modalities for articulating non-linearity, however, when compared to Ted Nelson's _Xanadu_ hypertext system [@voss2019]: With _transclusion_ (i.e., including parts of one document within another), documents on Xanadu could be composed of a multitude of smaller documents by referencing rather than copying their contents. Transclusion referencing works by granularly specifying parts of a resource, such as a piece of text. Consequently, other forms exist to express non-sequential thought as described by Nelson, for instance annotations and footnotes.

In a way, @marshall1997 explored the analog modalities of hypertext when analyzing students' annotations on used books. Commonly despised by librarians and collectors alike, annotation on paper makes for a great way of connecting related knowledge and thoughts in situ to the underlying source. The physical representation of books obviously causes an inherited limitation when making annotations on paper, such as too little space for marginal notes. The digital medium lifts those limitations; almost encouragingly, annotating digital text is just a matter of switching bits from zero to one and vice versa, enabling real-time collaborative note-taking or intensive public commentary. These prospects could extend the functionalities of interactive reading environments and digital libraries, connecting derived knowledge with its sources. However, applications tend to support the two extremes of annotation: private and personal (any note-taking app), or public and collaborative (e.g., Hypothes.is[^hypothesis]). A third modality of annotating that resides in between these both---I will call it _private collaboration_---is still missed in most annotation environments.

Little attention is paid towards the private matters of digital notes---being it musings in diary entries or highlights of favorite verses on Goethe's _The Sorrows of Young Werther_---as web-backed services rarely impose end-to-end encryption. Digital notebooks must ensure privacy and security, and the web yet has to prove itself eligible for treating annotations accordingly.

[^hypertext-fiction]: Hypertext fiction uses hyperlinks for expressing nonlinearity in literature. Many popular works of hypertext fiction have been published by Eastgate: <http://eastgate.com/>.
[^hypothesis]: <https://web.hypothes.is/>.

## Motivation: A Question of Ownership {#sec:intro:motivation}

Ever since its birth in the early 1990s, the web has been a facilitator to economic growth: The dot-com bubble of the early 2000s and the rise of the Silicon Valley during the 2010s were founded on the sudden possibilities of near-instant, worldwide communication (besides piles of venture capital). The commercialization of the web nevertheless entails threats to its fundamental principles: An increasing amount of data is stored on the _cloud_---a ubiquitous, mystical entity---with few prospects on ownership and privacy. As \citeauthor{kleppmann2019} put it:

> _Although they let you access your data anywhere, all data access must go via the server, and you can only do the things that the server will let you do. In a sense, you don’t have full ownership of that data --- the cloud provider does. In the words of a bumper sticker: “There is no cloud, it’s just someone else’s computer.”_ [@kleppmann2019, p. 155]

Arguably, there exists a difference between _practical_ and _theoretical_ ownership of data. Practically, I own data whilst it remains on my computer. If stored on the cloud, I could ask customer support to send me all the data I have provided them with. Theoretically, however, I can prove ownership of data by cryptographic means. Signing or encrypting data with cryptographic keys allows me to mathematically validate the signature or even prevent third parties from accessing it.

The question of ownership in regard to data availability on a personally-owned device remains, though. Peer-to-Peer (P2P) systems commonly address this issue by establishing communication channels directly between two parties with no intermediaries involved (except for relaying data). Initially popularized among file-sharing services of the early 2000s such as Napster, applications nowadays increasingly leverage P2P principles for eliminating the need for third parties in their systems. Blockchain technology and Decentralized Autonomous Organizations (DAOs) incentivize this development by pledging for free and global trade.

Whether motivated by crypto-economic aspects or not, decentralized applications demand for new technological frameworks and revisited concerns of usability. With _local-first software_, @kleppmann2019 introduced a manifesto for applications that store data locally, do not depend on network connections, and yet enable secure real-time collaboration with peers once connected.

Could this serve as a foundation for rediscovering hypertext annotation?

## Research Goals and Affiliated Work {#sec:intro:meta}

The initial research question for this thesis emerged out of a personal frustration about the status quo of platform-centric tools, affecting the modalities of annotation on the web: Could P2P networks and local-first software serve as a foundation for rediscovering hypertext annotation?

Arguably, P2P systems have their downsides, which I will outline later in this thesis. Last year, I had the opportunity of joining various academic gatherings, one of which was the ACM Hypertext Conference in Hof, Germany. This left me with plenty of room for discussing digital annotation with scholars of the Digital Humanities and computer science alike. Some scholars approved my concerns on digital ownership, others objected the use of P2P systems and less authoritative control. After all, academia is a highly hierarchical structure with countless authorities involved. This left me with posing research questions on the actual _feasibility_ of such systems by exploring benefits for digital, scholarly workflows:

1. How do users perceive collaborative workflows on digital annotation in contemporary Digital Humanities tools?
2. How can personal ownership and institutional governance be considered in a P2P architecture with distributed governance?
3. How could a system be realized technically with such considerations?

Throughout the project, I had the opportunity to talk and write publicly about the main contribution of this thesis: an architecture for distributed digital annotation called _Hyperwell_. First, I gave a talk titled _From Me to You: Peer-to-Peer Collaboration With Linked Data_ at the second DARIAH Digital Humanities workshop at the University of Neuchâtel, Switzerland. A short paper about the Hyperwell architecture (co-authored by my thesis supervisor, Dr. Thomas Köntges) was published in the workshop proceedings [@kassel2020a] as an open publication on the newly released DARIAH Campus[^dariah-campus] website. 

Second, Chiara Palladino from Furman University and I are collaborating on a joint open publication on using Recogito---an open annotation environment---for collaborative learning in classrooms. The results of the study described in chapter \ref{sec:study} yielded not only feedback on collaborative annotation in general, but also on how students could collaborate with digital tools in classrooms. A forthcoming open publication and an accompanying blog post on the Pelagios blog[^pelagios-blog] set out to provide educators with insights on how (digital) classes could benefit from using collaborative environments such as Recogito.

In order to build Hyperwell, I have sketched user interfaces using graphics tools and created prototypical implementations. The centerpiece of Hyperwell is a gateway server that bridges the P2P network into the web. While the official print version of this thesis contains all affiliated code repositories, I have decided to openly publish the gateway server [@kassel2020]. Further affiliated software is available on the Hyperwell project's page on GitHub[^hyperwell-project].

[^dariah-campus]: <https://campus.dariah.eu/>.
[^pelagios-blog]: <https://medium.com/pelagios>.
[^hyperwell-project]: <https://github.com/hyperwell>.

## Synopsis {#sec::synopsis}

This thesis is aimed towards readers with an affinity for computer technology, but not _necessarily_ computer scientists. While my own practice resides in computer science, this work involves research on digital collaborative systems, collaborative research workflows, and digital ownership. By incorporating novel technologies that effectively concern research data management, I attempt to _convince_ readers with a non-technical background to reflect on their digital practice. For this matter, parts of this thesis with less technical ambition will be highlighted below.

Throughout parts of this thesis, I will use a technological vocabulary and related terminology. _P2P, DHT, TCP_---the acronyms used likely describe concepts and technology related to computer networks. I aspire to successively introduce such terms as I progress, yet readers may find it helpful to conduct the list of abbreviations in the front matter of this thesis.

Following this introduction, chapter \ref{sec:related} contains a discussion of related work that concerns hypertext, digital annotation, P2P applications, and research infrastructure in the Digital Humanities. Mostly focusing on scholarly research, I will cover fundamental and academically documented technology that is used in this thesis throughout that chapter. I will state further technological decisions in footnotes in later parts of this thesis.

In chapter \ref{sec:study}, I will address a study on collaborative annotation workflows in the Digital Humanities. Arguing for shift in personal data ownership, particularly on annotation, I will discuss aspects of governance in decentralized and distributed systems in chapter \ref{sec:annotation}. For a sustainable, ownership-preserving separation of personal and public data on P2P systems, I introduce the notions of digital notebooks and public entities.

@Sec:implementation concerns the technical work of the thesis. I will present two designs and their respective implementations of an architecture for decentralized, collaborative annotation called Hyperwell. I will then discuss observations, issues, and shortcomings in chapter \ref{sec:discussion}. Chapter \ref{sec:conclusion} will then revisit the contributions of this thesis and sketch future work.

