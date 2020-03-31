# Implementation

Each aspect of a P2P system bears implications for usability, data availability, and user emancipation: As described in the previous chapters, P2P networks can effectively use certain network structures to enforce power structures and hierarchies among peers. 

## Gateways and P2P Systems

> This will most likely be an argumentation why we need P2P gateways when working with P2P data in academia: Many platforms and tools are built with web technologies and hence are subject to the quasi-centralized architecture of the HTTP web.

Distributed P2P systems function fundamentally different from the classic client/server architectures (distributed governance figure?). The fundamental difference is explained by the treatment of data: In architectures following the established client-server distinction, such as HTTP, servers hold a monopoly of the contained data while clients request parts of this data on demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, businesses are effectively controlling aspects such as data availability, access to data, its versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

![An architecture leveraging a gateway node for bridging resources from a P2P system into the Web [@matsubara2010].](figures/matsubara-p2p-gateway.png){#fig:p2p-gateway}

In P2P systems, this power over data is distributed. The distinction of clients and servers is being blurred as the centralization of governance is diminished: Clients become servers, forming a collection of alike peers, that provide and at the same time request data. Considering “the data” a system operates on as a database (with support for querying and mutation), in these kind of distributed systems, this database is distributed, sometimes even fragmented.

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

One trade-off of theoretically “pure” P2P systems is, considering all data is exchanged between genuine peers, that each peer is running on commodity hardware—regular consumer devices. Especially in these days, where an increasing number of our interactions with the digital world occurs via handheld devices such as smartphones, their lack of processing power compared to the enormous computational resources of a dedicated cluster is troublesome. Yet, with the wake of the more mature, “smarter” P2P systems, these inequalities were to be addressed. Skype, for instance, as research by @guha2015 showed, analyzed peers’ network performance and promoted particular peers to supernodes. These supernodes “maintain an overlay network network among themselves” [@guha2015, p. 2] and effectively outbalance the weaknesses of less powerful peers [@chawathe2003].

(Textile cafés?).

In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Bridging Into The Web

Web applications leverage technologies planned, audited, and released by the World Wide Web Consortium (W3C). These technologies are known as _web technologies_ and are commonly supported by web browsers such as Mozilla Firefox, Google Chrome, and macOS Safari. Web applications are a popular way of providing tools and services, as opposed to native applications executed directly by the user’s operating system, due to three factors:

* User Experience (UX): Websites are accessible by entering Uniform Resource Locators (URLs). Users don’t have to manually download an application bundle and run it on their machine, as browsers download the application code and assets in-promptu.
* Developer Experience (DX): Developers can choose from a variety of standardized, open technologies for realizing their applications: Building web documents with HTML, realizing complex business logics with JavaScript, 
* Business Benefits: ...

## Resource Exhaustion: Thick Peers {#sec:thick}

For the first iteration of this project, I focused on building an annotation publishing system for realizing an end-to-end annotation workflow. As a case study for an annotation environment, I've chosen the Recogito semantic annotation tool. By supporting the Web Annotation data model, Recogito ensures interoperability with other annotation systems. The conceived workflow considered the following functionalities:

* Adapting Recogito to use an annotation server that implements the Web Annotation protocol.
* Adding real-time collaboration functionality to Recogito.
* Enabling users to discover annotations of others who work on the same resource. Resources could be identified by unique identifiers, such as HTTP URIs in IIIF[^iiif-id] and CTS URNs [^cts-urn] via the Linked Data `target` property of a Web Annotation item.
* Make people serve their own annotations from their personal devices with technology that supports P2P data exchange as well as real-time processing and merging of changes without a central authority.

Considering research around bridging data into the web from within a P2P system, this approach of developing a decentralized annotation system focused on legitimately _independent_ authoring and publishing of annotations. This aspect of usability and technological autonomy has been influenced by projects such as dokieli [@capadisli2017] and `biiif`[^biiif]. Such tools enable the use of personal storage---providers such as Solid, or even storage provided via a P2P network---for publishing, and eliminating the need for complex and expensive technical infrastructure. A supporting infrastructure could then mirror personal repositories within the P2P network and provide 24/7 availability, redundant backups, and an increased bandwidth for particular resources.

> Have here an illustration of the architecture.

Technically, this has major implications for the resulting architecture of such a system. Fundamentally, clients can't arbitrarily serve content via HTTP and DNS---at least, not without a substantial amount of specific configurations. Hence, independent and decentralized publishing via HTTP is no viable approach, and other protocols should be considered. Protocols such as IPFS and Dat recently gained experimental support in several web browsers[^opera-ipfs], but as major web browsers---Google Chrome, Apple Safari, and Mozilla Firefox---still have a joint market share of about 85%[^market-share], widespread adoption of such protocols is still a long time in the coming.

With WebRTC[^webrtc], however, the W3C offers a solution for realizing quasi-P2P applications built upon Web technologies. (encryption, discovery via ICE/STUN/TURN). The WebSocket[^websocket] protocol has proven itself much more stable and reliable and in the end led to a gateway-supported solution that bridges WebSocket connections into the Hyperswarm network.

Use Hyperswarm as a decentralized networking solution for swarming, and a WebRTC bridge to connect to browser clients.

Implemented a HTTP-like protocol based on Protocol Buffers[^protocol-buffers].

[^iiif-id]: <https://iiif.io/api/presentation/2.0/#technical-properties>
[^cts-urn]: <https://www.homermultitext.org/hmt-docs/cite/cts-urn-overview.html>
[^biiif]: `biiif` is a tool for independent publishing of IIIF manifests: <https://github.com/edsilv/biiif>
[^opera-ipfs]: Opera has been branded as suited for "mainstream crypto-adoption", meaning to support Web3 technologies by interoperating with technologies such as the Ethereum blockchain and the IPFS network: <https://press.opera.com/2020/03/30/opera-introduces-major-updates-to-its-blockchain-browser-on-android/>
[^market-share]: <https://gs.statcounter.com/browser-market-share#monthly-201902-202002>
[^webrtc]: <https://www.w3.org/TR/webrtc/>
[^web-socket]: <https://html.spec.whatwg.org/multipage/web-sockets.html>

### Protocols

By utilizing a server that bridges WebSocket connections into the Hyperswarm network, `hyperswarm-proxy`[^hyperswarm-proxy], Web clients are able to join swarms in the Hyperswarm network and connect to other peers of a swarm.

Use Protocol Buffers[^protocol-buffers] in order to develop a custom protocol that resembles HTTP, but facilitates parsing. It supported multiplexing of multiple request-response actions over the same connection within a swarm or, rather, a swarm connection to another peer. Furthermore, it supports subscriptions on particular resources, similar to HTTP long-polling.

Emphasize the trade-off made here: In order to realize Hyperswarm compatibility, the resulting system didn't implement the Web Annotation protocol---in some way, it did, but not using HTTP---and made using an SDK in client applications mandatory.

[^hyperswarm-proxy]: <https://github.com/RangerMauve/hyperswarm-proxy>
[^protocol-buffers]: <https://developers.google.com/protocol-buffers/>

### Resource Discovery

### Client SDK

The above mentioned protocols resulted in a quite elaborate assembly: By equipping the HTTP-like functionality of request and response messages with per-request identifiers and subscription capabilities, simulating a distributed Web Annotation system via the distributed Hyperswarm network became achievable. One major drawback emerged immediately, though: By not using HTTP as a transfer protocol, communication capabilities for interfacing with the Hyperswarm network via the WebSocket protocol had to be provided with additional software. Consequently, a client SDK should provide these missing components for abstracting communication.

> Have a figure with a brief overview of how the SDK interacted with both the gateway and the client software.

### Architectural Issues

This approach bears fundamental issues:

* Peers within the network are considered to be peoples' personal devices---commodity hardware: personal computers, tablets, smartphones. This poses two constraints: First, commodity hardware has limited computing power compared to enterprise, professional, or data center hardware. Second, personal devices don't share the amount of network bandwidth that is available for data center hardware---talking Megabit versus Gigabit connections.
* Request/response protocol implements a client-server architecture within a P2P network
* Pure clients (not serving any data) also become part of the P2P network, imposing an imbalance between data availability and peer connections
* This again leads to bottlenecks around bandwidth and network capacity, with many clients requesting data from a small number of serving peers

Discuss this more detailed in @sec:discussion.

## Institutional Governance with “Hyperwell”

Define terms:
* Notebook

The initial attempt at realizing a distributed annotation authoring system outlined in @sec:thick provided promising prospects around independent publishing as well as novel technologies and protocols, but also highlighted one major challenge for such systems: While P2P systems can distribute network and computational load onto a multitude of peers---as data is replicated among peers---, interfacing a distributed system with less decentralized systems will lead to unpredictable and less distributed requests on resources, essentially exhausting peers. This realization resulted in the following conclusion: In order to ensure efficiency and integrity for the P2P network, the _translating component_---a gateway, basically---has to be externalized in terms of infrastructure and governance. This gateway infrastructure makes an essential part of the architecture, but, nevertheless, should be of a volatile nature.

![Architecture of Hyperwell: Peers on the left side exchange data directly via a P2P network. The center gateway then translates requests between Web applications and the P2P system, allowing for end-to-end referenced resources in annotation environments that support annotating canonical resources such as CTS texts or IIIF galleries.](figures/architecture.pdf){#fig:architecture}

Describe architecture of @fig:architecture.

### Gateway: Implementation of a Service for Archival and Institutional Exposition

Main features:

* Fully Web Annotation data model and protocol compliant
* Additional support for 1) real-time updates via WebSockets and 2) batch updates via HTTP
* TTL-based local caching of repositories

### Notebook: Implementation of a Local-First Annotation Application

> If there’s enough time to realize the local notebook application, write a small chapter about it here.

Main features:

* Managing notebooks: collections of annotations for a particular resource (or a set of related resources). Project- or resource-based.
* Backup: The application is local-first, so all annotations are available on the user's computer. It serves as a storage node, too, and even receives updates from applications that provide real-time collaboration.
* Searching notebooks: As all data is available, it's searchable. The notebook applications runs a local search index that get's updated as soon as changes occur, so users can search all their annotations in an instant---that includes Linked Data (without resolving, though, but could be?) and, thus, annotation targets.

## Adoption in Existing Environments

> Explicate how our approach on adding Hyperwell support to the Recogito semantic annotation platform went.

### A Standard Annotation Server

### Adding Real-Time Collaboration Support

Emphasis: No need for an SDK, just use standard WebSockets. There exists an example annotation environment that shows the integration. 

Learnings from the attempted integration with Recogito: Having reactive data flows in an application is good---also, being able to properly react to created/updated/deleted entities supports the integration. React and other libraries that use a virtual DOM, for instance, are well-suited for this task, but also other user interface libraries such as Svelte support updating the DOM based on mutations on the underlying data.

## Conclusion

With many platforms involved—researchers, institutions, platforms, non-academic users—it’s difficult to find the perfect solution suiting all their needs. The “Thick Client” approach presented first ensures an annotator’s independence when publishing, but bears the quick exhaustion of their computational resources. The second approach, Hyperwell, performed well in testing due to a clear distinction of personal (individual) and institutional (centralized) computational resources, but takes the way of introducing quasi-centralized gateways.

