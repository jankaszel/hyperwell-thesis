# Introduction {#introduction}

_TODO/Ignore:_ In mid-2019, I learned about a joint venture between two large digital libraries of US universities to create an interoperable annotation system for their digital reading environments. While leveraging open web standards and Linked Data for this task sounded reasonable to me, 

Meanwhile, some communities in between economics, computer scientist, and sociology were following the ongoing hype of _decentralization_: 

Thus, technologies for _theoretically_ decentralizing a system have been researched extensively, but the aspects of how to make this functionality accessible to users are still opaque.

Some of these aspects can be reduced to the question of data availability: In a decentralized system, there is no single source of truth, no singular authority[^authority].

Why does such a system not exist yet, and how could it look like? It’s versatile, and not limited to academia. Standards exist!

Feedback showed that stakeholders and users are hard to convince: While centralized platforms pose some threats towards privacy and data ownership, they work deterministically given that one offers them trust.

This thesis is aimed at readers with an affinity for computer technology, but not _necessarily_ computer scientists. While my own practice resides in computer science, this work involved research on collaborative systems as well as collaboration in the Digital Humanities, conducting studies, and raising questions on digital ownership. Furthermore, by presenting novel technologies that affect research data management, I want to _convince_ readers with a non-technical background to reflect on their digital practice. Parts of this thesis with less technical ambition will be highlighted below in @sec:structure.

In many parts of this thesis, I will use a technological vocabulary. _P2P, DHT, TCP_—most of these abbreviations describe concepts and technology related to (decentralized) networks, while other terms relate to more abstract ideas. I aspire to introduce this vocabulary consequentially throughout this thesis, yet readers may find it helpful to conduct either the list of abbreviations or the glossary (_TODO_).

## The Web and Data Ownership

> Well, by ‘hypertext’ I mean non-sequential writing--text that branches and allows choices to the reader, best read at an interactive screen. [@nelson1993]

The way humanity treats its expression sets implications on how research can reflect on these. @marshall1997 introduced a fundamental notion on this in regard to books and readers’ markings: The physical representation of a book bears the respective physical limitations of adding further information to paper-based text—being it highlights or marginal notes, for instance. The digital medium, however, lifts those physical limitations. Almost encouragingly, adding annotations to a digital text is just a matter of switching bits from zero to one. (…)

The Web has historically considered the client-server architecture a natural part of its architecture.

> When data is stored on “someone else’s computer”, that third party assumes a degree of control over that data. Cloud apps are provided as a service; if the service is unavailable, you cannot use the software, and you can no longer access your data created with that software. If the service shuts down, even though you might be able to export your data, without the servers there is normally no way for you to continue running your own copy of that software. Thus, you are at the mercy of the company providing the service. [@kleppmann2019]

Introduce commercial platforms on the internet, also platform capitalism [@srnicek2017], and give a note on how the internet benefits businesses rather than individuals [@robinson2018]. Platforms bear a very strong notion of servers in the client-server model---technically as well as strategically. Issues on data ownership arise when storing personal data on centralized services.

_TODO:_ Federated systems can overcome some of these limitations.

_Introduce decentralized, distributed systems_

## Collaboration in the Digital Humanities

The Humanities are one of the world’s oldest research areas, gathering and discovering knowledge about our own history, being, and society [@davidson2008]. (Transition to digital humanities and, hence, a transition from analog to digital artifacts). With the wake of technological development that happened after the bust of the dot-com bubble in 2001, the internet became more open and accessible to the common people, as opposed to purely experts (Davidson, 2008). Collaboration, again, has been facilitated by this change, as the web tended towards social media, sharing of resources, and semantic description of data. 

Not only have the subject’s habits been adapted to this transformation: Most of humanities’ contemporary expression is of digital nature—take modern literature, for instance, where Silvia Hartmann populates the progress on her work in real-time via Google Docs [@kirschenbaum2016]. But even more, the scholarly methodologies considering the matters of the pre-digital ages changed. With the rise of Natural Language Processing (NLP) of commonly approachable Machine Learning, (more about what’s currently possible, and since when. @terras2016 might be useful!).

Physical artifacts became digital resources, analogue workflows became digital ones. The digital nature of the contemporary humanist’s work suddenly demanded additional, extensive knowledge of gathering, analyzing, and maintaining data repositories. Best practices were formed, namely the FAIR principles [@wilkinson2016]: Findable, Accessible, Interoperable, and Reusable data. 

_TODO:_ Transitioning to collaboration---offline as well as online. Being an umbrella for various disciplines, the Humanities historically embraced academic collaboration to a great extend [@siemens2015]. Something on Linked Data [@simon2015; @simon2017]? Something on annotation [@marshall1997; @marshall1998; @sanderson2013; @kahan2002]?

In the wake of the new web, the wake of technological development that happened after the bust of the dot-com bubble in 2001, the internet became more open and accessible to the common people, as opposed to purely experts (Davidson, 2008). Collaboration, again, has been facilitated by this change, as the web tended towards social media, sharing of resources, and semantic description of data.

## Prospects of Peer-to-Peer Systems

_TODO:_ As laid out before, the Web bears some fundamental issues concerning centralization and ownership of personal data; that's basically why Solid [@mansour2016] has been founded, as well as other initiatives. While not going into too much detail on P2P systems, explain roughly the history and prospects of P2P systems such as Dat, which criticise the status quo and impose novel technologies, backed by distributed systems research, for realizing local-first systems.

## Research Goals

Throughout earlier phases of this work, the initial research question emerged out of a personal frustration about the status quo of platform-centric tools in the Digital Humanities:

> How could a decentralized application for annotations be realized in the environment of tools and platforms in Digital Humanities research?

This open-ended question carries a belief on the benefit of decentralized storage for users, computer scientists commonly tend to approach technical solutions before questioning user needs. However, research and feedback showed that platforms—as they are servers—are not necessarily evil: Federated services

1. Is there a structural issue with personal data such as annotations in contemporary services on the web?
2. How do users perceive real-time collaboration on digital annotation in contemporary Digital Humanities tools?
3. What kind of architecture could provide personal, distributed storage, and fit the requirements of academic Digital Humanities research?

## Related Publications & Repositories {#sec:publications}

Over the course of this whole project, I have had the opportunity to talk publicly about the architecture of Hyperwell, as laid out in @sec:hyperwell, as well as publish openly on particular results of this thesis---this additional work could not have been achieved with each its respective collaborators. First, I gave a talk titled "From Me to You: Peer-to-Peer Collaboration With Linked Data" at the second DARIAH[^dariah] Digital Humanities workshop at the University of Neuchâtel, Switzerland. A short paper about the status quo of the Hyperwell architecture has been published in the conference proceedings [@kassel2020a] with substantial support of my thesis supervisor, Dr. Thomas Koentges, as an open publication on the new DARIAH Campus[^dariah-campus]. 

Second, Chiara Palladino from Furman University and I collaborated on a joint open publication on using Recogito, an open annotation environment, for collaborative learning in classrooms. The results of the study described in @sec:study yielded not only feedback on collaborative annotation in general, but also on how students could collaborate with digital tools in classrooms. The open publication (forthcoming) and accompanying blog post[^pelagios-blog-post] on the Pelagios blog set out to provide educators with fundamental insights on how (digital) classes could benefit from using collaborational tools such as Recogito.

I have utilized  user interface design and software development for building prototypes of novel technology and architectures---mainly of the P2P systems discussed in @sec:implementation. While all of the respective code repositories are included on the digital media attached to the official print version of this thesis, a subset of these repositories---standalone software that is subject to future development sketched in @sec:future-work---are published online and are being mirrored by the Zenodo open-access repository for long-term archival. These repositories are provided with each its Digital Object Identifier[^doi] (DOI).

`from-me-to-you` (DOI: 10.xxx/foobar)
: Does things.

`hyperwell-gateway` (DOI: 10.xxx/foobar)
: HTTP gateway server implementation as designed in the Hyperwell architecture. This architecture is being discussed in @sec:hyperwell.

`hyperwell-notebook` (DOI: 10.xxx/foobar)
: Local-first application for managing and storing notebooks, i.e., collections of digital annotations of the Web Annotation data model. I outline this application in more detail in @sec:hyperwell:notebook.

`recogito-p2p-discovery`
: Standalone user interface module that provides a frontend for the discovery protocol of the first iteration, outlined in @sec:thick:discovery.

`recogito-user-testing` (DOI: 10.xxx/foobar)
: Suite of analytics and evaluation tools for digital recordings of users' actions during the collaborative annotation user testing study. The use of these analytics are being discussed in more depth in @sec:study:tracking.

`recogito2-p2p` {#sec:structure}
: Modified version of the Recogito annotation environment.

[^dariah]: <https://www.dariah.eu/>
[^dariah-campus]: <https://campus.dariah.eu/>
[^pelagios-blog-post]: Forthcoming.
[^doi]: <http://doi.org/>

## Thesis Structure {#sec:structure}

The subsequent @sec:related contains a discussion of related work and discusses research on digital annotation, decentralized applications, and Digital Humanities infrastructure. Covering scholarly research, I will there not go into detail with all fundamental and mostly non-academic technology used in this thesis and rather clarify technological decisions in the footnotes during later parts of this thesis.

@Sec:annotation concerns the theory behind Hypertext, its relations to data ownership, and implications on digital annotation. With a focus on the collaboration aspects of collaboration, the design and results of a user testing study with collaborative annotating on the Recogito platform will be examined in @sec:study. @Sec:implementation concerns the technical part of this this with two iterations of an architecture for decentralized, collaborative annotation called Hyperwell.

Revisiting issues and drawbacks faced during the work on this project, I will discuss possible shortcomings in @sec:discussion. @Sec:conclusion will then provide a short summary of this thesis, as well as outline possible future work.

[^authority]: This certainly depends on the particular design of a decentralized system. For the sake of consistency, I assume such a system of completely decentralized authority in the following if not noted otherwise.
