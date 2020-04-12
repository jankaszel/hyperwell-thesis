# Related Work {#sec:related}

Considering the three aspects of this work’s research goals described in the introduction: _usability_, _feasibility_, and _interoperability_ of a decentralized annotation system. Touching the foundation of the Web as we know it today, but also notions of digital text in general, I will go into early work on Hypertext systems by Ted Nelson---most prominently, Xanadu---and others in @sec:related:hypertext, while discussing early notions of digital annotation and collaborative hypertext systems, including contemporary tools. [@Sec:related:ld-dh] will provide an overview of Linked Data, as well as a brief survey of digital tools in academic Digital Humanities research and how these tools integrate with Linked Data and the Semantic Web. More fundamental in Digital Humanities projects, research data management (RDM) is becoming increasingly important---in [@sec:related:rdm], I will thus discuss contemporary approaches to RDM and potential technical solutions to common issues in data repositories, such as versioning of changes. Subsequently, P2P technologies can benefit workflows in academic research, namely distributed networking and decentralized data exchange. Also considering further implications for RDM, fundamental P2P technologies as well as some exemplary systems are discussed in [@sec:related:p2p]. And finally, building upon the subjects explained before in this chapter, local-first applications draw prospects in terms of usability for data availability, data ownership, and real-time remote collaboration, among others, (...) by leveraging contemporary P2P technology. I will discuss local-first applications in @sec:related:local-first.

## Collaboration in Hypertext Systems {#sec:related:hypertext}
 
In particular, work by @nelson1993. Talk about success of hyperlinks (maybe take Notion as an editing environment?).

Digital annotation and hypertext [@marshall1997; @marshall1998].

Digital collaboration and hypertext [@klokmose2015]. Collaboration in academia [@hunyadi2016]. Collaboration and virtual spaces in general---what is real-time collaboration? (maybe find something that leads to a definition of some sort, like: commonly synchronized actions resemble the actions within a physical space).

Technological aspects of collaboration in hypertext---that is, WebSocket connections or WebRTC, and how these can be leveraged to realize real-time collaboration.

## Linked Data and Digital Humanities {#sec:related:ld-dh}

Something on Linked Data, its origin and principles [@bizer2011; @mansour2016].

How are resources treated in the Digital Humanities? Canonical text systems such as CTS have been available for a couple of years, and IIIF is currently emerging and becoming more popular among GLAM institutions. CTS and IIIF both support addressing canonical resources via unique identifiers, being it HTTP URIs (IIIF) or CTS URNs (CTS).

Web Annotation specification [@sanderson2013; @web-anno-protocol; @web-anno-data-model]. Hypothes.is[^hypothesis]. Dokieli [^dokieli] [@capadisli2019]. Annotea [@kahan2002].

Listing: An example annotation in form of a JSON-LD-based Web Annotation, as provided by the Web Annotation data model technical report [@web-anno-data-model].

```{#lst:web-annotation-model .json}
{
  "@context": "http://www.w3.org/ns/anno.jsonld",
  "id": "http://example.org/anno5",
  "type": "Annotation",
  "body": {
    "type" : "TextualBody",
    "value" : "<p>j'adore !</p>",
    "format" : "text/html",
    "language" : "fr"
  },
  "target": "http://example.org/photo1"
}
```

Digital Humanities---being an inherently digital discipline---concerns various interdisciplinary fields of research such as digital archeology, digital history, and digital classics. Hence, the landscape of tools and infrastructure in Digital Humanities research is vast and yet lacks a dedicated overvier. However, initiatives such as the EU-funded DARIAH[^dariah] set out to collect as well as increase literacy in digital tools, providing a dedicated infrastructure available to a pan-European audience of research groups. 

_TODO:_ Have a screenshot of Recogito.

Tools using Web Annotation—namely, Recogito [@simon2015; @simon2017]. Talking about Recogito, it leverages the prospect of referencing places via Linked Data principles, as Recogito supports importing shared online gazetteers with each place of a gazetteers being assigned a Uniform Resource Identifier (URI) [@simon2015]. Give an overview of some Digital Humanities tools, such as Recogito or Ugarit, to emphasize the distinction between institutional and personal research data.

[^hypothesis]: <https://hypothes.is/>
[^dokieli]: <https://dokie.li/>
[^dariah]: <https://www.dariah.eu/>

## Research Data Management {#sec:related:rdm}

FAIR principles [@wilkinson2016]. But, ‘reference rot’—dead links and changing data—is a serious issue [@robinson2018], which could be fixed by introducing new technologies for storing and distributing data. I will go into more detail on that in @sec:related:p2p.

## Peer-to-Peer Technology {#sec:related:p2p}

TODO: Quick introduction on what _protocol_ means in this context---that is, a well-defined specification of how two or more computers should communicate in a network. More generally, this has implications on, first, how these machines connect (networking) and, second, how data is exchanged between these machines and distributed among a set of computers within the network.

P2P systems take a peculiar role in popular culture: Napster, Gnutella [@chawathe2003], and Bitcoin [@legout2007] all are P2P systems that became hugely popular for sharing copyrighted content. Despite the question of the legality of their application in that context, they were pretty efficient. Mainly because of the following two properties: First, if individuals or a group of users share data in real-time, such as during a Skype video call [@guha2015], centralized systems pose a huge bottleneck. Second, if resources are distributed among a network of computers, their joined computing power and bandwidth can be more efficient than having one high-tier centralized service.

![Architectures of communication networks [@baran1964]](figures/network-architectures.png){#fig:related:architectures short-caption="Architectures of communication networks"}

@Fig:related:architectures depicts three different network layouts with each node of the network connected to others by particular strategies. The second architecture, a decentralized network, has … . In a way, the web (as of HTTP-web) … (client/server) . Despite the web’s tending towards openness, interoperability, and standardization, monopolistic platforms such as Facebook tend to channel all communications via themselves in an effort to generate ‘network effects’—user interactivity—in order to generate user profiles and, hence, income via targeted advertising [@srnicek2017].

P2P systems such as the file sharing systems introduced above establish less control structures and less authority: All peers in a network are alike and transmit data directly. This kind of topology is depicted in the third architecture of @fig:related:architectures.

Comparing to the way computers communicate in the web, there are no definite sources of authority, and hence knowledge, on where to find which piece of data—a web browser can simply translate a domain name such as `eff.org` via the Dynamic Name System (DNS) into an IP address, connect to the respective machine via TCP/IP, and request data via HTTP (Hypertext Transport Protocol). Consequently, it boils down to three particular issues for decentralized systems:
* Discovery: Where to find particular pieces of data?
* Validity: As datasets are distributed among several nodes in the network, 
* Authority

P2P systems are often associated with distributed networking and distributed databases. Essentially, systems such as the aforementioned BitTorrent and Gnutella construct immensely scaled, distributed, and fragmented databases that communicate over a vast worldwide network instead of a Local Area Network (LAN).

Certain primitives known from highly efficient enterprise systems are applied to P2P systems,

> A log is perhaps the simplest possible storage abstraction. It is an append-only, totally-ordered sequence of records ordered by time. [@kreps2013]

_TODO:_ Append-only logs [@kreps2013].

Issues commonly arise when two actors change the same property on a piece of data: If two people were to edit a paragraph of text collaboratively in the same shared document, and they edited the same word at the same time before synchronizing, this situation would cause a conflict. A centralized authority can occasionally solve such conflicts by applying particular sets of rules for conflict resolution, but distributing authority over a data structure ... . For use in such environments were changes and conflicts can occur frequently, Conflict-free Replicated Data Types (CRDTs) can be used. They have been documented by [@shapiro2011] and first emerged from large-scale distributed databases, but CRDTs are flexible and can be applied to a variety of circumstances, such as distributed collaborative systems. CRDTs consist of these components: ... . As CRDTs gained popularity among developers for building apps with offline capabilities among other features, implementations for various platforms and programming environments emerged[^crdt-website].

\citeauthor{kleppmann2017} applied the methodologies of CRDTs to JSON data structures. ... . With web technologies becoming increasingly popular among web and application developers alike, being able to use CRDT capabilities on JSON data facilitates better real-time synchronization. With local-first applications, \citeauthor{kleppmann2019} provide a curation of features that can be leveraged to realize state-of-the-art, offline-capable applications. I will discuss these kinds of applications in @sec:related:local-first.

_TODO:_ Distributed Hash Tables (DHTs) [@maymounkov2002].

_TODO:_ Introduce contemporary systems that leverage these fundamentals: IPFS [@benet2014] and Dat [@robinson2018] (compare to Git[^git]). Build bridge over to supporting infrastructure for distributed networks.

Federated systems pose an interesting trade-off between decentralization and full distribution by designing the system as distributed among several instances, yet still composing one singular social network. @esguerra2011 surveys such federated social networks, as issues around privacy and censorship of large-scale social networks such as Facebook and Twitter arose: "Federated social networks [...] are a vital step towards fulfilling values often lacking in the existing social networking ecosystem: user-control, diversity of services, innovation, and more." While the federated social network Diaspora[^diaspora] originally gained some traction, Mastodon[^mastodon] become increasingly popular over the recent years, with about 3.9 Million users across about 2.600 instances as of right now[^fediverse-network]. By implementing the ActivityPub protocol [@activitypub], 

_TODO:_ Such federated systems strike the balance, as individuals can extend the network by hosting their own instances. These instances communicate with each other using the ActivityPub protocol (_TODO:_ explicate!) via server-to-server communication---whereas in fully distributed networks, peers (and thus, clients) communicate directly without middlemen, this approach of federation supports the presence of servers while providing users with choices on where they want to store their data.

_TODO:_ @antoniou2011 on distributed social networks? Mirrors. P2P pinning.

[^git]: <https://git-scm.com/>
[^crdt-website]: The [crdt.tech](https://crdt.tech/) website curates lists of various CRDT implementations complemented by related research papers and a brief documentation around CRDTs: <https://crdt.tech/>
[^diaspora]: <https://diasporafoundation.org/>
[^mastodon]: <https://joinmastodon.org/>
[^fediverse-network]: The [fediverse.network](https://fediverse.network/) website provides various usage and network statistics on such as Mastodon, PeerTube, and WordPress: <https://fediverse.network/mastodon>. The statistics mentioned on Mastodon were current as of April 8, 2020.

## Local-First Applications {#sec:related:local-first}

Classic HTTP client-server architecture.

In 2019, \citeauthor{kleppmann2019} coined the term of ‘local-first applications’. In a paper called \citetitle{kleppmann2019}, 

The technologies used by this approach leverage contemporary P2P approaches.

Emphasize benefits of data ownership, self-hosting, whatever, with personal data and/or research data.

Real-time collaboration? Figma, Google Docs, Trello, Git, Miro, Screen.so, …

