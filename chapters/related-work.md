# Related Work {#sec:related}

Considering the three aspects of this work’s research goals described in the introduction: usability, feasibility, and compatibility of a decentralized annotation system. Touching the foundation of the web as we know it today, but also notions of digital text in general, I will go into early work on Hypertext systems by Ted Nelson and others in @sec:related:hypertext, while also considering alternative approaches and early notions of digital annotation. [@Sec:related:ld-dh; @sec:related:hypertext] will do … .

## Hypertext Systems and Digital Text Theory {#sec:related:hypertext}
 
In particular, work by @nelson1993. Talk about success of hyperlinks (maybe take Notion as an editing environment?)
 
## Linked Data and Digital Humanities {#sec:related:ld-dh}

Something on Linked Data, its origin and principles [@bizer2011].

How are resources treated in the Digital Humanities? Canonical text systems such as CTS have been available for a couple of years, and IIIF is currently emerging and becoming more popular among GLAM institutions. Give an overview of some Digital Humanities tools, such as Recogito or Ugarit, to emphasize the distinction between institutional and personal research data.

Web Annotation specification [@sanderson2013]. Hypothes.is[^https://hypothes.is/]. Dokieli[^https://dokie.li/] [@capadisli2017]. Annotea [@kahan2002].

Tools using these—namely, Recogito [@simon2015; @simon2017].

## Local-First Applications {#sec:related:local-first}

In 2019, \citeauthor{kleppmann2019} coined the term of ‘local-first applications’. In a paper called \citetitle{kleppmann2019}, 

The technologies used by this approach leverage contemporary P2P approaches.

Emphasize benefits of data ownership, self-hosting, whatever, with personal data and/or research data.

Real-time collaboration? Figma, Google Docs, Trello, Git, Miro, Screen.so, …

## P2P Technology {#sec:related:p2p}

P2P systems take a peculiar role in popular culture: Napster, Gnutella [@chawathe2003], and Bitcoin [@legout2007] all are P2P systems that became hugely popular for sharing copyrighted content. Despite the question of the legality of their application in that context, they were pretty efficient. Mainly because of the following two properties: First, if individuals or a group of users share data in real-time, such as during a Skype video call [@guha2015], centralized systems pose a huge bottleneck. Second, if resources are distributed among a network of computers, their joined computing power and bandwidth can be more efficient than having one high-tier centralized service.

![Communication networks architectures [@baran1964]](figures/network-architectures.png){#fig:related:architectures}

@Fig:related:architectures depicts three different network layouts with each node of the network connected to others by particular strategies. The second architecture, a decentralized network, has . In a way, the web (as of HTTP-web) … (client/server) . Despite the web’s tending towards openness, interoperability, and standardization, monopolistic platforms such as Facebook tend to channel all communications via themselves in an effort to generate ‘network effects’—user interactivity—in order to generate user profiles and, hence, income via targeted advertising [@srnicek2017].

P2P systems such as the file sharing systems mentioned above establish less control structures and less authority: All peers in a network are alike and 

Comparing to the way computers communicate in the web,

> Describe the fundamental technologies first: Append-only logs [@kreps2013], Distributed Hash Tables (DHTs) [@maymounkov2002], Conflict-Free Replicated Data Types (CRDTs) [@shapiro2011; @kleppmann2017].

P2P systems are often associated with distributed networking and distributed databases. Essentially, systems such as the aforementioned BitTorrent and Gnutella construct immensely scaled, distributed, and fragmented databases that communicate over a vast worldwide network instead of a Local Area Network (LAN).

certain primitives known from highly efficient enterprise systems are applied to P2P systems,

Introduce contemporary systems that leverage these fundamentals: IPFS [@benet2014] and Dat [@robinson2018].

Federated networks. Mirrors. P2P pinning.
