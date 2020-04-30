# Introduction {#introduction}

Describing the complixity of digital knowledge, taking inspiration from Ted Nelson:

> _EVERYTHING IS DEEPLY INTERTWINGLED. In an important sense there are no "subjects" at all; there is only all knowledge, since the cross-connections among the myriad topics of this world simply cannot be divided up neatly._ [@nelson1987b]

By its fundamental definition, hypertext is defined by Ted Nelson as non-sequential writing, bearing opportunities of non-deterministic exploration for writers and readers alike [@nelson1993].

Introduce to digital annotation.

Annotation.

The way humanity treats its expression sets implications on how research can reflect on these. @marshall1997 introduced a fundamental notion on this in regard to books and readers’ markings: The physical representation of a book bears the respective physical limitations of adding further information to paper-based text—being it highlights or marginal notes, for instance. The digital medium, however, lifts those physical limitations. Almost encouragingly, adding annotations to a digital text is just a matter of switching bits from zero to one. (…)

How to relate data to each other? Linked Data.

Physical artifacts became digital resources, analogue workflows became digital ones. The digital nature of the contemporary humanist’s work suddenly demanded additional, extensive knowledge of gathering, analyzing, and maintaining data repositories. Best practices were formed, namely the FAIR principles [@wilkinson2016]: Findable, Accessible, Interoperable, and Reusable data. 

Usability of P2P systems: Thus, technologies for _theoretically_ decentralizing a system have been researched extensively, but the aspects of how to make this functionality accessible to users are still opaque.

_TODO:_ Transitioning to collaboration---offline as well as online. Being an umbrella for various disciplines, the Humanities historically embraced academic collaboration to a great extend [@siemens2015]. Something on Linked Data [@simon2015; @simon2017]? Something on annotation [@marshall1997; @marshall1998; @sanderson2013; @kahan2002]?

In the wake of the new web, the wake of technological development that happened after the bust of the dot-com bubble in 2001, the internet became more open and accessible to the common people, as opposed to purely experts (Davidson, 2008). Collaboration, again, has been facilitated by this change, as the web tended towards social media, sharing of resources, and semantic description of data.

## Motivation: A Question of Ownership {#sec:intro:motivation}

Ever since its birth in the early 1990s, the web has been a facilitator to economic growth: The dot-com bubble of the early 2000s and the rise of the Silicon Valley during the 2010s were founded on the sudden possibilities of near-instant, worldwide communication (besides piles of venture capital). The commercialization of the web nevertheless entails threats to its fundamental principles: An increasing amount of data is stored on the _cloud_---an ubiquitous, mystic entity---with few prospects on ownership and privacy. As \citeauthor{kleppmann2019} put it:

> _Although they let you access your data anywhere, all data access must go via the server, and you can only do the things that the server will let you do. In a sense, you don’t have full ownership of that data --- the cloud provider does. In the words of a bumper sticker: “There is no cloud, it’s just someone else’s computer.”_ [@kleppmann2019, p. 155]

Arguably, there exists a difference between _practical_ and _theoretical_ ownership of data. Practically, I own data whilst it remains on my computer. If stored on the cloud, I could ask customer support to send me all the data I have provided them with. Theoretically, however, I can prove ownership of data by cryptographic means. Signing or encrypting data with cryptographic keys allows me to mathematically validate the signature or even prevent third parties from accessing it.

The question of ownership in regard to data availability on a personally-owned device remains, though. Peer-to-Peer (P2P) systems commonly address this issue by establishing communication channels directly between two parties with no intermediaries involved (except for relaying data). Initially popularized among file-sharing services of the early 2000s such as _Napster_, applications nowadays increasingly leverage P2P principles for eliminating the need for third parties in their systems. Blockchain technology and Decentralized Autonomous Organizations (DAOs) incentivize this development by pleding for free and global trade.

Whether motivated by crypto-economic aspects or not, decentralized applications demand for new technological frameworks and revisited concerns of usability. With _local-first software_, @kleppmann2019 introduced a manifesto for collaborative applications that store data locally.

Could this serve as a foundation for rediscovering hypertext annotation?

## Research Goals and Related Publications {#sec:intro:meta}

The initial research question for this thesis emerged out of a personal frustration about the status quo of platform-centric tools, affecting the modalities of annotation on the web: Could P2P networks and local-first software serve as a foundation for rediscovering hypertext annotation?

Arguably, P2P systems have their downsides, which I will outline later in this thesis. During last year, I had the opportunity of joining various academic gatherings, one of which was the ACM Hypertext Conference in Hof, Germany. This left me with plenty of room for discussing digital annotation with scholars of the Digital Humanities and Computer Science. Some approved my concerns on digital ownership, others objected the use of P2P systems and less authorative control. After all, academia is a highly hierarchical structure with countless authorities involved. This left me with posing the research questions around the actual _feasibility_ of such systems by exploring benefits for digital, scholarly workflows:

1. How do users perceive collaborative workflows on digital annotation in contemporary Digital Humanities tools?
2. How can personal ownership and institutional governance be considered in a P2P architecture with distributed governance?
3. How could a system be realized technically with such considerations?

Throughout this project, I had the opportunity to talk and write publicly about the contribution of this thesis: an architecture for distributed digital annotation called _Hyperwell_. First, I gave a talk titled _From Me to You: Peer-to-Peer Collaboration With Linked Data_ at the second DARIAH Digital Humanities workshop at the University of Neuchâtel, Switzerland. A short paper about the Hyperwell architecture (co-authored by my thesis supervisor, Dr. Thomas Köntges) was published in the workshop proceedings [@kassel2020a] as an open publication on the newly released DARIAH Campus[^dariah-campus] website. 

Second, Chiara Palladino from Furman University and I collaborated on a joint open publication on using Recogito, an open annotation environment, for collaborative learning in classrooms. The results of the study described in chapter \ref{sec:study} yielded not only feedback on collaborative annotation in general, but also on how students could collaborate with digital tools in classrooms. A forthcoming open publication and an accompanying blog post[^pelagios-blog-post] on the Pelagios blog set out to provide educators with insights on how (digital) classes could benefit from using collaborative environments such as Recogito.

In order to build Hyperwell, I have sketched user interfaces using graphics tools and created prototypical implementations. The centerpiece of Hyperwell is---as I will explain later---a gateway server that bridges the P2P network into the web. While the the official print version of this thesis contains all affiliated code repositories, I have decided to separately openly publish the gateway server [@kassel2020]. Further affiliated software is available on the Hyperwell project's page on GitHub[^hyperwell-project].

[^dariah-campus]: <https://campus.dariah.eu/>.
[^hyperwell-project]: <https://github.com/hyperwell>.

## Synopsis {#sec::synopsis}

This thesis is aimed towards readers with an affinity for computer technology, but not _necessarily_ computer scientists. While my own practice resides in computer science, this work involves research on digital collaborative systems, collaborative research workflows, and digital ownership. By incorporating novel technologies that effectively concern research data management, I attempt to _convince_ readers with a non-technical background to reflect on their digital practice. For this matter, parts of this thesis with less technical ambition will be highlighted below.

Throughout parts of this thesis, I will use a technological vocabulary and related terminology. _P2P, DHT, TCP_, such acronyms majorly describe concepts and technology related to computer networks. I aspire to successively introduce such terms as I progress, yet readers may find it helpful to conduct the list of abbreviations in the front matter of this thesis.

Followign this introduction, chapter \ref{sec:related} contains a discussion of related work that concerns hypertext, digital annotation, P2P applications, and research infrastructure in the Digital Humanities. Mostly focusing on scholarly research, I will cover fundamental and academically documented technology that is used in this thesis throughout that chapter. I will state further technological decisions in footnotes in later parts of this thesis.

In chapter \ref{sec:study}, I will address a study on collaborative annotation workflows in the Digital Humanities. Arguing for shift in personal data ownership, particularly on annotation, I will discuss aspects of governance on power on decentralized and distributed systems in chapter \ref{sec:annotation}. For a sustainable, ownership-preserving separation of personal and public data on P2P systems, I introduce the notions of digital notebooks and public entities.

@Sec:implementation concerns the technical work of the thesis. I will present two designs and their respective implementations of an architecture for decentralized, collaborative annotation called Hyperwell. I will then discuss observations, issues, and shortcomings in chapter \ref{sec:discussion}. Chapter \ref{sec:conclusion} will then the revisit the contributions of this thesis and sketch future work.

