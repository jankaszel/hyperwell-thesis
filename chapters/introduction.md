# Introduction {#introduction}

In mid-2019, I learned about a joint venture between two large digital libraries of US universities to create an interoperable annotation system for their digital reading environments. While leveraging open web standards and Linked Data for this task sounded reasonable to me, 

Meanwhile, some communities in between economics, computer scientist, and sociology were following the ongoing hype of _decentralization_: 

Thus, technologies for _theoretically_ decentralizing a system have been researched extensively, but the aspects of how to make this functionality accessible to users are still opaque.

Some of these aspects can be reduced to the question of data availability: In a decentralized system, there is no single source of truth, no singular authority[^authority].

Why doesn’t yet such a system exist, and how could it look like? It’s versatile, and not limited to academia. Standards exist!

Feedback showed that stakeholders and users are hard to convince: While centralized platforms pose some threats towards privacy and data ownership, they work deterministically given that one offers them trust.

## The Web and Data Ownership

The internet has historically considered the client-server architecture a natural part of its architecture.

![Communication networks architectures](figures/network-architectures.png)

_Introduce platforms_ [@srnicek2017]

Platforms bear a very strong notion of servers in the client-server model.

Issues on data ownership arise when storing personal data on centralized services.

_Introduce federated systems_

…

_Introduce decentralized, distributed systems_

## Collaboration in the Digital Humanities

The Humanities are one of the world’s oldest research areas, gathering and discovering knowledge about our own history, being, and society [@davidson2008]. (Transition to digital humanities and, hence, a transition from analog to digital artifacts).

With the wake of technological development that happened after the bust of the dot-com bubble in 2001, the internet became more open and accessible to the common people, as opposed to purely experts (Davidson, 2008). Collaboration, again, has been facilitated by this change, as the web tended towards social media, sharing of resources, and semantic description of data. 

Not only has the subject’s _habitus_ adopted this transformation: Most of humanities’ contemporary expression is of digital nature—take modern literature, for instance, where Silvia Hartmann populates the progress on her work in real-time via Google Docs [@kirschenbaum2016].

But even more, the scholarly methodologies considering the matters of the pre-digital ages changed. With the rise of Natural Language Processing (NLP) of commonly approachable Machine Learning, (more about what’s currently possible, and since when. @terras2016 might be useful!).

Physical artifacts became digital resources, analogue workflows became digital ones. The digital nature of the contemporary humanist’s work suddenly demanded additional, extensive knowledge of gathering, analyzing, and maintaining data repositories. Best practices were formed, namely the FAIR principles [@wilkinson2016]: Findable, Accessible, Interoperable, and Reusable data. 

<!-- transitioning to collaboration -->
Being an umbrella for various disciplines, the Humanities historically embraced academic collaboration to a great extend [@siemens2015].

Something on Linked Data [@simon2015; @simon2017]?

Something on annotation [@marshall1997; @marshall1998; @sanderson2013; @kahan2002]?



In the wake of the new web, the wake of technological development that happened after the bust of the dot-com bubble in 2001, the internet became more open and accessible to the common people, as opposed to purely experts (Davidson, 2008). Collaboration, again, has been facilitated by this change, as the web tended towards social media, sharing of resources, and semantic description of data.

## Nonlinear Documents with Hypertext

> Well, by ‘hypertext’ I mean non-sequential writing--text that branches and allows choices to the reader, best read at an interactive screen. [@nelson1993]

The way humanity treats its expression sets implications on how research can reflect on these. @marshall1997 introduced a fundamental notion on this in regard to books and readers’ markings: The physical representation of a book bears the respective physical limitations of adding further information to paper-based text—being it highlights or marginal notes, for instance. (…)

The digital medium, however, lifts those physical limitations. Almost encouragingly, adding annotations to a digital text is just a matter of switching bits from zero to one. (…)

## Peer-to-Peer Systems

## Research Goals

Throughout earlier phases of this work, the initial research question emerged out of a personal frustration about the status quo of platform-centric tools in the Digital Humanities:

> How could a decentralized application for annotations be realized in the environment of tools and platforms in Digital Humanities research?

This open-ended question carries a belief on the benefit of decentralized storage for users, computer scientists commonly tend to approach technical solutions before questioning user needs. However, research and feedback showed that platforms—as they are servers—are not necessarily evil: Federated services

1. Is there a structural issue with personal data such as annotations in contemporary services on the web?
1. How do users perceive real-time collaboration on digital annotation in contemporary Digital Humanities tools?
2. What kind of architecture could provide personal, distributed storage, and fit the requirements of academic Digital Humanities research?


## Thesis Structure

The subsequent chapter [related-work] contains a discussion of related work: research on digital annotation, decentralized applications, and Digital Humanities infrastructure. Chapter [text-and-ownership] concerns the theory behind Hypertext, its relations to data ownership, and implications on digital annotation. Focusing on the collaboration aspects of collaboration, the design and results of a user testing study with collaborative annotating on the Recogito platform will be examined in chapter [collaboration-study]. Chapter [hyperwell-implementation] concerns the technical part of this work with Hyperwell, an architecture for decentralized, collaborative annotation.

[^authority]: This certainly depends on the particular design of a decentralized system. For the sake of consistency, I assume such a system of completely decentralized authority in the following9 if not noted otherwise.
