\addtocontents{toc}{\protect\newpage}
# Implementation {#sec:implementation}

With end-to-end encryption, optional networking, and real-time collaboration, the paradigm of local-first software provides a foundation for establishing private collaboration between peers. While local-first applications can synchronize via arbitrary means of communication, I have argued in the previous chapter \ref{sec:annotation} in favor of P2P networks. By leveraging direct connections between peers, distributed systems can avoid centralized infrastructures, emphasize local-first data, and thus sustain individual digital ownership. Arguably, local-first software majorly concerns how _applications_ maintain and distribute data. An architecture is further required to address the aforementioned questions on _public entities_ in distributed systems, which support the systems' operations by providing peers with services such as increased data availability and long-term archiving.

In chapter \ref{sec:study}, I have presented how collaboration and LOD can be leveraged in Digital Humanities software. While the results were estimated in an explorative environment, they hint at possible prospects for real-time collaboration in contemporary workflows. By instantly reflecting changes on the underlying shared workspace in the UI, users can promptly interact with others' work.

The use of LOD data sets such as digital gazetteers emphasizes the need for canonical data services. Furthermore, common LD and LDP standards like the Web Annotation protocol specify REST-based APIs for interacting with resources. Hence, in order to ensure interoperability between P2P networks and the web, gateways need to provide additional services for bridging resources between both. While gateways fit into the concept of a _public entity_ in a distributed network---as defined in @sec:annotation:ownership---they raise further questions on authoring and ownership as soon as they relay data beyond the distributed realm. The following @sec:bridging builds upon the previous discussion by providing two technological approaches for bridging connections between the P2P network and the web.

Built upon these approaches, I then detail two implementations of P2P systems that provide personal, local-first annotation. First, a system that emphasizes independent authoring of notebooks on the web (@sec:thick) by leveraging an HTTP-inspired overlay network protocol and a deep integration into annotation environments. A redesigned system called _Hyperwell_ emerged from first design (@sec:hyperwell) and introduces institutional gateways that offer data availability, archiving, and interoperability with the web.

## Bridging P2P Networks and the Web {#sec:bridging}

![Architecture that leverages a gateway server for bridging a P2P system and the web [@matsubara2010]. For relaying resources between both networks, the gateway acts as both a peer within the P2P network and as a HTTP server. A gateway logic translates between both systems.](figures/matsubara-p2p-gateway.png){#fig:p2p-gateway short-caption="Gateway server that bridges a P2P system and the web"}

P2P systems and client-server architectures operate fundamentally different from each other and commonly utilize different protocols for communication. I have previously proposed the notion of _public entities_ on P2P networks for services that support the networks' operations but do not expose themselves as a critical part of the infrastructure. Gateway services---similar to a public entity---can bridge both P2P systems and the web as we have argued previously in @kassel2020a. By joining as both a peer on the P2P network and a HTTP server on the web, a gateway can relay resources between both networks. A translational component then mediates resources and connections as described in a patent from @matsubara2010 pictured in @fig:p2p-gateway. This effectively provides interoperability between both networks and makes resources available to a wider audience of nodes. Further communication technologies such as the WebRTC protocol and overlay networks could pose an alternative to gateways by directly connecting peers and web clients. Nonetheless, these protocols require adoption on both systems and thus demands further technological support from peers.

The Hyperswarm networking stack establishes connections via TCP and uTP [@frazee2018]. Peers discover each other via the Kademlia-based DHT, coordinate themselves in _swarms_ (i.e., groups of peers based on a topic), and communicate with each other via duplex streams. Furthermore, Hyperswarm adds additional support for establishing connections behind firewalls (hole punching) and NAT. A proxy server[^hyperswarm-web] finally allows to relay Hyperswarm connections to web clients via WebRTC.

The respective approaches on bridging P2P networks and the web will be shaped by further technological constraints. Modern JavaScript is essentially supported in native environments and the web alike, yet both the popular Node.js JavaScript runtime and the web are situated with different requirements. Native environments often require deeper integration with the underlying operating system, thus Node.js supports bindings with binary modules (e.g., C++ libraries) and OS-level APIs such as for networking and file-system access. Hypermerge and its affiliated libraries (Hypercore and Hyperswarm) entail such dependencies for networking purposes or cryptographical methods. Due to these dependencies, web clients can not run the Hypermerge library. This calls for alternative approaches on data exchange when not using gateways for separating both networks.

Based on the above constraints, I have conceived two approaches for bridging P2P networks and the web in regard to sharing Web Annotation resources in real-time:

1. **Overlay networks:** Establish connections directly between peers on the P2P network and web clients. These connections could be established either via WebRTC or with the WebSocket protocol, connecting web clients to nodes on the Hyperswarm network. Either approach requires proxy servers[^hyperswarm-web] to translate the above connection methods to native network connections on Hyperswarm. An overlay network is then used for handling data exchange between web clients and peers.
2. **Gateways:** Enforce a strict separation between both networks by using gateway servers to properly mediate between both realms. The gateway server joins the P2P network like a regular peer and serves an API compliant with the Web Annotation API on the web.

Nevertheless, both the second and third approach promised viable architectures for bridging resources between P2P networks and the web. In preliminary tests, however, I have encountered frequent issues with WebRTC connections due to variations in browser support or challenging network conditions, where WebRTC must rely on additional technologies for establishing connections. Because of these concerns on stability, I have ultimately decided against using WebRTC at all. In the following, I will detail architecture designs and implementations for each approach, embedding them into collaborative environments.

[^hyperswarm-web]: <https://github.com/RangerMauve/hyperswarm-web>.

## First Implementation: Thick Peers {#sec:thick}

The first implementation leverages an overlay network for connecting web clients with peers on the P2P network. By using this overlay network, nodes on both networks can communicate with each other and share resources. Furthermore, by leveraging the paradigm of local-first software, users maintain ownership on their annotations and can---by using CRDTs---collaborate with other peers in real-time without a centralized merging authority.

Peers should additionally be able to author and publish annotations to the web without depending of services such as gateways. This aspect of technological autonomy was influenced by projects such as Dokieli [@capadisli2017] and `biiif`.[^biiif] Such software enables using personal storage---data storage providers such as Solid or even storage provided via P2P networks---for publishing and eliminate the need for a complex and expensive technical infrastructure. By independently interfacing with the web, each peer has to manage both connections to peers on the P2P network and connections originating from the web. The latter increases the amount of overhead compared to regular peers on the network, thus making them _thick peers_. Within the P2P system, an infrastructure of _public entities_ can mirror personal repositories and provide high-availability replication, redundant backups, and increased bandwidth for particular resources.

When approaching this implementation, I focused on building an annotation publishing system for a specific end-to-end annotation workflow. Recogito, the semantic annotation environment used during the study on collaborative workflows in chapter \ref{sec:study}, served as a case study during the development. Recogito ensures interoperability with other annotation systems by adopting the Web Annotation data model based on JSON-LD. The conceived workflow considered the following functionalities. The end-to-end workflow included discovery of related notebooks on a source within the UI of Recogito itself as well as real-time collaboration capabilities.

![Architecture of the thick-peer implementation. Peers can replicate documents directly within the Hyperswarm network (1). On behalf of web clients, the protocol bridge connects with decentralized swarms as an ephemeral peer and establishes a duplex stream tunnel (2). Web clients can then transmit their requests through the bridge via WebSocket connections (3).](figures/thick-architecture.png){#fig:thick-peer short-caption="Architecture of the thick-peer implementation"}

These collaborative capabilities build upon the prospects of the Hypermerge library: secure, private, real-time collaboration without the need for centralized services. In the architecture pictured in @fig:thick-peer, users run annotation authoring tools that synchronize changes on annotations in real-time with Hypermerge and join swarms on the Hyperswarm network. By using a specific overlay communication protocol, clients on the web can join related swarms. This is achieved by introducing _protocol bridges_ that translate WebSocket connections from web clients into native TCP/uTP-based connections on the Hyperswarm network. By exclusively relaying connections, protocol bridges can ensure the autonomy of peers in the distributed system. Web clients can arbitrarily choose any protocol bridge for connecting to the network, since resources themselves (i.e., annotations) are not stored on the servers running the bridges.

In the following, I will outline two characteristic contributions of this approach. First, a novel, HTTP-inspired protocol that establishes multiplexed request-response communication over duplex stream connections. This protocol leverages the Protocol Buffers standard and is detailed in @sec:thick:protocol. Second, in @sec:thick:discovery I will describe an approach on facilitated collaboration by publicly announcing annotations on particular sources on the web. Furthermore, by using a  further novel protocol for retrieving annotations from a distributed network, browsers need to be provided with libraries to support these protocols. A Software Development Kit (SDK)---a type of library---for integrating client applications is detailed in @sec:thick:sdk.

However, the architecture behind this first implementation beared several fundamental challenges. While an in-depth evaluation of this thesis' contributions will be discussed far later in chapter \ref{sec:discussion}, I will briefly address these challenges in the context of this chapter in @sec:thick:evaluation.

[^biiif]: `biiif` is a tool that allows to independently publish IIIF manifests: <https://github.com/edsilv/biiif>. By generating a IIIF manifest from an image gallery and corresponding metadata based on the file system, users can easily host IIIF galleries via P2P file-sharing protocols such as Dat or IPFS.

### Communication Protocol {#sec:thick:protocol}

By connecting to a service that translates WebSocket connections into native TCP/uTP Hyperswarm network connections, web clients can join swarms on the Hyperswarm network and subsequently connect to other peers. This has been achieved by using WebSocket-established duplex streams---i.e., bidirectional streams with read and write permissions---between web clients and the bridging service. By using the `hyperswarm-proxy`[^hyperswarm-proxy] library, this duplex stream can then be relayed to peers of the respective network swarm on Hyperswarm.

In @sec:bridging, I have outlined possible approaches for connecting web clients to the Hyperswarm network. A major limitation of the CRDT-backed Hypermerge library is its incompatibility with the web platform, as it entails native code dependencies. Hence, using WebRTC connections to directly connect web clients to Hyperswarm peers is not a possible solution in this context. However, creating a separate overlay network enabled web clients to communicate with Hyperswarm peers independently of Hypermerge itself.

In order to request and mutate resources on this network, this approach required a separate application protocol. The HTTP protocol meets the needs of this overlay network, as it is the well-established and extensively documented foundation of communication on the web. HTTP furthermore allows for an actual implementation of the Web Annotation protocol between participants of this network. However, I have faced two challenges in that regard. First, there exist no well-established JavaScript-based HTTP parser implementations that could be executed in a web environment[^http-parser]. Second, the nature of Hyperswarm connections is not deterministic as peers continuously join and leave a swarm. Hence, connections on can not be established on-demand as easily as via DNS-based URLs and should be used as efficiently as possible. HTTP supports to pipeline multiple requests over the same TCP connection, yet it is explicitly being advised against this practice [@fielding1999, p. 46].

By creating a separate, HTTP-inspired protocol, I could ensure compatibility for exchanging annotations on the overlay network between web clients and Hyperswarm peers. The protocol uses the Protocol Buffers[^protobuf] scheme in order to express custom protocol messages and events that align with a subset of features of HTTP. Protocol Buffers simplify parsing protocol messages and allow the protocol to multiplex several request-response sequences over the same connection in parallel.

I want to emphasize that this approach of using an HTTP-like protocol threatens the bidirectional nature of a duplex stream as opposed to stream-based replication of Hypercore append-onlylogs: While the connection itself is bidirectional, the semantics of the protocol are not. A web client selectively requests data from a node, which will make this node become a server. This entails heterogeneities on P2P systems, which I will discuss in @sec:thick:evaluation. In the following, I will increasingly refer to peers as clients and servers to highlight their distinctive functions.

@Lst:proto-request shows the implementation of the `RequestEvent` message. This message resembles an HTTP request with a request method, a path, and an optional data-carrying body. Other than HTTP, this implementation is a stateful protocol where messages can refer to each other by their unique ID. Additionally to basic HTTP methods such as GET, POST, and PUT, the protocol supports long-running subscriptions which can be opened (`SUB`) as well as closed (`CLOSE`) on-demand. Similar to the method of long-polling,[^long-polling] subscriptions demand the server to push new data over the existing connection as changes occur on the resource specified in the initial `SUB` request.

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

[^hyperswarm-proxy]: <https://github.com/RangerMauve/hyperswarm-proxy>.
[^protobuf]: <https://developers.google.com/protocol-buffers/>.
[^long-polling]: In contrast to conventional _short-polling_, where clients send requests to servers on demand, _long-polling_ requests will hold a client-initiated connection for a longer period of time and expects the server to continuously deliver messages: <https://www.hjp.at/doc/rfc/rfc6202.html#sec_2.1>.

### Resource Discovery {#sec:thick:discovery}

Several insights in regard to leveraging the prospects of LD emerged from using the Recogito annotation environment during the study of chapter \ref{sec:study}. With Linked Data entities available for locally-running client applications, semantic relations can be examined outside of the annotation environment itself. Furthermore, as the UI of an application becomes increasingly lean by decoupling monolithic backends, user-facing functionality can be better integrated with workflows based on the data model itself.

I have designed a workflow for discovering related work of other users based on the URL of the annotated resource. This approach is inherently decentralized. Each peer maintains its own ephemeral list of addresses resolving to related data. By leveraging the decentralized networking of Hyperswarm akin to the HTTP-inspired communication protocol, peers join a swarm of peers based on a topic. In this case of discovering resources, this topic is a hashed representation of the annotated document's canonical identifier such as CTS URNs or HTTP URLs. Once peers discover and connect to each other, they promptly exchange discovery messages. Such a message is defined more precisely in @lst:proto-discovery as a `DiscoveryEvent` message of type `ANNOUNCE`. Once a peer goes offline, it will broadcast an `UNANNOUNCE` type message.

```{#lst:proto-discovery .protobuf caption="Protocol Buffer schema for a discovery message, announcing or unannouncing the availability of a resource on the emitting peer."}
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

For unique identification, each peer within a discovery swarm assigns itself an UUID upon joining. This identifier corresponds to the `id` field of a `DiscoveryMessage` message. However, this ad-hoc approach for solving decentralized discovery is bears challenges on security and privacy, since the origin of the message is currently not verified deterministically.

[^http-parser]: The code of the Node.js runtime’s built-in HTTP parser is written in C++: <https://github.com/nodejs/http-parser>.

### Software Development Kit {#sec:thick:sdk}

By extending HTTP messages with stateful request identifiers and subscription capabilities, web clients _theoretically_ can join the previously described P2P annotation system. By extending the protocol, however, web clients must be supplied with additional software components for supporting the extended protocol and interfacing with the Hyperswarm network via WebSocket connections. Software Development Kits (SDKs) commonly provide such missing components and after equipping Recogito with such an SDK in form of a standalone JavaScript bundle, web clients were finally able to interact with peers on the decentralized network.

Listing: Example code of using the JavaScript client SDK for interacting with decentralized annotations using a high-level API.

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

The code in @lst:sdk-example shows an exemplary usage of the JavaScript SDK for retrieving annotations (`swarm.getAnnotations()`), querying for related work (`swarm.getRelated()`), and subscribing to changes of an annotation (`swarm.getAnnotations()` with a `subscribe` option). For a more complete documentation of the SDK, I refer to the respective code repository [@kassel2020]. The repository contains an example project that uses the SDK as well as a full documentation of the provided SDK functionality.

### Performance Evaluation {#sec:thick:evaluation}

The development of a prototype for this architecture coincided with the timeframe of the study described in chapter \ref{sec:study}. Having established a testing group, I changed a copy of Recogito to use the aforementioned SDK for storing annotations on the decentralized network. Throughout small-scale local testing with machines on the same network, annotations were successfully transmitted in real-time between two clients running the modified Recogito software. Nevertheless, when the testing group joined from the Furman University network, the machine providing the annotations from Leipzig via Hyperswarm ceased to function.

The architecture poses a severe conceptual issue: By bridging the web and a P2P network, a multitude of clients on the web gain access resources eventually stored on a small number of peers on the decentralized network, far exceeding their limited resources. Identifying this issue led to significant changes on the architecture, which I will discuss in the following @sec:hyperwell. In chapter \ref{sec:discussion}, I will further detail said architectural issues.

## Second Implementation: Hyperwell {#sec:hyperwell}

The above attempt of implementing a distributed annotation authoring system hinted at prospects for digital annotation with independent publishing and real-time collaboration. However, while P2P systems distribute network requests and computational demands onto a multitude of peers, bridging P2P network and the web can lead to unpredictable and less distributed requests on resources. This increase on connections can essentially put a strain onto a minority of peers. In order to sustainably extend the P2P network into the web, the _translating component_ can be externalized in terms of infrastructure and governance. Such components---also called gateways---can translate between both networks and can be scaled independently. This gateway infrastructure provides an essential service to the architecture, but should be of a volatile nature nevertheless.

![Architecture of Hyperwell: Peers exchange their notebooks in real-time (1). Gateways, governed by institutions, archive selected notebooks and server them to the web (2). Web applications can access annotations via gateways via the Web Annotation protocol (3). These applications can load canonical resources via services such as CTS or IIIF (4) [@kassel2020a].](figures/architecture.pdf){#fig:hyperwell-architecture short-caption="Architecture of Hyperwell using gateways"}

@Fig:hyperwell-architecture illustrates an architecture with a dedicated intermediate layer [@kassel2020a]. Situated between the P2P network and the web, the gateway receives connections from both sides and acts as a peer in the decentralized network and as a HTTP server on the web. In the following, I will introduce three components of Hyperwell: The gateway server in @sec:hyperwell:gateway, an experimental annotation environment with real-time collaboration support in @sec:hyperwell:support, and progress on a local-first notebook application in @sec:hyperwell:notebook. While the latter is in a preliminary, non-functioning stage as of this writing, I have detailed steps for validating the other components of Hyperwell in appendix \ref{sec:annotation-environment}.

### Gateway Server {#sec:hyperwell:gateway}

The Hyperwell gateway server manifests the separation of that translating component and represents an institutional entity in a P2P system. In a proof-of-concept implementation, I have outlined how such a gateway could be realized while considering both users’ needs as well as institutional requirements. Most fundamentally, the gateway mediates JSON-encoded annotations of the Web Annotation data model between decentralized swarms of Hyperswarm and the web [@web-anno-data-model]. Therefore, it exposes an HTTP API that complies with the REST-based Web Annotation protocol [@web-anno-protocol] and complements this API with further capabilities such as subscribing to real-time updates of annotations via WebSocket connections and bulk operations on notebooks.

Primarily, a gateway on Hyperwell provides the following functionalities for peers on the decentralized network:

* **Long-term archiving**: Gateways support associated peers by continuously replicating their repositories for backup and archiving.
* **High availability**: Other than personal devices, gateways can be deployed in data centers with high-bandwidth network connections, 24/7 uptime, and enterprise-grade hardware. These environments can guarantee high availability of repositories.
* **Professional affiliation**: On the web, domains resolved via DNS can express affiliations with an official entity and thus ensure credibility. For example, domains in the context of academia commonly follow schemes such  `xyz.edu` or `uni-xyz.de`. Consequently, institutional gateways can assure a researcher’s or repository’s affiliation by following these naming schemes with, for example, `gateway.xyz.edu`.

![Architecture of the Hyperwell gateway server. While real-time replication of repositories occurs via the Hyperswarm network (1), changes are also persisted to disk (2). Hypermerge (3) then uses the Automerge CRDT to merge different versions of a document. The gateway caches recently accessed documents (4) and calculates a sequential change set (5) if sequential updates are requested. Annotation IDs are then translated into LOD IRIs (6) and served via HTTP (7) or WebSocket (8) connections.](figures/gateway-architecture.pdf){#fig:gateway-architecture short-caption="Architecture of the Hyperwell gateway server"}

@Fig:gateway-architecture outlines the components of this gateway implementation. Some components could be adopted from the thick-peer approach. The Hyperwell gateway shares the general concept of distributing annotations via a combination of decentralized networking with Hyperswarm and handling distributed documents with Hypermerge. Nevertheless, introducing an institution as a neutral entity to the system caused additional requirements. I will detail these components in the following.

Notebooks are replicated on the Hyperswarm network via native network connections and subsequently passed to Hypermerge for applying change sets. For bridging the P2P network and the web, the gateway serves both HTTP requests and WebSocket connections by using the Hapi[^hapi] framework. The HTTP API implements a superset of the Web Annotation protocol by providing the following URL endpoints:

`https://www.example.com/annotations/<notebook>`.
: REST endpoint for operations on entire notebooks. This endpoint supports retrieval of a notebooks' annotations' (`GET` request of respective pages or inlined container items) and creation new annotations (`POST`).

`https://www.example.com/annotations/<notebook>/<annotation>`.
: REST endpoint for operations on a particular annotation within a notebook. This endpoint supports retrieval (`GET`), editing (`PUT`), and deletion (`DELETE`).

`https://www.example.com/annotations/batch/<notebook>`.
: REST endpoint for batch operations on a notebook. This endpoint supports batch creation (`POST`), batch edits (`PUT`), and batch deletions (`DELETE`).

`https://www.example.com/annotations/subscribe/<notebook>`.
: WebSocket endpoint for subscribing to changes on a notebook. Upon initiating a connection via the standard WebSocket protocol,[^websocket-subprotocols] the gateway will emit messages as soon as the respective notebooks receive changes.

The Web Annotation protocol defines a *container* as the cumulative unit of annotations. Containers are commonly used in the context of LDPs[^ldp-containers] for semantically organizing groups of entities. Translating Linked Data principles to the distributed notebooks, the ID of an LDP container corresponds to the hexadecimal encoding of a document's Hypermerge URL. This hexadecimal encoding is supposed to ensure compliance with the URL scheme. Furthermore, this hexadecimal representation is not intended as a disguise of the underlying URLs and thus reversible, opposed to the results of hashing functions.

Other than the thick-peer approach, gateways in Hyperwell don’t necessarily maintain *all* of an affiliated users’ notebooks locally. It could extend a smaller institutions’ computational resources to replicate all of its affiliated researchers’ repositories in their entirety by default. As Hypermerge documents maintain their whole history of changes, they can quickly grow in size. However, in an ideal scenario for the Hyperwell architecture, institutions would indeed replicate a majority of their affiliates’ data for ensuring collaboration and productivity. As I have described previously in @sec:related:p2p and @sec:thick, mirroring resources for high availability can be viable for decentralized networks. A trade-off between replication and scalability could either be a selective or a transient approach. While Hypermerge currently lacks a system for managing identities of users, the gateway implementation will instead provision repositories for a limited duration similar to a time-based cache. Thereby, documents will be closed and eventually removed from the gateway’s disk or memory after no requests occurred on the HTTP API after a preset amount of time.

![Calculating differences between sets by hashing their values. In a simple and commonly shorter representation, complex objects such as JSON dictionaries can be more efficiently compared to each other.](figures/notebook-diffing.pdf){#fig:notebook-diffing short-caption="Calculating differences between sets by hashing their values"}

The distribution of real-time updates on Hypermerge documents beared a non-trivial challenge: By design, the Hypermerge API allows components to listen for updates on a document via the `RepoFrontend.watch(callback)` method. However, this event handler will receive the entire state of the changed document rather than just the changes[^hypermerge-watch]. In the context of subscriptions on real-time changes in notebooks of Hyperwell, this entails sending each subscriber the entire updated notebook instead of just a change set. This practice would put an immense strain on the network bandwidth that quickly scales with the amount of subscribers, the notebook size, and the frequency of changes. Eventually, each subscriber would be required to calculate the differences by themselves. By calculating this change set on the gateway instead, a significantly smaller amount of data will be transmitted on each change. Illustrated in @fig:notebook-diffing, this change set can be calculated by mapping the value of each item of a notebook---i.e., a Web Annotation JSON object---to a data type that can be compared more efficiently such as a hashed sequence of bytes. Two lists of hashes can then be compared with each other, which will result in a set of added, changed, and deleted items. For hashing, the gateway implementation currently uses the SHA-256 hashing algorithm, which generates digests of 256 bit size.

When considering data ownership and power structures in the Hyperwell architecture, I want to emphasize that notebooks should not depend on a particular gateway node. When creating an annotation by using a gateway’s REST API, it will issue a Universally Unique Identifier (UUID[^uuid]) for the previously undefined ID of this annotation. This ensures that each annotation is uniquely identifiable within a notebook. However, the Web Annotation data model demands that annotations are identified by their host-dependent IRIs. Taking the parent notebook’s Hypermerge-issued URL as the annotation’s IRI will result in incompatibilities when switching between gateways, as browsers are commonly not able to resolve Hyperwell-issued URLs. Hence, gateways translate between both schemes: Hyperwell internally identifies notebooks by their Hypermerge document URLs (e.g., `hypermerge:/abc123`) and gateways then translate these into IRIs by adding their hostname and the annotation ID to the encoded document URL (e.g., `https://gateway.example.com/annotations/def456/11-22-33`). Either way, peers can switch between gateways by changing the URL host while the notebook ID remains the same.

Some features such as archiving rely on an identity system. While the Hypercore append-only log uses public key encryption for identity and security, Hypermerge currently does not expose such functionalities out-of-the-box. With a focus on Linked Data and web technology, I will discuss this matter in chapter \ref{sec:discussion}.

[^hapi]: Hapi is a production-ready web framework: <https://hapi.dev/>. Hapi is written in JavaScript and runs in the Node.js runtime. With a variety of plugins, its functionality can be extended, for example by adding support for the WebSocket protocol.
[^ldp-containers]: With Linked Data, resources can be grouped into containers: <https://www.w3.org/TR/ldp/#ldpc>. These containers can assort entities semantically.
[^websocket-subprotocols]: The WebSocket protocol supports the use of specific subprotocols [@fette2011, p. 12]. Frameworks and services can leverage these subprotocols for imposing their own structured communication paradigms. Yet for the sake of simplicity and compatibility, the gateway subscription endpoint purely relies on the WebSocket protocol as a stream for pushing data to clients in real-time.
[^hypermerge-watch]: Automerge, the underlying CRDT of Hypermerge, provides a more low-level API that poses little assumption on how exactly changes are transmitted. With the `Automerge.getChanges()` method, change sets between two states can be propagated separately.
[^uuid]: <https://www.ietf.org/rfc/rfc4122.txt>.

### Support in Annotation Environments {#sec:hyperwell:support}

To validate the functionality of the Hyperwell gateway and its compliance with the Web Annotation specification, I have continuously fed the gateway annotation server into existing annotation environments. Due to experience from the user testing study presented in @sec:study, I initially chose Recogito for evaluating the Hyperwell gateway.

Listing: Accessing the APIs of a Hyperwell gateway via HTTP and the WebSocket protocol using commonly supported browser APIs in JavaScript such as the `fetch()` method and the `WebSocket` class.

```{#lst:hyperwell-support .js}
const headers = {
  "Accept": "application/ld+json; " +
    'profile="http://www.w3.org/ns/anno.jsonld"'
}
const res = await fetch(
  `https://${host}/annotations/${notebookId}/?page=0&iris=0`,
  { headers }
)
const annotations = (await res.json()).items

const ws = new WebSocket(
  `wss://${host}/annotations/subscribe/${notebookId}/`
);
ws.onmessage = (event) => {
  const diff = JSON.parse(event.data);
}
```

I have been successful in first attempts at realizing such support in Recogito: a base class[^js-prototypes] called `baseApp` provides the foundation for retrieving and mutating annotations. Calls to Recogito’s own backend API can easily be replaced by HTTP requests to the gateway’s REST endpoints for retrieving Web Annotation data, since the gateway abstracts the decentralized network. The compliancy with standard web technologies facilitates interoperability with existing annotation environments as opposed to the thick-peer approach, which required further software to support overlay network protocols. After retrieving annotations from the gateway via HTTP, the _initial_ state of the annotation editor---i.e., at load time---could be propagated with annotations originating from the decentralized network. @Lst:hyperwell-support illustrates how resources can be accessed on a Hyperwell gateway using standard browser APIs.

Supporting WebSocket-based subscriptions from the gateway required adding real-time collaboration support to Recogito by transmitting changes on annotations in real-time and subsequently reflecting these changes in the UI. By utilizing the standard WebSocket protocol without subprotocols, actual connections for exchanging real-time updates can be established. In @lst:hyperwell-support, the `WebSocket` JavaScript class is used for initiating the connection. However, translating updates into mutations on the browser’s DOM challenged this approach. Various components of Recogito such as the annotation editor and the text highlighter are encapsulated and intended to reflect user-issued changes on the annotations instead of changes propagated from the backend.

\citeauthor{hardenberg2020} elaborate on their approach when evaluating methods for translating frequent backend-propagated changes to a UI. With the approach of Functional Reactive Programming (FRP), the visual rendering of a UI component is considered a deterministic mapping of the components’ state to the respective target. Such a target could be DOM nodes. Without any side effects while rendering, the UI will reflect its state exclusively and thus could easily adapt to external changes from parent components or the backend.

Eventually, I ceased work on integrating Hyperwell and Recogito as the aforementioned challenges would have required a significant amount of changes in order to realize real-time collaborative annotation. Dr. Rainer Simon, lead developer of Recogito, extracted Recogito's annotation components into a new library called _RecogitoJS_.[^recogito-js] This library uses the uses React[^react] framework for displaying an interactive annotation editor on top of the underlying sources. 

![Annotation environment for testing the Hyperwell gateway. Users can collaboratively annotate the first chapter of Goethe’s Faust, as changes on the provided notebook are transmitted in real-time.](figures/test-environment.png){#fig:test-environment short-caption="Annotation environment for testing the Hyperwell gateway"}

For testing the real-time collaboration capabilities of Hyperwell, I have utilized RecogitoJS in an experimental but simple annotation environment application [@kassel2020c]. In this environment, pictured in @fig:test-environment, users can collaboratively annotate the first chapter of Goethe’s _Faust_. Prior to annotating the source, users have to enter the URL of the annotation server. If this URL resolves to a Hyperwell gateway, the environment will establish a WebSocket connection and enable real-time collaboration of the source. Appendix \ref{sec:annotation-environment} provides steps for testing the real-time collaborative capabilities of Hyperwell with this annotation environment on a local machine.

[^js-prototypes]: The JavaScript specification gained support for syntactic classes in recent years. While the `baseApp` object in Recogito operates as a class with instance methods and an instance-based state, JavaScript classes essentially are an abstraction of prototype-based objects: <https://tc39.es/ecma262/#sec-objects>.
[^recogito-js]: <https://github.com/pelagios/recogito-text-js>.
[^react]: React is a popular framework for building interactive web applications: <https://www.reactjs.org/>. Maintained by Facebook, React leverages Functional Reactive Programming (FRP) principles and uses a virtual DOM for only patching changed parts of the user interface.

### Notebook Application {#sec:hyperwell:notebook}

The Hyperwell gateway includes development tools for imitating clients that share notebooks on the network. Inspired by the work of @hardenberg2020, I have attempted at building a local-first application called _Notebook_ for managing annotations on personal devices. The scope of this thesis did not allow for finishing a minimum viable prototype, yet in the following I will report the application's technical architecture.

The prototypical Notebook application manifests the local ownership of annotations on a user's personal device, taking from the metaphor of a physical notebook. By maintaining all annotations locally, the application can provide a variety of services:

* **Management**: The application maintains local copies of entire digital notebooks. Users can choose to create new notebooks or delete existing ones. Furthermore, they can control with whom to share a notebook; this could be private collaboration with selective write access or read-only public access. This choice gives users elaborate control over their data and concerns possible improvements in research data management. 
* **Visualization**: Particular properties of the Web Annotation data model---such as the annotation body or fragment selectors---may depend on the annotation environments used. Nevertheless, the application can visualize commonly used annotation types---e.g., text annotation---and meta information about the annotated sources.
* **Replication**: The application runs a daemon (i.e., a system-managed background process) for the replication of notebooks. Thereby, it provides uptime to the users' repositories and can receive changes made by collaborators in real-time. 
* **Search**: Maintaining an entire search index locally provides users with instant results on full-text search of their annotations. By monitoring changes on the users' notebooks, the search index can be incrementally updated as changes occur. Extended search capabilities can analyze semantic LD relations and directly integrate with annotation tools.

Operating systems commonly provide their own frameworks and APIs for developing native applications and user interfaces. On macOS, Apple provides the Swift programming language and the AppKit API,[^appkit] while on Windows, Microsoft recommends using the Windows Presentation Foundation[^wpf] (WPF) environment (among other options). Mobile operating systems, such as Apple's iOS and Google's Android, introduce further frameworks. Building applications that run cross-platform on a multitude of operating systems was challenging to due the variety of hardware and constraints on each operating system. The arrival of web technologies in native software addressed these challenges. React Native,[^react-native] for example, imposes an abstraction layer between native UI frameworks and application logic by using the React[^react] library for rendering the user interface. React addresses common difficulties when building user interfaces at scale by using a virtual DOM and the XML-based JSX templating language. In React Native, changes propagated on React's virtual DOM component tree are evaluated and subsequently applied to the native UI. The Electron[^electron] framework takes a different approach by embedding the Chromium browser's rendering engine and the Node.js JavaScript runtime into the compiled application bundle. Hence, both application logic and user interface can be developed using common web technologies such as HTML, CSS, and JavaScript.

![Wireframe of the Notebook application UI. Users can manage their collection of notebooks on the left sidebar, while the center area displays information on the selected notebook, its collaborators, and its sources.](figures/notebook-wireframe.png){#fig:notebook-wireframe short-caption="Wireframe of the Notebook application UI"}

Hypermerge and its affiliated modules are implemented in JavaScript and thus require a JavaScript runtime,[^dat-automerge-rs] which would benefit the Notebook application from using application frameworks such as the above. Furthermore, for rapidly prototyping the Notebook application, either React Native or Electron are suited for abstracting system-level frameworks and thus offering the application on a variety of operating systems, including mobile devices. 

![Architecture of the Hyperwell notebook application. The decentralized networking capabilities of Hyperswarm (1) and the file system (2) feed into Hypermerge (3) for replicating and persisting distributed documents. Similar to the Hyperwell gateway server, repositories are managed internally (4) and a search index (5) is updated incrementally as changes are propagated. The frontend reflects these (6) by integrating a UI abstraction with reactive state management.](figures/notebook-architecture.pdf){#fig:notebook-architecture short-caption="Architecture of the Hyperwell notebook application"}

The architecture pictured in @fig:notebook-architecture reflects this approach. Akin to the gateway architecture, Hypermerge repositories are maintained by a repository manager. Hypermerge is subsequently fed by the local file system and the decentralized networking stack of Hyperswarm. To provide up-to-date search results, the search index is incrementally updated as Hypermerge propagates changed documents. Finally, the frontend is connected to the underlying data and establishing an abstraction between UI component state and the respective UI framework.

While this Notebook application is an early, non-functional prototype, its architecture could serve as a general framework for local-first software that acts on LD collections. Nevertheless, local-first applications pose novel challenges on usability and UI design, since distributed systems break with the determinism of client-server architectures, which I will further discuss in chapter \ref{sec:discussion}.

[^appkit]: <https://developer.apple.com/documentation/appkit>.
[^wpf]: <https://docs.microsoft.com/en-us/dotnet/framework/wpf/>.
[^react-native]: <http://reactnative.dev/>.
[^dat-automerge-rs]: While the fundamental modules of the Dat technology stack, such as Hypercore and Hyperswarm, as well as Automerge and Hypermerge are implemented in JavaScript, there have been recent efforts in porting some systems to native environments using the Rust programming language: <https://github.com/automerge/automerge-rs>, <https://github.com/datrs>. Rust software can interface with JavaScript using the interoperable WebAssembly binary format.
[^electron]: Electron is a framework for building desktop applications with web technologies: <https://www.electronjs.org/>. Electron applications ship their own copy of the Chromium browser as well as the Node.js runtime. They are packed as native executables, can be built cross-platform, and have their application logic written in JavaScript.
