# Implementation {#sec:implementation}

Each aspect of a P2P system bears implications for usability, data availability, and user emancipation: As described in the previous chapters, P2P networks can effectively use certain network structures to enforce power structures and hierarchies among peers.

_TODO:_

* Use of Web Annotation as a standard for annotating resources and leveraging LOD principles.
* The subsequent need for supporting the Web Annotation Protocol, although there exist other solutions.
* Gateways as the solution for that (detailed in @sec:hyperwell), ensuring compliance with today’s standards as well as backwards compatibility.

In the following, I will first outline the role of gateways and overlay networks in P2P systems in @sec:gateways. @Sec:bridging will then build upon the notion of gateways and apply them to the ongoing compatibility issue with standardized web technologies such as WebRTC. I then detail two approaches on designing and implementing P2P systems: First, a system focused on independent, personal annotation publishing called ‘From Me to You’ (@sec:thick). After facing severe architectural drawbacks in that system, a redesigned system called Hyperwell emerged (@sec:hyperwell) and solved performance bottlenecks by introducing institutional mirroring of annotation collections.

## Gateways and Peer-to-Peer Systems {#sec:gateways}

Distributed P2P systems function fundamentally different from established architectures that separate between clients and servers in a network. The fundamental difference is explained by how the participants treat data: In architectures following the established client-server separation, such as HTTP, servers hold a monopoly of the contained data while clients request parts of this data on-demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, businesses are effectively controlling aspects such as data availability, access to data, its versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

![An architecture leveraging a gateway node for bridging resources from a P2P system into the Web [@matsubara2010]. For providing access to a P2P network, the gateway acts as both a peer within the P2P network and as a HTTP server. Gateway logic translates between both systems.](figures/matsubara-p2p-gateway.png){#fig:p2p-gateway short-caption="Architecture for bridging resources from a P2P system into the Web"}

In P2P systems, this power over data is distributed. The distinction of clients and servers is being blurred as the centralization of governance is diminished: Clients become servers, forming a collection of alike peers, that provide and at the same time request data. Considering “the data” a system operates on as a database (with support for querying and mutation), in these kind of distributed systems, this database is distributed, sometimes even fragmented.

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

One trade-off of theoretically “pure” P2P systems is, considering all data is exchanged between genuine peers, that each peer is running on commodity hardware—regular consumer devices. Especially in these days, where an increasing number of our interactions with the digital world occurs via handheld devices such as smartphones, their lack of processing power compared to the enormous computational resources of a dedicated cluster is troublesome. Yet, with the wake of the more mature, “smarter” P2P systems, these inequalities were to be addressed. Skype, for instance, as research by @guha2015 showed, analyzed peers’ network performance and promoted particular peers to supernodes. These supernodes “maintain an overlay network network among themselves” [@guha2015, p. 2] and effectively outbalance the weaknesses of less powerful peers [@chawathe2003].

(Textile cafés?). Scuttlebut pubs [@tarr2019].

In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Bridging Swarms and the Web {#sec:bridging}

Web applications leverage technologies planned, audited, and released by the World Wide Web Consortium (W3C). These technologies are known as _web technologies_ and are commonly supported by web browsers such as Mozilla Firefox, Google Chrome, and macOS Safari. Web applications are a popular way of providing tools and services, as opposed to native applications executed directly by the user’s operating system, due to three factors:

* User Experience (UX): Websites are accessible by entering Uniform Resource Locators (URLs). Users don’t have to manually download an application bundle and run it on their machine, as browsers download the application code and assets in-promptu.
* Developer Experience (DX): Developers can choose from a variety of standardized, open technologies for realizing their applications: Building web documents with HTML, realizing complex business logics with JavaScript, 
* Business Benefits: ...

_TODO:_ Make it explicit that the work done in this chapter (and for the thesis) has been to build an architecture that serves in two ways: First, it has to be built around hypermerge—the library itself does not provide any de-facto requirement of how data should be distributed. It facilitates data distribution. Second, the architecture should resemble the notion that I have imposed in @sec:annotation.

_TODO:_ Emphasize the limitations for modern JavaScript applications: With the Node.js runtime—in theory—,the same code can be executed isomorphically on both directly on a devices as well as in the browser. However, both platforms serve different environments: Node.js supports bindings to native code, such as libraries written in C++, while browsers provide separate APIs of the web platform, such as WebGL graphics and access to device sensors. Thus, having 

*TODO:* Maybe give an introduction to Hyperswarm, swarms, and how replication commonly happens for Hyperswarm/Hypercore? Also, an introduction to *duplex streams* would be helpful. What is *replication*?

_TODO:_ Three approaches to bridging decentralized networks and the web by using web technologies supported by contemporary web browsers (@fig:bridging-approaches):

![Approaches for bridging between decentralized file-sharing networks and the web.](figures/bridging-approaches.pdf){#fig:bridging-approaches short-caption="Approaches for bridging between decentralized file-sharing networks and the web"}

1. Connecting web clients via WebRTC and using WebRTC duplex connections to replicate data. Did not work, as WebRTC failed during testing and Hypermerge has dependencies that don’t work in web browsers (footnote on what that exactly means, comparing it to Node.js and native C++ libraries).
2. Connecting web clients via WebSocket connections which are being terminated/translated by a set of proxy servers and using an overlay network for requesting resources.
3. Enforcing a “hard” separation between both networks and making the gateway properly translate between both protocols rather that “repacking” it. This will make the gateway act like a full peer in the decentralized network and would enable the use of HTTP and an implementation of the REST-based Web Annotation Protocol.

## First Version: Resource Exhaustion and Thick Peers {#sec:thick}

For the first iteration of this project, I focused on building an annotation publishing system for realizing an end-to-end annotation workflow. As a case study for an annotation environment, I've chosen the Recogito semantic annotation tool. By supporting the Web Annotation data model, Recogito ensures interoperability with other annotation systems. The conceived workflow considered the following functionalities:

* Adapting Recogito to use an annotation server that implements the Web Annotation protocol.
* Adding real-time collaboration functionality to Recogito.
* Enabling users to discover annotations of others who work on the same resource. Resources could be identified by unique identifiers, such as HTTP URIs in IIIF[^iiif-id] and CTS URNs [^cts-urn] via the Linked Data `target` property of a Web Annotation item.
* Make people serve their own annotations from their personal devices with technology that supports P2P data exchange as well as real-time processing and merging of changes without a central authority.

Considering research around bridging data into the web from within a P2P system, this approach of developing a decentralized annotation system focused on legitimately _independent_ authoring and publishing of annotations. This aspect of usability and technological autonomy has been influenced by projects such as dokieli [@capadisli2017] and `biiif`[^biiif]. Such tools enable the use of personal storage---providers such as Solid, or even storage provided via a P2P network---for publishing, and eliminating the need for complex and expensive technical infrastructure. A supporting infrastructure could then mirror personal repositories within the P2P network and provide 24/7 availability, redundant backups, and an increased bandwidth for particular resources.

![Architecture of the 'Thick Peer' approach during the first iteration.](figures/thick-architecture.pdf){#fig:thick-peer short-caption="Architecture of the 'Thick Peer' approach during the first iteration"}

Technically, this has major implications for the resulting architecture of such a system. Fundamentally, clients can't arbitrarily serve content via HTTP and DNS---at least, not without a substantial amount of device-specific configuration. Hence, independent and decentralized publishing via HTTP is no viable approach and other protocols should be considered. Protocols such as IPFS and Dat recently gained experimental support in several web browsers[^opera-ipfs], but as major web browsers---Google Chrome, Apple Safari, and Mozilla Firefox---still have a joint market share of about 86%[^market-share], widespread adoption of such protocols is still a long time in the coming.

With WebRTC[^webrtc], however, the W3C offers a solution for realizing decentralized communication in applications that are built upon web technologies. (_TODO:_ encryption, discovery via ICE/STUN/TURN). The WebSocket[^websocket] protocol has proven itself more stable and reliable during my testing and in the end led to a gateway-supported solution that bridges WebSocket connections into the Hyperswarm network.

Integrating with the stack of Web technologies at hand, both the peer application running locally as well as the browser integration have been written in the JavaScript programming language. Modern versions of JavaScript---most notably, ECMAScript 7[^ecma7]---are widely supported by modern Web browsers. With the Node.js[^nodejs] JavaScript runtime, applications written in JavaScript can be executed locally via the V8 JavaScript runtime[^v8] developed by Google for the Chrome browser.

_TODO:_ Use Hyperswarm as a decentralized networking solution for swarming, and a WebRTC bridge to connect to browser clients [@frazee2019].

_TODO:_ Use Hypermerge as a CRDT-equipped data structure backed by the Hypercore append-only log. Integrates with Hyperswarm to exchange changes with peers operating on copies of the same data structure and merge changes automatically and conflict-free.

* Introduce the terms of repositories (collections of notebooks) and documents (notebooks), and distinguish them from a single annotation.

Implemented a HTTP-like protocol based on Protocol Buffers[^protocol-buffers], as explained in @sec:thick:protocols.

_TODO:_ Extending the Recogito UI has been possible, but required a lot of effort because of complicated tooling around the Scala-based backend. Hence, all extensions, such as the resource discovery mechanism detailed in @sec:thick:discovery, were designed as standalone modules and bundled appropriately.

In the following, I will outline two characteristic contributions of this approach: First, a novel, HTTP-like protocol was created to enable client-server connections over multiplexed duplex socket connections. This protocol leverages the Protocol Buffers standard and is detailed in @sec:thick:protocols. Second, as peers within the network transfer data without higher-level supernodes—despite an overlay network—, a flat hierarchy is established. An approach for announcing work on particular resources with the intention of collaboration is described in @sec:thick:discovery. By establishing a new protocol for retrieving annotations from a distributed network, browsers need to be provided with libraries to support these protocols---one such library, a Software Development Kit (SDK), for integrating client applications, is detailed in @sec:thick:sdk.

The approach of the first version, however, had several severe drawbacks. While an in-depth evaluation of this thesis' contributions will be discussed far below in @sec:discussion, I will give an outline of these drawbacks in the following @sec:thick:issues.

[^ecma7]: <https://www.ecma-international.org/ecma-262/7.0/index.html>
[^nodejs]: <https://nodejs.org/en/>
[^v8]: <https://v8.dev/>
[^iiif-id]: <https://iiif.io/api/presentation/2.0/#technical-properties>
[^cts-urn]: <https://www.homermultitext.org/hmt-docs/cite/cts-urn-overview.html>
[^biiif]: `biiif` is a tool for independent publishing of IIIF manifests: <https://github.com/edsilv/biiif>. By generating a IIIF manifest from a filesystem-based image gallery and corresponding metadata, users can easily host IIIF galleries via P2P file-sharing protocols such as Dat or IPFS.
[^opera-ipfs]: Opera has been branded as suited for "mainstream crypto-adoption", meaning to support Web3 technologies by interoperating with technologies such as the Ethereum blockchain and the IPFS network: <https://press.opera.com/2020/03/30/opera-introduces-major-updates-to-its-blockchain-browser-on-android/>
[^market-share]: <https://gs.statcounter.com/browser-market-share#monthly-201902-202002>
[^webrtc]: <https://www.w3.org/TR/webrtc/>
[^websocket]: <https://html.spec.whatwg.org/multipage/web-sockets.html>

### Protocols {#sec:thick:protocols}

By utilizing a server that bridges WebSocket connections into the TCP or uTP socket-based Hyperswarm network connections, web clients are able to join swarms in the Hyperswarm network and connect to other peers of a swarm. This has been achieved by utilizing the fact that the WebSocket protocol establishes a duplex stream—that is, readable as well as writable—between client and server. By using the `hyperswarm-proxy`[^hyperswarm-proxy] library, this duplex stream can then be forwarded to peers of the respective Hyperswarm peers.

In @sec:bridging, I have outlined possible approaches for connecting web clients into the Hyperswarm network. A major limitation of the CRDT-backed Hypermerge library is its incompatibility with the web platform, as it entails native code dependencies. Hence, using WebRTC connections to directly connect web clients with Hyperswarm peers—approach 1 of @fig:bridging-approaches—is not a viable solution for this context. However, creating a separate overlay network enabled web clients to communicate with Hyperswarm peers independently of Hypermerge.

In order to request and mutate resources on this network, a separate application protocol was then required. The HTTP protocol would actually have met the needs of this overlay network, as it is a well-established and extensively documented foundation of the web. HTTP would furthermore have allowed for an actual implementation of the Web Annotation Protocol between participants of this network. However, I have faced two severe issues: First, there exist no established JavaScript-based implementations of HTTP parsers that could be utilized on web clients[^http-parser]. Second, the nature of Hyperswarm connections is not deterministic as peers continuously join and leave a swarm—thus, connections can not be established on-demand as easily as directly via DNS-based URLs and should be used as efficiently as possible. HTTP supports pipelining of multiple requests over the same TCP connection, yet it is explicitly being advised against this practice [@fielding1999, p. 46].

By creating a separate, HTTP-inspired protocol, compatibility could be ensured for exchanging annotations on the overlay network between web clients and Hyperswarm peers. The protocol is using the standardized Protocol Buffers[^protobuf] scheme in order to express custom protocol messages and events that cover a subset of features of HTTP. Protocol Buffers simplify parsing of protocol messages and allow the protocol to multiplex several request-response sequences over the same connection in parallel.

I would like to emphasize that this approach of using an HTTP-like protocol will relinquish the bidirectional nature of a duplex stream as compared to stream-based replication of Hypercore logs: While the connection itself is bidirectional, the semantics of the protocol are not. A web client selectively requests data from a peer, which will make this peer become a server. This imposition bears heterogeneities for P2P systems, which I will discuss in @sec:thick:issues. In the following, I will increasingly refer to peers as clients and servers to highlight their functional distinction.

@Lst:proto-request shows the implementation of the `RequestEvent` message: The protocol resembles an HTTP request with a request method, a path, and an optional data-carrying body. Other than HTTP, this implementation is a stateful protocol where messages can refer to each other by their unique ID. Additionally to basic HTTP methods such as GET, POST, and PUT, the protocol supports long-running subscriptions which can be opened (`SUB`) as well as closed (`CLOSE`). Similar to the method of long-polling[^long-polling], subscriptions demand the server to push new data over the existing connection as changes occur on the resource specified in the initial `SUB` request.

```{#lst:proto-request .protobuf caption="Protocol Buffer code for a request type message, resembling classic HTTP requests. Additional request methods are `SUB' and `CLOSE'."}
enum RequestMethod {
	GET = 1;
	POST = 2;
	PUT = 3;
	DELETE = 4;
	SUB = 5;
	CLOSE = 6;
}

message RequestEvent {
	required RequestMethod method = 1;
	required bytes id = 2;
	required string path = 3;
	optional bytes data = 4;
}
```

_TODO:_ Emphasize the trade-off made here: In order to realize Hyperswarm compatibility, the resulting system didn't implement the Web Annotation protocol---in some way, it did, but not using HTTP---and made using an SDK in client applications mandatory.

[^hyperswarm-proxy]: <https://github.com/RangerMauve/hyperswarm-proxy>
[^protobuf]: <https://developers.google.com/protocol-buffers/>
[^long-polling]: In contrast to conventional "short-polling", where clients send requests to servers on-demand, "long-polling" requests will hold a client-initiated connection open for a longer period of time and expects the server to continuously deliver messages: <https://www.hjp.at/doc/rfc/rfc6202.html#sec_2.1>

### Resource Discovery {#sec:thick:discovery}

While evaluating the conditions on why Recogito has been chosen as a case study and reference environment for developing the technology presented in this chapter, several prospects around an open and distributed annotation storage have emerged. With Linked Data entities being available for client applications running locally, semantic relations could easily be examined outside of the annotation environment itself. Furthermore, as the UI of an application becomes increasingly _lean_ by decoupling from a heavy and centralized data-processing backend, user-facing functionality can be better integrated with workflows based on the data model itself.

With that in mind, I have designed a functionality for discovering related work of other users based on the URL of the annotated resource. This approach is inherently decentralized: Each peer maintains its own ephemeral list of related work. By leveraging the decentralized networking of Hyperswarm similarly as in @sec:thick:protocols, peers join a swarm of peers based on a topic. In this case of discovering resources, this topic is a hashed representation of the annotated document's canonical identifier, such a CTS URN or a general URL. Once peers discover and connect to each other, they quickly exchange discovery messages. Such a message is defined more precisely in @lst:proto-discovery as a `DiscoveryEvent` message of type `ANNOUNCE`. Once a peer goes offline, it will broadcast an `UNANNOUNCE` type message.

Explicitely broadcasting these messages is required, as opposed to implcitely announcing the available of a resource by joining the respective swarm based on the resource URL: By introducing 'consuming' peers, swarms don't resemble  

```{#lst:proto-discovery .protobuf caption="Protocol Buffer schema for a discovery message, announcing or unannouncing the availability of a resource on the sending peer."}
enum DiscoveryEventType {
	ANNOUNCE = 1;
	UNANNOUNCE = 2;
}

message DiscoveryEvent {
	required DiscoveryEventType type = 1;
	required bytes id = 2;
	required string url = 3;
}
```

For unique identification, each peer within a discovery swarm assigns itself an UUID upon joining. This identifier corresponds to the `id` field of a `DiscoveryMessage` message. However, this ad-hoc approach for solving decentralized discovery is critically flawed, the message's origin is currently not verified deterministically. This issue will be discussed---among other matters---in @sec:discussion.

_TODO_: Write about the modular UI extension, provide a screenshot, link to the work and (even more TODO) release the module via Zenodo!

[^http-parser]: The code of the Node.js runtime’s built-in HTTP parser  is publicly available and being written in C++: <https://github.com/nodejs/http-parser>

### Client Software Development Kit {#sec:thick:sdk}

The above mentioned protocols resulted in a quite elaborate assembly: By equipping the HTTP-like functionality of request and response messages with per-request identifiers and subscription capabilities, simulating a distributed Web Annotation system via the distributed Hyperswarm network became achievable. One major drawback emerged immediately, though: By not using HTTP as a transfer protocol, communication capabilities for interfacing with the Hyperswarm network via the WebSocket protocol had to be provided with additional software. Consequently, a client Software Development Kit (SDK) should provide these missing components for abstracting the communication.

_TODO:_ Both the annotation API as well as the related work discovery functionality are available via the JavaScript SDK in form of a standalone bundle

Listing: Example code using the JavaScript client SDK for interacting with decentralized annotations on a high-level API.

```{#lst:sdk-example .js}
const {RequestSwarm, DiscoverySwarm} =
  require('from-me-to-you/browser')
const swarm = new RequestSwarm(docUrl)

swarm.on('ready', async () => {
  const annotaitons = await swarm.getAnnotations()
  const relatedNotebooks = await swarm.getRelated()

  const subscription = await swarm.getAnnotations({
    subscribe: true
  })
  subscription.on('pub', data => {
    // handle pushed change
  })
})
```

The code in @lst:sdk-example shows an exemplary usage on how to use the JavaScript client SDK for retrieving annotations (`swarm.getAnnotations()`), querying for related work (`swarm.getRelated()`), and subscribing to changes of an annotation (`swarm.getAnnotations()` with a `subscribe` option). For a more complete documentation of the SDK, I refer to the respective code repository called `from-me-to-you`. The repository contains an example project using the SDK as well as a full documentation of the exposed SDK functionality.

### Architectural Issues {#sec:thick:issues}

This approach bears fundamental issues:

* Peers within the network are considered to be peoples' personal devices---commodity hardware: personal computers, tablets, smartphones. This poses two constraints: First, commodity hardware has limited computing power compared to enterprise, professional, or data center hardware. Second, personal devices don't share the amount of network bandwidth that is available for data center hardware---talking Megabit versus Gigabit connections.
* Request/response protocol implements a client-server architecture within a P2P network
* Pure clients (not serving any data) also become part of the P2P network, imposing an imbalance between data availability and peer connections
* This again leads to bottlenecks around bandwidth and network capacity, with many clients requesting data from a small number of serving peers

Discuss this more detailed in @sec:discussion.

## Second Version: Institutional Governance with Hyperwell {#sec:hyperwell}

The initial attempt at realizing a distributed annotation authoring system outlined in @sec:thick provided promising prospects on independent publishing as well as novel technologies and protocols, but also highlighted one major challenge for such systems: While P2P systems can distribute network and computational load onto a multitude of peers---as data is replicated among peers---, interfacing a distributed system with less decentralized systems will lead to unpredictable and less distributed requests on resources, essentially putting a strain onto a minority of peers. This realization resulted in the following conclusion: In order to ensure efficiency and integrity for the P2P network, the _translating component_ has to be externalized in terms of infrastructure and governance. Such gateways can translate between both networks, and be scaled separately. This gateway infrastructure makes an essential part of the architecture, but, nevertheless, should be of a volatile nature.

![Architecture of Hyperwell: Peers exchange their notebooks in real-time (1). Gateways, run by institutions, archive selected notebooks and bridge them into the web (2). Web applications can access annotations via gateways, as they implement the Web Annotation protocol (3). These applications can load canonical resources via services such as CTS or IIIF (4) [@kassel2020a].](figures/architecture.pdf){#fig:hyperwell-architecture short-caption="Architecture of Hyperwell using gateways"}

Progressing from the first approach outlined in @sec:thick, separating the component that translates between the P2P system and the web resulted in a second iteration of the architecture, which is illustrated in @fig:hyperwell-architecture: With this approach, a dedicated middle layer receives connections from both sides, acting as a peer in the decentralized network and as a HTTP server on the web.

### Gateway Server {#sec:hyperwell:gateway}

The Hyperwell gateway server manifests the separation of that translating component and represents an institutional entity in a P2P system. In a proof-of-concept implementation, I have outlined how such a gateway could be realized while considering both users’ needs as well as institutional requirements. Most fundamentally, the gateway translates JSON-encoded annotations of the Web Annotation Data Model between decentralized swarms of Hyperswarm and the web. Therefore, it exposes an HTTP API that complies with the REST-based Web Annotation Protocol and complements this API with further capabilities, such as subscribing to real-time updates of annotations via WebSocket connections and bulk operations on notebooks.

Primarily, the gateway aims to provide the following functionalities for peers of the decentralized network:

* **Long-term archival**: Gateways support associated peers by continuously replicate their repositories for backup and archival.
* **High availability**: Other than personal devices, gateways can be deployed in data centers with high-bandwidth network connections, 24/7 uptime, and enterprise-grade hardware. These environments can ensure high availability of repositories
* **Professional affiliation**: On the web, domains resolved via DNS can express affiliations with an official institution and hence, secure credibility. For example, domains in the context of academia commonly follow schemes such  `xyz.edu` or `uni-xyz.de`. Consequently, institutional gateways can assure a researcher’s or repository’s affiliation by following these naming schemes with, for example, `service.xyz.edu`.

![Architecture of the Hyperwell gateway server. While real-time replication of repositories happens via the Hyperswarm network (1), changes are also persisted to disk (2). Hypermerge (3) then applies uses the Automerge CRDT to merge different versions of a repository. The gateway caches recently accessed repositories (4) and performs a diff (5) if sequential updates are requested. Annotation IDs are then translated into LOD URIs (6) and served via HTTP (7) or WebSocket (8) connections.](figures/gateway-architecture.pdf){#fig:gateway-architecture short-caption="Architecture of the Hyperwell gateway server"}

@Fig:gateway-architecture outlines the components of this gateway implementation. Some components could be adopted from the thick peer approach: Primarily, the Hyperwell gateway shares the general concept of distributing annotations via a combination of decentralized networking with Hyperswarm and handling distributed documents with Hypermerge. Yet, introducing an institution as neutral entity to the system has caused some additional components to appear. I will detail these components in the following.

Notebooks are replicated via the Hyperswarm network over TCP or uTP connections and then passed to Hypermerge for applying changesets. Bridging into the web, the gateway serves both HTTP requests and WebSocket connections by using the hapi[^hapi] web framework. The HTTP API implements a superset of the Web Annotation Protocol [@web-anno-protocol] by the providing the following URL endpoints:

`https://www.example.com/annotations/<notebook>`.
: REST endpoint for operations on an entire notebook. This endpoint supports retrieval of all of its annotations (`GET`) and creation of new a new annotation (`POST`).

`https://www.example.com/annotations/<notebook>/<annotation>`.
: REST endpoint for operations on a particular annotation within a notebook. This endpoint supports retrieval (`GET`), editing (`PUT`), and deletion (`DELETE`).

`https://www.example.com/annotations/batch/<notebook>`.
: REST endpoint for batch operations on a notebook. This endpoint supports batch creation (`POST`), batch edits (`PUT`), and batch deletions (`DELETE`).

`https://www.example.com/annotations/subscribe/<notebook>`.
: WebSocket endpoint for subscribing to changes on a notebook. Upon initiating a connection via the standard WebSocket protocol[^websocket-subprotocols], the gateway will send messages as soon as the respective notebooks receives changes.

The Web Annotation Protocol defines a *container* as the cumulative unit of annotations---containers are commonly used in the context of LDPs for semantically organizing groups of entities. Translating Linked Data principles to the distributed notebooks, a LDP container corresponds to a hexadecimal encoding of a documents Hypermerge URL. This hexadecimal encoding is supposed to ensure a straightforward approach for ensuring URL safety of arbitrary contents. Furthermore, this hexadecimal representation is not intended as disguise of the underlying URLs and thus reversible, as opposed to the results of hashing functions.

Other than on-device peers of the thick-peer approach, gateways in Hyperwell don’t necessarily have *all* affiliated users’ notebooks accessible locally. It could extend a smaller institutions’ computational resources to replicate all of its affiliated researchers’ repositories in their entirety by default—as Hypermerge repositories maintain their whole history of changes, they can grow in size quickly. However, in an ideal scenario for the Hyperwell architecture, institutions would indeed replicate a majority of their affiliates’ data for ensuring collaboration and productivity. As I have described previously in @sec:related:p2p and @sec:thick, mirroring resources for high availability can be viable for decentralized networks. A trade-off between replication and scalability could either be a selective or a transient approach. While Hypermerge currently lacks a system for managing identities of users—I outline this issue later during this section—,the gateway implementation will instead provision repositories for a limited duration, similar to a TTL-based cache. Thereby, documents will be closed and eventually removed from the gateway’s disk or memory after no requests occurred on the web-facing API after a predefined amount of time.

![Calculating differences between sets by hashing their values. In a simple and commonly shorter byte representation, complex objects such as JSON dictionaries can be compared to each other more efficiently.](figures/notebook-diffing.pdf){#fig:notebook-diffing short-caption="Calculating differences between sets by hashing their values"}

Providing real-time updates on changed Hypermerge documents proved itself complicated. By its design, the Hypermerge API allows to listen for updates on a particular document via the `RepoFrontend.watch()` method. However, this event handler will receive the entire state of the changed document rather than just the changes[^hypermerge-watch]. In the context of subscriptions on real-time changes in notebooks of Hyperwell, this means sending each subscriber the complete, updated notebook instead of a list of changes—i.e., additions, edits, and deletions. This practice would put an immense strain on the network bandwidth that quickly scales with the amount of subscriber, the notebook size, and the frequency of changes. Eventually, each subscriber had to calculate the differences by itself. By calculating the changeset between two states on the gateway instead, a drastically smaller amount of data will be published during each change. Illustrated in @fig:notebook-diffing, this changeset can be calculated quickly by mapping the value of each item of a notebook (i.e., a Web Annotation JSON object) to a data type that can be compared quickly, such as a hashed sequence of bytes. Two lists of hashes can then be compared with each other, which will result in a changeset of added, changed, and deleted items.

When considering data ownership and power structures in the Hyperwell architecture, it is important to note that notebooks should not be tied to a particular gateway. When creating an annotation by using the gateway’s REST API, it will issue a Universally Unique Identifier (UUID[^uuid]) for the previously undefined ID of this annotation. This ensures that each annotation is uniquely identifiable within a notebook, if not globally. However, the Web Annotation data model specifies that annotations are identified by their IRI and incorporating the parent notebook’s Hypermerge-issued URL into the annotation’s IRI will result in incompatibilities, as browsers are commonly not able to resolve Hyperwell-issued URLs. Hence, gateways translate between both: _TODO :)_.

Some features such as archiving rely on an identity system. While the Hypercore append-only log uses public key encryption for identity and security, Hypermerge currently does not expose such functionality out-of-the-box. With a focus on Linked Data and web technology, I will discuss this matter—among other shortcomings—in @sec:discussion.

[^hapi]: Hapi is a production-ready web framework: <https://hapi.dev/>. Hapi is written in JavaScript and runs in the Node.js runtime. With a variety of plugins, its functionality can be extended, for example by adding support for the WebSocket protocol.
[^ldp-containers]: With Linked Data, resources can be grouped into containers: <https://www.w3.org/TR/ldp/#ldpc>. These containers can assort entities semantically: “Each resource created in the application or site is created within an instance of one of these container-like entities, and users can list the existing artifacts within one.”

[^websocket-subprotocols]: The WebSocket protocol supports the use of specific subprotocols [@fette2011, p. 12]. Frameworks and services can leverage these subprotocols for imposing their own structured communication paradigms. Yet, for the sake of simplicity and compatibility, the gateway subscription endpoint purely relies on the WebSocket protocol as a stream for pushing data to clients in real-time.
[^hypermerge-watch]: Automerge, the underlying CRDT of Hypermerge, provides a more low-level API that poses little assumption on how exactly changes are transmitted. With the `Automerge.getChanges()` method, changeset between two states can be propagated explicitly.
[^uuid]: UUIDs have been specified on RFC 4122: <https://www.ietf.org/rfc/rfc4122.txt>

### Notebook Application {#sec:hyperwell:notebook}

_TODO:_ Implementation of a Local-First Annotation Application. Main features:

* Managing notebooks: collections of annotations for a particular resource (or a set of related resources). Project- or resource-based.
* Backup: The application is local-first, so all annotations are available on the user's computer. It serves as a storage node, too, and even receives updates from applications that provide real-time collaboration.
* Searching notebooks: As all data is available, it is readily available for search. The notebook applications runs a local search index that get's updated as soon as changes occur, so users can search all their annotations in an instant---that includes Linked Data (without resolving, though, but could be?) and, thus, annotation targets.

![UI of the notebook application when inspecting a topic-related notebook. While respective annotation environments will contextualize annotations visually upon each target, users can edit their annotations' JSON-LD data directly within the notebook application.](figures/hyperwell-notebook.png){#fig:notebook short-caption="UI of the Hyperwell notebook application"}

![Architecture of the Hyperwell notebook application.](figures/notebook-architecture.pdf){#fig:notebook-architecture short-caption="Architecture of the Hyperwell notebook application"}

_TODO:_ Technical architecture:

* It's an Electron-based[^electron] application: By shipping applications with a bundled copy of the Chromium web browser, application logic and the UI can be developed using web technologies such as HTML, CSS, and JavaScript. A backend process runs via an included Node.js runtime.
* The user interface is being realized with the JavaScript-based React[^react] framework.
* Akin to the gateway server, the application uses Hypermerge with Hyperswarm for exchanging distributed notebooks.
* Search indexing?

[^electron]: Electron is a framework for building desktop applications with web technologies: <https://www.electronjs.org/>. Electron applications ship their own copy of the Chromium browser as well as the Node.js runtime. They are packed as native executables, can be build cross-platform, and have their application logic written in JavaScript.
[^react]: React is a popular framework for building interactive web applications: <https://www.reactjs.org/>. Maintained by Facebook, React leverages functional reactive programming principles and uses a virtual DOM for only patching changed parts of the user interface. Next.js builds upon React and provides ready-to-use solutions for many common scenarios, such as pre-rendering and CSS-in-JS styling: <https://nextjs.org/>.

### Annotation Environment

_TODO:_ Sketch the experimental, yet simple annotation environment for testing Hyperwell. This system will display an example text and use the RecogitoJS library for annotating the plain text, while annotations are stored on a Web Annotation supported server---ideally, via a Hyperwell gateway.

[^recogito-js]: RecogitoJS is <https://github.com/pelagios/recogito-text-js>

### Gateway Performance

_TODO:_ If time is left, run some artillery[^artillery] penetration tests on the gateway.

[^artillery]: <https://artillery.io/>

## Support in Client Applications

_TODO:_ Explicate how our approach on adding Hyperwell support to the Recogito semantic annotation platform went. We rely on particular technologies such as the WebSocket protocol, but don't actually introduce new application protocols---swarming is handled by the gateway, which ensures compatibility with common Web standards.

Emphasis: No need for an SDK, just use standard WebSockets. There exists an example annotation environment that shows the integration. 

Learnings from the attempted integration with Recogito: Having reactive data flows in an application is good---also, being able to properly react to created/updated/deleted entities supports the integration. React and other libraries that use a virtual DOM, for instance, are well-suited for this task, but also other user interface libraries such as Svelte support updating the DOM based on mutations on the underlying data.

## Conclusion

With many platforms involved—researchers, institutions, platforms, non-academic users—it’s difficult to find the perfect solution suiting all their needs. The “Thick Client” approach presented first ensures an annotator’s independence when publishing, but bears the quick exhaustion of their computational resources. The second approach, Hyperwell, performed well in testing due to a clear distinction of personal (individual) and institutional (centralized) computational resources, but takes the way of introducing quasi-centralized gateways.

