# Introduction {#introduction}



## The Web and Data Ownership

The internet has historically considered the client-server architecture a natural part of its architecture.

![Communication networks architectures](figures/network-architectures.png)

_Introduce platforms_

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


## Drafts Stuff

### Recogito

Using annotation to enhance source material with additional information is a practice commonly used in the Humanities, as it provides an environment for connecting sources with one’s personal thoughts. The emergence of digital tools in the Humanities then brought not only the likes of computational methods, but also made the social aspects of the internet more approachable to non-experts (Davidson, 2008).

This caused two particular implications. Collaboration, an artifact of particular importance in the interdisciplinary nature of Humanities research, enabled working on the same resources with multiple people involved, exchanging their findings—though, digitally—in real-time. Furthermore, the rise of the Semantic Web with Linked Data actually imposed semantic meaning on data itself: Digital entities could reference each other and describe their relations in more depth.

Recogito, a project by the Pelagios Commons, takes on to leverage Linked Data for spatial annotation. Digital gazetteers, such as the Digital Atlas of the Roman Empire (DARE, https://dh.gu.se/dare/), can be imported into Recogito and tagged from within a resource like, for example, the Iliad, exposing semantic relationships (Simon et al., 2017). A separate map view on Recogito plots these relations on a map and allows for exploring them visually. Annotations on such a resource can then be shared with fellow users, providing opportunities for further contributions.

Exploring historic artifacts in such ways provides new ways of perceiving historic information. Besides being beneficial, this could even more benefit educational programs in the Classics. We set out to explore these prospects in a user testing session, involving students at Furman University in a semi-controlled environment … 

The takeaways of this publication are two-fold: First, we present two modular dataset created by the participants during both sessions on the mentioned resources—the Iliad’s Catalog of Ships, and the Tabula Tabula Peutingeriana. They contain georeferences for many places as well as annotations relating to people, events, and general remarks. These datasets are available in various formats and can easily be imported into Recogito.

Second, we present an overview of the survey and analytics results received during the sessions, focusing on the perceived benefits of spatial annotation and collaboration, as well as the general user experience.

