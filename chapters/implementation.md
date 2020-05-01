\addtocontents{toc}{\protect\newpage}
# Implementation {#sec:implementation}

When I approached the design and subsequent implementation of a system that it should cons the previously defined concepts of digital notebooks and public entities that were introduced in chapter \ref{sec:annotation}. The architecture was required to comply with the technical assumption that web is a predominant way for a majority of people and institutions to interact with data, and thus the system should ensure interoperability with the web platform. The Web Annotation specification covers both a REST-based protocol and a data model. As both LOD and LDP are emerging factors in the Digital Humanities, the system should leverage both for enabling interoperable semantic annotation.

Design decisions on P2P systems commonly entail implications on usability, data availability, and autonomy of users: As argued in @sec:annotation:infrastructure, minor technical adjustments on network structures can fundamentally affect the power of peers and the distribution of data on such a system. _TODO:_ Gateways as the solution for that (detailed in @sec:hyperwell), ensuring compliance with today’s standards as well as backwards compatibility.

I have previously discussed the role of gateways and overlay networks in P2P systems. The following @sec:bridging builds upon this perception and continues to put gateways in context with bridging decentralized networks and the web. With a focus on widely supported web technologies and protocols, I will suggest three strategies for realizing bridging web protocols and the Hyperswarm network.

Drawing from these strategies, I then detail two designs of P2P systems for personal, local-first annotation, and their respective implementations: First, a system that emphasizes independent publishing of notebooks (@sec:thick) by leveraging an HTTP-inspired overlay network protocol and deep integration into Recogito. A redesigned system called Hyperwell emerged (@sec:hyperwell) after encountering architectural issues with the overlay network of the previous approach. Hyperwell solves performance bottlenecks by introducing institutional replication of personal notebooks.

TODO CLEANUP? In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Bridging Decentralized Networks and the Web {#sec:bridging}



![An architecture leveraging a gateway node for bridging resources from a P2P system into the web [@matsubara2010]. For providing access to a P2P network, the gateway acts as both a peer within the P2P network and as a HTTP server. Gateway logic translates between both systems.](figures/matsubara-p2p-gateway.png){#fig:p2p-gateway short-caption="Architecture for bridging resources from a P2P system into the web"}

TODO: Make it explicit that the work done in this chapter (and for the thesis) has been to build an architecture that serves in two ways: First, it has to be built around hypermerge—the library itself does not provide any de-facto requirement of how data should be distributed. It facilitates data distribution. Second, the architecture should resemble the notion that I have imposed in @sec:annotation.

TODO: Emphasize the limitations for modern JavaScript applications: With the Node.js runtime—in theory—,the same code can be executed isomorphically on both directly on a devices as well as in the browser. However, both platforms serve different environments: Node.js supports bindings to native code, such as libraries written in C++, while browsers provide separate APIs of the web platform, such as WebGL graphics and access to device sensors. Thus, having 

TODO: Maybe give an introduction to Hyperswarm, swarms, and how replication commonly happens for Hyperswarm/Hypercore? Also, an introduction to *duplex streams* would be helpful. What is *replication*?

TODO: Three approaches to bridging decentralized networks and the web by using web technologies supported by contemporary web browsers (@fig:bridging-approaches):

![Approaches for bridging between decentralized file-sharing networks and the web.](figures/bridging-approaches.png){#fig:bridging-approaches short-caption="Approaches for bridging between decentralized file-sharing networks and the web"}

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

![Architecture of the _thick-peer_ implementation using an overlay network. Peers can replicate documents directly within the Hyperswarm network (1). On behalf of web clients, the protocol bridge connects to decentralized swarms as ephemeral peer and establishes a duplex stream tunnel (2). Then, web clients can transmit their requests via WebSocket connections (3), which are tunneled by the bridge.](figures/thick-architecture.png){#fig:thick-peer short-caption="Architecture of the thick-peer implementation"}

Technically, this has major implications for the resulting architecture of such a system. Fundamentally, clients can't arbitrarily serve content via HTTP and DNS---at least, not without a substantial amount of device-specific configuration. Hence, independent and decentralized publishing via HTTP is no viable approach and other protocols should be considered. Protocols such as IPFS and Dat recently gained experimental support in several web browsers[^opera-p2p], but as major web browsers---Google Chrome, Apple Safari, and Mozilla Firefox---still share a joint market share of about 86%[^market-share], widespread adoption of such protocols is still a long time in the coming.

Integrating with the available stack of Web technologies, both the peer software running locally as well as the browser integration have been written in the JavaScript programming language. Modern versions of JavaScript---most notably, ECMAScript 7[^ecma7]---are widely supported by modern Web browsers. With the Node.js[^nodejs] JavaScript runtime, applications written in JavaScript can be executed locally via the V8 JavaScript runtime[^v8].

TODO: WebSocket connections

TODO: Use Hyperswarm as a decentralized networking solution for swarming, and a WebRTC bridge to connect to browser clients [@frazee2019].

TODO: Use Hypermerge as a CRDT-equipped data structure backed by the Hypercore append-only log. Integrates with Hyperswarm to exchange changes with peers operating on copies of the same data structure and merge changes automatically and conflict-free.

TODO: Implemented a HTTP-like protocol based on Protocol Buffers[^protocol-buffers], as explained in @sec:thick:protocols.

In the following, I will outline two characteristic contributions of this approach: First, a novel, HTTP-like protocol was created to enable client-server connections over multiplexed duplex socket connections. This protocol leverages the Protocol Buffers standard and is detailed in @sec:thick:protocols. Second, as peers within the network transfer data without higher-level supernodes—despite an overlay network—, a flat hierarchy is established. An approach for announcing work on particular resources with the intention of collaboration is described in @sec:thick:discovery. By establishing a new protocol for retrieving annotations from a distributed network, browsers need to be provided with libraries to support these protocols---one such library, a Software Development Kit (SDK), for integrating client applications, is detailed in @sec:thick:sdk.

The approach of the first version, however, had several severe drawbacks. While an in-depth evaluation of this thesis' contributions will be discussed far below in @sec:discussion, I will give an outline of these drawbacks in the following @sec:thick:issues.

[^ecma7]: <https://www.ecma-international.org/ecma-262/7.0/index.html>.
[^nodejs]: <https://nodejs.org/en/>.
[^v8]: <https://v8.dev/>.
[^iiif-id]: <https://iiif.io/api/presentation/2.0/#technical-properties>.
[^cts-urn]: <https://www.homermultitext.org/hmt-docs/cite/cts-urn-overview.html>.
[^biiif]: `biiif` is a tool for independent publishing of IIIF manifests: <https://github.com/edsilv/biiif>. By generating a IIIF manifest from a filesystem-based image gallery and corresponding metadata, users can easily host IIIF galleries via P2P file-sharing protocols such as Dat or IPFS.
[^opera-p2p]: Opera has been branded as suited for "mainstream crypto-adoption", meaning to support P2P technologies by interoperating with technologies such as the Ethereum blockchain and the IPFS network: <https://press.opera.com/2020/03/30/opera-introduces-major-updates-to-its-blockchain-browser-on-android/>.
[^market-share]: <https://gs.statcounter.com/browser-market-share#monthly-201902-202002>.
[^webrtc]: <https://www.w3.org/TR/webrtc/>.
[^websocket]: <https://html.spec.whatwg.org/multipage/web-sockets.html>.

### Protocols {#sec:thick:protocols}

By utilizing a server that bridges WebSocket connections into the TCP or uTP socket-based Hyperswarm network connections, web clients are able to join swarms in the Hyperswarm network and connect to other peers of a swarm. This has been achieved by utilizing the fact that the WebSocket protocol establishes a duplex stream—that is, readable as well as writable—between client and server. By using the `hyperswarm-proxy`[^hyperswarm-proxy] library, this duplex stream can then be forwarded to peers of the respective Hyperswarm peers.

In @sec:bridging, I have outlined possible approaches for connecting web clients into the Hyperswarm network. A major limitation of the CRDT-backed Hypermerge library is its incompatibility with the web platform, as it entails native code dependencies. Hence, using WebRTC connections to directly connect web clients with Hyperswarm peers—approach 1 of @fig:bridging-approaches—is not a viable solution for this context. However, creating a separate overlay network enabled web clients to communicate with Hyperswarm peers independently of Hypermerge.

In order to request and mutate resources on this network, a separate application protocol was then required. The HTTP protocol would actually have met the needs of this overlay network, as it is a well-established and extensively documented foundation of the web. HTTP would furthermore have allowed for an actual implementation of the Web Annotation Protocol between participants of this network. However, I have faced two severe issues: First, there exist no established JavaScript-based implementations of HTTP parsers that could be utilized on web clients[^http-parser]. Second, the nature of Hyperswarm connections is not deterministic as peers continuously join and leave a swarm—thus, connections can not be established on-demand as easily as directly via DNS-based URLs and should be used as efficiently as possible. HTTP supports pipelining of multiple requests over the same TCP connection, yet it is explicitly being advised against this practice [@fielding1999, p. 46].

By creating a separate, HTTP-inspired protocol, compatibility could be ensured for exchanging annotations on the overlay network between web clients and Hyperswarm peers. The protocol uses the Protocol Buffers[^protobuf] scheme in order to express custom protocol messages and events that align with a subset of features in HTTP. Protocol Buffers simplify parsing of protocol messages and allow the protocol to multiplex several request-response sequences over the same connection in parallel.

I would like to emphasize that this approach of using an HTTP-like protocol will relinquish the bidirectional nature of a duplex stream as compared to stream-based replication of Hypercore logs: While the connection itself is bidirectional, the semantics of the protocol are not. A web client selectively requests data from a peer, which will make this peer become a server. This entails heterogeneities for P2P systems, which I will discuss in @sec:thick:issues. In the following, I will increasingly refer to peers as clients and servers to highlight their functional distinction.

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

[^hyperswarm-proxy]: <https://github.com/RangerMauve/hyperswarm-proxy>
[^protobuf]: <https://developers.google.com/protocol-buffers/>
[^long-polling]: In contrast to conventional "short-polling", where clients send requests to servers on-demand, "long-polling" requests will hold a client-initiated connection open for a longer period of time and expects the server to continuously deliver messages: <https://www.hjp.at/doc/rfc/rfc6202.html#sec_2.1>

### Resource Discovery {#sec:thick:discovery}

While evaluating the conditions on why Recogito has been chosen as a case study and reference environment for developing the technology presented in this chapter, several prospects around an open and distributed annotation storage have emerged. With Linked Data entities being available for client applications running locally, semantic relations could easily be examined outside of the annotation environment itself. Furthermore, as the UI of an application becomes increasingly _lean_ by decoupling from a heavy and centralized data-processing backend, user-facing functionality can be better integrated with workflows based on the data model itself.

With that in mind, I have designed a functionality for discovering related work of other users based on the URL of the annotated resource. This approach is inherently decentralized: Each peer maintains its own ephemeral list of related work. By leveraging the decentralized networking of Hyperswarm similarly as in @sec:thick:protocols, peers join a swarm of peers based on a topic. In this case of discovering resources, this topic is a hashed representation of the annotated document's canonical identifier, such a CTS URN or a general URL. Once peers discover and connect to each other, they quickly exchange discovery messages. Such a message is defined more precisely in @lst:proto-discovery as a `DiscoveryEvent` message of type `ANNOUNCE`. Once a peer goes offline, it will broadcast an `UNANNOUNCE` type message.

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

[^http-parser]: The code of the Node.js runtime’s built-in HTTP parser is written in C++: <https://github.com/nodejs/http-parser>.

### Software Development Kit {#sec:thick:sdk}

By equipping the HTTP-like functionality of request and response messages with per-request identifiers and subscription capabilities, clients on the web _theoretically_ became capable of joining a simulated P2P Web Annotation system via the distributed Hyperswarm network. However, one  trade-off soon emerged: By not using the ubiquitous HTTP as a transfer protocol, the client had to be supplied with additional software components for interfacing with the Hyperswarm network via WebSocket connections. Software Development Kits (SDKs) commonly provide such missing components, and after equipping Recogito with such an SDK in form of a standalone JavaScript bundle, web clients were finally able to interact with peers on the decentralized network.

Listing: Example code using the JavaScript client SDK for interacting with decentralized annotations on a high-level API.

```{#lst:sdk-example .js}
const {RequestSwarm, DiscoverySwarm} =
  require('from-me-to-you/browser')
const swarm = new RequestSwarm(docUrl)

swarm.on('ready', async () => {
  const annotations = await swarm.getAnnotations()
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

The development of a prototype of this software coincided with the timeframe of the study described in chapter \ref{sec:study}. Having established a testing group, I adapted a copy of Recogito to use the aforementioned SDK for storing annotations on the decentralized network. Throughout small-scale local testing with machines on the same network, annotations were transmitted in real-time between two clients running the modified Recogito software. Nevertheless, when the testing group joined from the Furman University network, the machine providing the annotations from Leipzig via Hyperswarm ceased to function.

The architecture poses a severe conceptual issue: By bridging the web and a P2P network, a multitude of clients gain access to data eventually stored on a small number of peers on the decentralized network, thus far exceeding their limited resources. Identifying this issue led to significant changes on the architecture, which I will discuss in the following @sec:hyperwell. In chapter \ref{sec:discussion}, I will further detail the issue of the current architecture.

## Second Version: Institutional Governance with Hyperwell {#sec:hyperwell}

The initial attempt at realizing a distributed annotation authoring system outlined in @sec:thick provided promising prospects on independent publishing as well as novel technologies and protocols, but also highlighted one major challenge for such systems: While P2P systems can distribute network and computational load onto a multitude of peers---as data is replicated among peers---, interfacing a distributed system with less decentralized systems will lead to unpredictable and less distributed requests on resources, essentially putting a strain onto a minority of peers. This realization resulted in the following conclusion: In order to ensure efficiency and integrity for the P2P network, the _translating component_ has to be externalized in terms of infrastructure and governance. Such gateways can translate between both networks, and be scaled separately. This gateway infrastructure makes an essential part of the architecture, but, nevertheless, should be of a volatile nature.

![Architecture of Hyperwell: Peers exchange their notebooks in real-time (1). Gateways, run by institutions, archive selected notebooks and bridge them into the web (2). Web applications can access annotations via gateways, as they implement the Web Annotation protocol (3). These applications can load canonical resources via services such as CTS or IIIF (4) [@kassel2020a].](figures/architecture.pdf){#fig:hyperwell-architecture short-caption="Architecture of Hyperwell using gateways"}

Progressing from the first approach outlined in @sec:thick, separating the component that translates between the P2P system and the web resulted in a second iteration of the architecture, which is illustrated in @fig:hyperwell-architecture: With this approach, a dedicated middle layer receives connections from both sides, acting as a peer in the decentralized network and as a HTTP server on the web.

### Gateway Server {#sec:hyperwell:gateway}

The Hyperwell gateway server manifests the separation of that translating component and represents an institutional entity in a P2P system. In a proof-of-concept implementation, I have outlined how such a gateway could be realized while considering both users’ needs as well as institutional requirements. Most fundamentally, the gateway translates JSON-encoded annotations of the Web Annotation Data Model between decentralized swarms of Hyperswarm and the web. Therefore, it exposes an HTTP API that complies with the REST-based Web Annotation Protocol and complements this API with further capabilities, such as subscribing to real-time updates of annotations via WebSocket connections and bulk operations on notebooks.

Primarily, a gateway on Hyperwell provides the following functionalities for peers on the decentralized network:

* **Long-term archiving**: Gateways support associated peers by continuously replicate their repositories for backup and archiving.
* **High availability**: Other than personal devices, gateways can be deployed in data centers with high-bandwidth network connections, 24/7 uptime, and enterprise-grade hardware. These environments can ensure high availability of repositories
* **Professional affiliation**: On the web, domains resolved via DNS can express affiliations with an official institution and hence, secure credibility. For example, domains in the context of academia commonly follow schemes such  `xyz.edu` or `uni-xyz.de`. Consequently, institutional gateways can assure a researcher’s or repository’s affiliation by following these naming schemes with, for example, `service.xyz.edu`.

![Architecture of the Hyperwell gateway server. While real-time replication of repositories happens via the Hyperswarm network (1), changes are also persisted to disk (2). Hypermerge (3) then applies uses the Automerge CRDT to merge different versions of a repository. The gateway caches recently accessed repositories (4) and performs a diff (5) if sequential updates are requested. Annotation IDs are then translated into LOD URIs (6) and served via HTTP (7) or WebSocket (8) connections.](figures/gateway-architecture.pdf){#fig:gateway-architecture short-caption="Architecture of the Hyperwell gateway server"}

@Fig:gateway-architecture outlines the components of this gateway implementation. Some components could be adopted from the thick peer approach: Primarily, the Hyperwell gateway shares the general concept of distributing annotations via a combination of decentralized networking with Hyperswarm and handling distributed documents with Hypermerge. Nevertheless, introducing an institution as neutral entity to the system has caused some additional components to appear. I will detail these components in the following.

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

![Calculating differences between sets by hashing their values. In a simple and commonly shorter representation as hash value, complex objects such as JSON dictionaries can be compared to each other more efficiently.](figures/notebook-diffing.pdf){#fig:notebook-diffing short-caption="Calculating differences between sets by hashing their values"}

The distribution of real-time updates on changes of Hypermerge documents became a non-trivial challenge: By design, the Hypermerge API allows to listen for updates on a document via the `RepoFrontend.watch(callback)` method. However, this event handler will receive the entire state of the changed document rather than just the changes[^hypermerge-watch]. In the context of subscriptions on real-time changes in notebooks of Hyperwell, this entails sending each subscriber the entire updated notebook instead of a changeset—i.e., additions, edits, and deletions. This practice would put an immense strain on the network bandwidth that quickly scales with the amount of subscribers, the notebook size, and the frequency of changes. Eventually, each subscriber would be required to calculate the differences by itself. By calculating the changeset between two states on the gateway instead, a significantly smaller amount of data will be transmitted on each change. Illustrated in @fig:notebook-diffing, this changeset can be calculated by mapping the value of each item of a notebook---i.e., a Web Annotation JSON object---to a data type that can be compared more easily, such as a hashed sequence of bytes. Two lists of hashes can then be compared with each other, which will result in a changeset of added, changed, and deleted items. For hashing, the gateway implementation currently uses the SHA-256 hashing algorithm, which generates digests of 256 bit size.

When considering data ownership and power structures in the Hyperwell architecture, it is important to note that notebooks should not depend on a particular gateway node. When creating an annotation by using the gateway’s REST API, it will issue a Universally Unique Identifier (UUID[^uuid]) for the previously undefined ID of this annotation. This ensures that each annotation is uniquely identifiable within a notebook. However, the Web Annotation data model specifies that annotations are identified by their host-dependent IRIs. Incorporating the parent notebook’s Hypermerge-issued URL into the annotation’s IRI will result in incompatibilities, as browsers are commonly not able to resolve Hyperwell-issued URLs. Hence, gateways translate between both schemes: Hyperwell internally identifies notebooks by their Hypermerge document URLs---e.g., `hypermerge:/abc123`---and gateways then translate these into IRIs by adding their hostname and the annotation ID to the encoded document URL---e.g., `https://gateway.example.com/annotations/def456/11-22-33`.

Some features such as archiving rely on an identity system. While the Hypercore append-only log uses public key encryption for identity and security, Hypermerge currently does not expose such functionality out-of-the-box. With a focus on Linked Data and web technology, I will discuss this matter—among other shortcomings—in @sec:discussion.

[^hapi]: Hapi is a production-ready web framework: <https://hapi.dev/>. Hapi is written in JavaScript and runs in the Node.js runtime. With a variety of plugins, its functionality can be extended, for example by adding support for the WebSocket protocol.
[^ldp-containers]: With Linked Data, resources can be grouped into containers: <https://www.w3.org/TR/ldp/#ldpc>. These containers can assort entities semantically: “Each resource created in the application or site is created within an instance of one of these container-like entities, and users can list the existing artifacts within one”.

[^websocket-subprotocols]: The WebSocket protocol supports the use of specific subprotocols [@fette2011, p. 12]. Frameworks and services can leverage these subprotocols for imposing their own structured communication paradigms. Yet for the sake of simplicity and compatibility, the gateway subscription endpoint purely relies on the WebSocket protocol as a stream for pushing data to clients in real-time.
[^hypermerge-watch]: Automerge, the underlying CRDT of Hypermerge, provides a more low-level API that poses little assumption on how exactly changes are transmitted. With the `Automerge.getChanges()` method, changeset between two states can be propagated explicitly.
[^uuid]: UUIDs have been specified on RFC 4122: <https://www.ietf.org/rfc/rfc4122.txt>.

### Support in Annotation Environments {#sec:hyperwell:support}

In order to validate the functionality of the Hyperwell gateway and its compliance with the Web Annotation specification, I have continuously attempted to feed existing annotation environments with the gateway annotation server. Initially, and due to the experience from the user testing study outlined in @sec:study, I have chosen Recogito for a proof-of-concept of supporting Hyperwell via the gateway.

Listing: Accessing the APIs of a Hyperwell gateway via the HTTP and WebSocket protocols using commonly supported browser APIs in JavaScript.

```{#lst:hyperwell-support .js}
const res = await fetch(
  `https://${host}/annotations/${notebookId}/`,
  { headers: { "Content-Type": "application/json" } }
)
const annotations = await res.json()

const ws = new WebSocket(
  `wss://${host}/annotations/subscribe/${notebookId}/`
);
ws.onmessage = (event) => {
  const diff = JSON.parse(event.data);
}
```

First attempts at realizing this support went successful: In Recogito, a base class[^js-prototypes] called `baseApp` provides the fundamental functionality for retrieving and mutating annotation objects of various editor types supported in Recogito, such as editors for annotation of images or CTS-based documents. By replacing calls to Recogito’s own backend API—such as `API.storeAnnotation(annotation)`—with simple HTTP requests to the gateway’s Web Annotation REST endpoints, since the gateway abstracts the decentralized network. This standard-compliant approach facilitates adoption as opposed to the first implementation approach, which required further software to support the overlay network protocols. Eventually after retrieving annotations from the gateway via HTTP, at least the _initial_ state—i.e., at load time—of the annotation editor could be propagated with annotations originating from the decentralized network. @Lst:hyperwell-support illustrates how resources can be accessed on a Hyperwell gateway using standard browser APIs.

Further supporting WebSocket-based subscriptions from the gateway entailed making Recogito capable of real-time collaborative annotation. This requires receiving and sending changes on annotations as their occur and subsequently reflecting these changes in the UI. By supporting the standard WebSocket protocol without any further subprotocols, the actual connection for exchanging real-time updates can be easily established. However, translating these updates into mutations on the browser’s DOM through Recogito became cumbersome, because various components of Recogito—such as the annotation editor and the text highlighter—were encapsulate and intended to reflect user-issued changes on the annotations, but not changes originating from the backend.

\citeauthor{hardenberg2020} clarify their approach on evaluating methods for translating frequent backend-issued changes to a UI: With the approach of Functional Reactive Programming (FRP), the (visual) rendering of a UI component is considered a deterministic mapping of the components’ state to the respective target, such as DOM nodes. Without any side effects while rendering, the UI will reflect its state exclusively and thus could straightforwardly incorporate external changes on its state.

I eventually ceased work on the Recogito integration, as its complex code base would have required a substantial amount changes in order to make real-time collaborative annotation work. Meanwhile, Dr. Rainer Simon, lead developer of Recogito, extracted the annotation mechanisms of Recogito and created a new library called RecogitoJS[^recogito-js]. For displaying the annotation editor on top of a source RecogitoJS uses React[^react], a web UI development framework created at Facebook. 

![Annotation environment for testing the Hyperwell gateway. Users can collaboratively annotate the first chapter of Goethe’s Faust, as changes on the provided notebook are transmitted in real-time.](figures/test-environment.png){#fig:test-environment short-caption="Annotation environment for testing the Hyperwell gateway"}

In an experimental, yet simple annotation environment application for testing the Hyperwell gateway, RecogitoJS is utilized for annotating the first chapter of Goethe’s Faust. The UI of the application is pictured in @fig:test-environment. Prior to annotating the source, users have to specify an annotation server where they want to load annotations from. If this server is a Hyperwell gateway, the environment will establish a WebSocket connection and enable real-time collaboration of the source.

[^js-prototypes]: The JavaScript specification just gained support for syntactic classes in recent years. While the referred object in Recogito functions as a class with instance methods and an instance-based state, JavaScript classes essentially are an abstraction of prototype-based objects: <https://tc39.es/ecma262/#sec-objects>.
[^recogito-js]: RecogitoJS is <https://github.com/pelagios/recogito-text-js>.
[^react]: <https://reactjs.org/>.

### Notebook Application {#sec:hyperwell:notebook}

The Hyperwell gateway repository provides tools for imitating clients that share notebooks on the network. Inspired by the work of @hardenberg2020, I have attempted building a local-first application for managing notebooks on personal devices. The temporal scope of this thesis did not allow for finishing a minimum viable prototype, yet I desire to report the application's design and architecture nonetheless.

![Architecture of the Hyperwell notebook application.](figures/notebook-architecture.pdf){#fig:notebook-architecture short-caption="Architecture of the Hyperwell notebook application"}

The Notebook application is intended to manifests the local ownership of annotations on a user's device, taking from the metaphor of a physical notebook. By maintaining all entries locally, the application can provide the following services:

* **Managing** notebooks: The Notebook application maintains a local copy of entire digital notebooks. Users can choose to create new notebooks or delete existing ones. Furthermore, they can control with whom to share a notebook; this could be private collaboration with selective write access or read-only public access. While particular semantics of annotations may depend on the respective annotation environment used, the application can rely on standardized parts of the Web Annotation data model and visually highlight the annotated sources.
* **Replicating** notebooks: By default, the application runs as a daemon (i.e., a system-managed background process). Thereby, it provides uptime to the notebooka and can receive all changes by collaborators in real-time. 
* **Searching** notebooks: Maintaing an entire search index locally provides users instant results on full-text search on annotation bodies, as well as extended searching capabilities on annotation targets and collaborators.

Using the Electron[^electron] framework, the application logic and the user interface can be developed using web technologies such as HTML, CSS, and JavaScript. By shipping applications with a bundled copy of the Chromium web browser,

A backend process runs via an included Node.js runtime.
* The user interface is being realized with the JavaScript-based React[^react] framework.
* Akin to the gateway server, the application uses Hypermerge with Hyperswarm for exchanging distributed notebooks.
* Search indexing?

[^electron]: Electron is a framework for building desktop applications with web technologies: <https://www.electronjs.org/>. Electron applications ship their own copy of the Chromium browser as well as the Node.js runtime. They are packed as native executables, can be build cross-platform, and have their application logic written in JavaScript.
[^react]: React is a popular framework for building interactive web applications: <https://www.reactjs.org/>. Maintained by Facebook, React leverages functional reactive programming (FRP) principles and uses a virtual DOM for only patching changed parts of the user interface. Next.js builds upon React and provides ready-to-use solutions for many common scenarios, such as pre-rendering and CSS-in-JS styling: <https://nextjs.org/>.

## Conclusion {#sec:implementation:conclusion}

In @sec:bridging, I have outlined three approaches on bridging the web and decentralized networks for real-time replication of annotations. Two of these approaches utilize additional, centralized services—i.e., proxies or gateways—in order to translate network traffic into protocols commonly supported on the web. The former of these two approach involved  taking connections from web clients via the WebSocket protocol and forwarding an underlying novel HTTP-inspired protocol via duplex streams to peers on the decentralized network. This allows peers to publish annotations independently of any _particular_ bridge but entails the requirement of SDKs in order to support web applications using the above communication capabilities. The latter approach puts an even larger emphasis on a centralized network extension: With gateways, institutions can reliably provide annotations from affiliated users to annotation environments on the web.

With many stakeholders involved—i.e., researchers, institutions, platforms, non-academic users—it becomes increasingly difficult to settle with a solution suiting all their needs. The implementations derived from the above concepts draw a multifaceted picture of possible solutions to P2P annotation. The first presented “thick client” approach attempts to ensure server-independent publishing of digital notebooks. However, the overlay network for bridging the decentralized network to web clients can cause an unexpected amount of network requests on individuals’, putting a strain on their commonly limited computational resources. With a system named Hyperwell, the second implementation performed well during initial testing due to a clear distinction between personal (individual) and public (institutional) computational resources and introduces an institutionally-governed gateway server for bringing distributed personal notebooks to the web.
