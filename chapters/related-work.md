# Related Work {#sec:related}

In the following, I will outline the background of this thesis in a brief review of related literature and projects, covering this work’s research goals of _feasibility_, _usability_, and _interoperability_ of a decentralized annotation system. As opposed to the later @sec:annotation, in this chapter I attempt to draw a cohesive, non-judgmental picture of related work. The discussed works are _intertwingled_[^intertwingled] to a certain degree, but I will try to cover them in chronological order.

This includes development of hypertext systems and the world-wide web, digital libraries, and digital annotation in @sec:related:hypertext and the contemporary development of real-time collaborative web applications in @sec:related:collaboration. In @sec:related:ld-dh, I will highlight the prospects of Linked Data and its impact on the Digital Humanities, followed by a brief discussion of fundamental peer-to-peer technology and file-sharing systems in @sec:related:p2p. Finally, in @sec:related:local-first I connect the earlier aspects of real-time collaboration, hypertext, and decentralization, in order to outline a recent development known as _local-first applications_.

[^intertwingled]: \citeauthor{nelson1987b} coined this term in his 1974 book, "\citetitle{nelson1987b}", in order to describe the complex relations of human knowledge.

## Hypertext and Annotation {#sec:related:hypertext}
 
Influenced by early works on interactive knowledge processing such as Vannevar Bush's _Memex_, the concept of hypertext has initially been defined by \citeauthor{nelson1965} in \citeyear{nelson1965}:

> _[Hypertext] mean[s] a body of written or pictorial material interconnected in such a complex way that it could not conveniently be presented or represented on paper. It may contain sunmmries, or maps of its contents and their interrelations; it may contain annotations, additions and footnotes from scholars who have examined it._ [@nelson1965]

Particularly relations between documents known as _hyperlinks_ became popular among hypertext pioneers, enabling writers and readers alike to explore text in a non-sequential way. In "\citetitle{nelson1993}"---a print publication that has actually been designed as hypertext---\citeauthor{nelson1993} sketches a system called *Xanadu* that goes even further and processes chunks of digital texts into entire documents, backed by a network of servers for managing these units (@fig:xanalogical-storage). Called _transclusion_, the resulting documents would be composed of the aforementioned chunks, and documents as well as chunks themselves were to be stored with each their editing history, something \citeauthor{nelson1993} calls "an evolving ongoing braid" [@nelson1993, 2/14f]. Furthermore, document servers would manage documents by 

![Documents created by transclusion of units from xanalogical storage in Xanadu [@nelson1993, 0/6]. These units can be standalone pieces of text or digital media and have links inbetween them.](figures/nelson-xanalogical-storage.png){#fig:xanalogical-storage short-caption="Documents created by transclusion of units from xanalogical storage"}

While there had been work on a multitude of hypertext systems[^hypertext-timeline], the World Wide Web (WWW), invented by Tim Berners-Lee, became to what we today refer to as the _web_ [@berners-lee1989a]. He subsequently realized into a dedicated protocol, HTTP [@fielding1999], and a specialized, hypertext-capable markup language, HTML [@berners-lee1995].

![Analysis of various types of annotation curated by @marshall1997.](figures/marshall-annotation.png){#fig:marshall-annotation short-caption="Analysis of various types of annotation"}

With the advent of world-scale hypertext systems as well as advancements in digitization of documents, the first digital libraries emerged. One such library emerged from the Perseus Project, spanning a collection of _TODO_ [@smith2000]. These digital collections of text suggested promising opportunities for digital annotation, since bodies of annotations can be related to the source virtually and thus make a publicly-accessible collection of derived semantic knowledge. For her pioneering work, \citeauthor{marshall1997} predicted such prospects and analyzed over 150 pre-owned students' books that have been shared and annotated by various generations of students [@marshall1997]. She categorized the observed annotations—e.g., underlining, high-level highlighting, marginal notes—into functional categories—e.g., abc—pictured in @fig:marshall-annotation. In a follow-up paper, \citeauthor{marshall1998} provides an outlook of how these observations could be related to hypertext annotation.

TODO: Canonical text systems such as CTS [@koentges2020] have been available for a couple of years, and IIIF is currently emerging and becoming more popular among GLAM institutions. CTS and IIIF both support addressing canonical resources via unique identifiers, being it HTTP URIs (IIIF) or CTS URNs (CTS). Another method of canonically referencing sources would be content addressing, such as IPFS---is that worth mentioning?

[^hypertext-timeline]: Jakob Voß prepared an interactive visualization of the timeline of hypertext, backend by structured knowledge on Wikidata: <http://jakobvoss.de/hypertext-timeline/>.

## Digital Real-Time Collaboration {#sec:related:collaboration}

Further advances in digital technology and, particularly, in real-time data communication via mobile networks and increased internet bandwidth, offereing further prospects of real-time collaborative work done digitally. In \citeyear{dourish1992}, \citeauthor{dourish1992} already derived requirements for shared digital workspaces from studies on remote work. Complementing the necessity of real-time _communication_ for participants (such as a voice call), they state that applications realizing real-time _collaboration_ in shared workspaces should also exchange information on the underlying digital sources and tools [@dourish1992]. To synchronize the current progress of others' work, user interfaces should carefully shift users' focus by visually emphasizing changes made by others, a concept they call _shared awareness_.

It wasn't until the next century, however, that such collaboration could be realized on the web. Initially, the web platform relied solely on HTTP for transmitting data between clients and servers. HTTP could indeed be _abused_ for this [@fette2011, p. 4], which resulted in an unwanted overhead due to the ephemerality of the protocol: HTTP-issued TCP connections are usually closed after the request-response exchange. Shared workspaces, however, as emphasized by \citeauthor{dourish1992}, demand bidirectional communication. The web platform meanwhile specified two such bidirectional, real-time communication protocols that are commonly supported in today's web browsers: the WebSocket protocol and WebRTC.

The WebSocket protocol was designed as a simple solution to the aforementioned lack of continuous, bidirectional communication on the web. By using existing HTTP connections established via TCP, and subsequently _upgrading_ them to persistent WebSocket connections, both server and client can transmit data to either side [@fette2011, p. 5ff]. The Web Real-Time Communication protocol (WebRTC) continues to establish persistent and secure connections not just between client and server, but rather as a peer-to-peer (P2P) protocol between all kinds of devices [@w3c-webrtc]. WebRTC requires a handshaking mechanism via a trusted third party---a _signaling service_---in order to exchange connection information called Interactive Connectivity Establishment (ICE). To mitigate common issues of personal devices connected via Network Address Translation (NAT) or firewalls, WebRTC relies on further technology such as STUN and TURN.

The widespread support for such technologies in current web browsers sparked a wave of web-based applications that offer spaces for real-time collaborative work. In the following, I will name some popular contestants of such tools for remote collaborative work:

* Google Docs[^google-docs], an online, collaborative word processor with elaborate support for annotation and editing.
* Trello[^trello], a collaborative project management tool that allows to assign and move tasks across different boards (i.e., domains).
* Figma[^figma], a vector-based design tool for creating and testing user interface designs. Figma allows collaboration by synchronizing the canvas with participants in real-time, as well as their cursor movements.
* Notion[^notion], an online knowledge management tool. Similar to a Wiki, Notion allows to create pages composed by building blocks such as text and multimedia. Notion shows real-time activity of other users by synchronizing as their focus moves between each such block.

[^figma]: <https://figma.com/>.
[^google-docs]: <https://docs.google.com/>.
[^trello]: <https://trello.com/>.
[^git]: <https://www.git-scm.com/>.
[^notion]: <https://notion.so/>.

## Linked Data and the Digital Humanities {#sec:related:ld-dh}

Digital Humanities, being an inherently digital discipline, concerns various interdisciplinary fields of research such as digital archeology, digital history, and digital classics. Hence, the landscape of tools and infrastructure in Digital Humanities research is vast and yet lacks a coherent overview. Initiatives such as the EU-funded DARIAH[^dariah] set out to increase literacy in digital tools, providing a dedicated infrastructure available to a pan-European audience of research groups.

\citeauthor{hinyadi2016} notes that due to its interdisciplinarity, communities in the Digital Humanities frequently collaborate remotely. Using software for real-time video conferencing, researchers quickly established video-based plenary talks and virtual conferences [@hunyadi2016]. Scholarly collaboration continues with shared digital infrastructures among labs and projects. By embracing best-practices guidelines on research data management such as the FAIR principles[^fair-principles], emancipation in the handling of digital assets is disseminated among scholars: Findability, Accessibility, Interoperability, and Reusability of research data all shall ensure that data measured, processed, and evaluated in research is properly managed [@wilkinson2016].

Linked Open Data (LOD) could meet all of these four requirements. While HTML provides elements for semantically tagging content, such  as titles, descriptions, and marginal notes, it lacked describing _pure_ data without markup. Linked Data (LD) and, more generally, the Semantic Web, aims to . The LD stack is build upon established web technologies, such as HTTP and URLs, and imposes semantic relations via triples modeled after the Resource Description Framework (RDF). With RDF triples, an external party can express the semantic relation between two entities by specifying a _subject_, a _predicate_, and an _object_[^rdf-example] [@bizer2009]. Linked Open Data continues even further and makes publicly accessible Linked Data.

With the Solid project[^solid], a group led by Berners-Lee conceived an architecture for managing personal data separately from applications and services on the web on online storage called _pubs_ [@mansour2016]. Solid introduces Linked Data Platforms (LDPs), which are services that exclusively manage Linked Data containers---i.e., semantic collections of LD items---and their related media assets. Furthermore, LDPs specify how clients can interact with the stored data via REST-based APIs[^rest-api].

LOD can play a crucial role on the realization of FAIR with data in the Digital Humanities. As LOD is publicly accessible, researchers can prepapre collections of data accordingly and publish them via HTTP, each with their own URI for referencing them as a Linked Data item. Shared online gazetters, for example, provide collections of LD-formatted places and can be semantically onto other resources, such as ancient maps and classic texts [@simon2015].

Listing: An example annotation in form of a JSON-LD-based Web Annotation, as pictured by the Web Annotation data model technical report [@web-anno-data-model]. This annotation adds a textual annotation containing the text _j'adore !_ to a web resource.

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

Give an overview of some Digital Humanities tools, such as Recogito or Ugarit [@yousef2019], to emphasize the distinction between institutional and personal research data. Hypothes.is!

The Web Annotation specification emerged from ... TODO and builds upon the previously defined concepts of LOD and LDPs [@sanderson2013]. The specification consists of two components: First, the Web Annotation Data Model, in which annotations are expressed using the JSON-LD schema. Following a versatile ontology similar to the observations from \citeauthor{marshall1997}, an annotation fundamentally consists of three properties, as pictured in @lst:web-annotation-model:

* The annotation's _identifier_, which is a web resource specified via its Internationalized Uniform Identifier (IRI, similar to an URI).
* Its _target_, which is a web resource, also specified via its IRI.
* An annotation _body_, which again can be a web resource. Alternatively, as done in @lst:web-annotation-model, the body can be provided as an inlined JSON object. For expressing a specific portion of the target resource---e.g., a piece of text, or a section of an image---a wide range of standardized _fragment selectors_ can be used.

The Web Annotation Protocol, as the second component, defines the Application Programming Interface (API) of an annotation server and thus, how client applications can transmit Web Annotations via HTTP. The API identifies annotations by their IRI[^annotation-iri] and consists of four basic verbs known from REST-based APIs: Clients can retrieve annotations (`GET`), create annotations (`POST`), update annotations (`PUT`), and delete annotations (`DELETE`). These actions can be executed on collections of annotations---semantic groups of items called _containers_ on the LDP---or the respective annotation, referred to by each their respective IRI.

With dokieli[^dokieli], \citeauthor{capadisli2017} created a publishing environment that supports storing documents on loosely-connected datastores---i.e., documents created on dokieli are not necessarily tied to it. By adhering to a multitude of LD protocols and supporting the LDP, dokieli is compliant with the aforementioned Solid architecture and attempts to support a separation between datastores and the respective applications operating on these stores. Furthermore, dokieli provides social interactions such as _liking_ sections of text and commenting by leveraging the Web Annotation protocol and data model.

![Annotating an ancient map on Recogito. Recogito allows to annotate sources, establish semantic relations---e.g., referencing places or people---and share these collections with other users.](figures/recogito-annotation.png){#fig:recogito-annotation short-caption="Annotating an ancient map on Recogito"}

Yet, the capabilities of Web Annotation are not limited to social interactions on text. Initiated by the Pelagios project[^pelagios], Recogito is a platform that has been created purposely for _semantic_ annotation [@simon2015; @simon2017]. In order to provide semantic annotation, Recogito leverages LD principles and allows to semantically tag portions of a source with LD collections, such as the aforementioned gazetteers or historic individuals. Besides text, Recogito also supports annotating static images and canonical resources, such as documents identified by CTS URNs or large-scale image galleries via International Image Interoperability Framework (IIIF).

[^dariah]: <https://www.dariah.eu/>.
[^fair-principles]: <https://www.go-fair.org/fair-principles/>.
[^rdf-example]: In RDF, objects are identified by their URIs. In an example given by \citeauthor{bizer2009}, an subject (<http://dig.csail.mit.edu/data#DIG>) relates via a predicate (<http://xmlns.com/foaf/0.1/member>) to an object (<http://www.w3.org/People/Berners-Lee/card#i>).
[^solid]: Although started by Berners-Lee at MIT, the Solid project is now managed by an affiliated commercial startup called Inrupt: <https://solidproject.org/>.
[^rest-api]: API is an acronym for Application Programming Interface. With APIs that adhere to Representional State Transfer (REST), applications can execute common actions such as creating, retrieving, and editing data via HTTP.
[^annotation-iri]: An example IRI would be: <https://www.example.com/container-name/annotation-id>.
[^dokieli]: <https://dokie.li/>.
[^pelagios]: <https://pelagios.org/>.

## Peer-to-Peer Technology {#sec:related:p2p}

TODO: Quick introduction on what _protocol_ means in this context---that is, a well-defined specification of how two or more computers should communicate in a network. More generally, this has implications on, first, how these machines connect (networking) and, second, how data is exchanged between these machines and distributed among a set of computers within the network.

P2P systems take a peculiar role in popular culture: Napster, Gnutella [@chawathe2003], and Bitcoin [@legout2007] all are P2P systems that became hugely popular for sharing copyrighted content. Despite the question of the legality of their application in that context, they were pretty efficient. Mainly because of the following two properties: First, if individuals or a group of users share data in real-time, such as during a Skype video call [@guha2005], centralized systems pose a huge bottleneck. Second, if resources are distributed among a network of computers, their joined computing power and bandwidth can be more efficient than having one high-tier centralized service.

![Architectures of communication networks [@baran1964]](figures/network-architectures.png){#fig:related:architectures short-caption="Architectures of communication networks"}

@Fig:related:architectures depicts three different network layouts with each node of the network connected to others by particular strategies. The second architecture, a decentralized network, has … . In a way, the web (as of HTTP-web) … (client/server) . Despite the web’s tending towards openness, interoperability, and standardization, monopolistic platforms such as Facebook tend to channel all communications via themselves in an effort to generate ‘network effects’—user interactivity—in order to generate user profiles and, hence, income via targeted advertising [@srnicek2017].

P2P systems such as the file sharing systems introduced above establish less control structures and less authority: All peers in a network are alike and transmit data directly. This kind of topology is depicted in the third architecture of @fig:related:architectures.

Comparing to the way computers communicate in the web, there are no definite sources of authority, and hence knowledge, on where to find which piece of data—a web browser can simply translate a domain name such as `eff.org` via the Dynamic Name System (DNS) into an IP address, connect to the respective machine via TCP/IP, and request data via the Hypertext Transport Protocol (HTTP). Consequently, it boils down to three particular issues for decentralized systems:
* Discovery: Where to find particular pieces of data?
* Validity: As datasets are distributed among several nodes in the network, 
* Authority

P2P systems are often associated with distributed networking and distributed databases. Essentially, systems such as the aforementioned BitTorrent [@legout2007; @loewenstern2020] and Gnutella [@chawathe2003] construct immensely scaled, distributed, and fragmented databases that communicate over a vast worldwide network instead of a Local Area Network (LAN).

Certain primitives known from highly efficient enterprise systems are applied to P2P systems,

> _A log is perhaps the simplest possible storage abstraction. It is an append-only, totally-ordered sequence of records ordered by time._
> 
> --- @kreps2013

_The Log_—or more precisely, the append-only log—is a list-based data structure that exclusively allows the addition of entries but no other mutations [@kreps2013]. Popularized by stream processing frameworks like Apache Kafka[^apache-kafka] and Apache Samza[^apache-samza], as well replication in databases cluster, append-only logs treat the current state of a database as a chronological sequence of changes rather than a definite state. A fundamental property of append-only logs is their distribution: Entries of a log reference to each other via their content-addressing hashes, and thus, if an actor of a distributed systems mutates a prior entry, all following hashes will change and the log will break. _TODO:_ Elaborate more?

Interestingly, append-only logs can be compared to Nelson's early concept of document processing on Xanadu, where documents were stored as their editing changes rather than an entire document for each version.

_TODO:_ Distributed Hash Tables (DHTs) [@maymounkov2002].

_TODO:_ Introduce contemporary systems that leverage these fundamentals: IPFS [@benet2014] and Dat [@robinson2018] (compare to Git[^git]). Build bridge over to supporting infrastructure for distributed networks. Secure Scuttlebutt [@tarr2019].

Federated systems pose an interesting trade-off between decentralization and full distribution by designing the system as distributed among several instances, yet still composing one singular social network. @esguerra2011 surveys such federated social networks, as issues around privacy and censorship of large-scale social networks such as Facebook and Twitter arose: "Federated social networks [...] are a vital step towards fulfilling values often lacking in the existing social networking ecosystem: user-control, diversity of services, innovation, and more." While the federated social network Diaspora[^diaspora] originally gained some traction, Mastodon[^mastodon] become increasingly popular over the recent years, with about 3.9 Million users across about 2.600 instances as of right now[^fediverse-network]. By implementing the ActivityPub protocol [@activitypub], 

_TODO:_ Such federated systems strike the balance, as individuals can extend the network by hosting their own instances. These instances communicate with each other using the ActivityPub protocol (_TODO:_ explicate!) via server-to-server communication---whereas in fully distributed networks, peers (and thus, clients) communicate directly without middlemen, this approach of federation supports the presence of servers while providing users with choices on where they want to store their data.

_TODO:_ @antoniou2011 on distributed social networks? Mirrors. P2P pinning.

[^git]: <https://git-scm.com/>.
[^diaspora]: <https://diasporafoundation.org/>.
[^mastodon]: <https://joinmastodon.org/>.
[^fediverse-network]: The [fediverse.network](https://fediverse.network/) website provides various usage and network statistics on such as Mastodon, PeerTube, and WordPress: <https://fediverse.network/mastodon>. The statistics mentioned on Mastodon were current as of April 8, 2020.

[^apache-kafka]: <https://kafka.apache.org/>.
[^apache-samza]: <https://samza.apache.org/>.

## Local-First Applications {#sec:related:local-first}

Classic HTTP client-server architecture.

Interestingly, few to none of the collaboration tools mentioned in @sec:related:collaboration work when not connected the internet or, more specificially, the _cloud_.

In 2019, \citeauthor{kleppmann2019} coined the term of ‘local-first applications’. In a paper called \citetitle{kleppmann2019}, the authors propose a set of requirements for a type of application that overcomes common issues of contemporary collaboration software: As businesses increasingly rely on cloud-backend infrastructure for their applications, … . 

With a follow-up, proof-of-concept application called ‘PushPin’, \citeauthor{hardenberg2020} implemented a local-first application by utilizing hypermerge as foundation for the application’s data storage. Several take-aways emerged from their work, including the benefits of Functional Reactive Programming (FRP) for user interfaces displaying real-time updates and ongoing issues around privacy, security, and usability [@hardenberg2020].

Issues commonly arise when two actors change the same property on a piece of data: If two people were to edit a paragraph of text collaboratively in the same shared document, and they edited the same word at the same time before synchronizing, this situation would cause a conflict. A centralized authority can occasionally solve such conflicts by applying particular sets of rules for conflict resolution, but distributing authority over a data structure ... . For use in such environments were changes and conflicts can occur frequently, Conflict-free Replicated Data Types (CRDTs) can be used. They have been documented by [@shapiro2011] and first emerged from large-scale distributed databases, but CRDTs are flexible and can be applied to a variety of circumstances, such as distributed collaborative systems. CRDTs consist of these components: ... . As CRDTs gained popularity among developers for building apps with offline capabilities among other features, implementations for various platforms and programming environments emerged[^crdt-website].

\citeauthor{kleppmann2017} applied the methodologies of CRDTs to JSON data structures. ... [@kleppmann2017; @kleppmann2018]. With web technologies becoming increasingly popular among web and application developers alike, being able to use CRDT capabilities on JSON data facilitates better real-time synchronization.

_TODO:_ The technologies used by this approach leverage contemporary P2P primitives. I have visited some of them before in this chapter (@sec:related:p2p)—most fundamentally, a distributed system for sharing of data can be reduced to the issues of discovery, 

Emphasize prospects of data ownership, self-hosting, whatever, with personal data and/or research data.

[^crdt-website]: The [crdt.tech](https://crdt.tech/) website curates lists of various CRDT implementations complemented by related research papers and a brief documentation around CRDTs: <https://crdt.tech/>.
