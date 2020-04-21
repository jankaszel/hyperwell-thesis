# Implementation {#sec:implementation}

Each aspect of a P2P system bears implications for usability, data availability, and user emancipation: As described in the previous chapters, P2P networks can effectively use certain network structures to enforce power structures and hierarchies among peers. 

## Gateways and Peer-to-Peer Systems

> This will most likely be an argumentation why we need P2P gateways when working with P2P data in academia: Many platforms and tools are built with web technologies and hence are subject to the quasi-centralized architecture of the HTTP web.

Distributed P2P systems function fundamentally different from the classic client/server architectures (distributed governance figure?). The fundamental difference is explained by the treatment of data: In architectures following the established client-server distinction, such as HTTP, servers hold a monopoly of the contained data while clients request parts of this data on demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, businesses are effectively controlling aspects such as data availability, access to data, its versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

![An architecture leveraging a gateway node for bridging resources from a P2P system into the Web [@matsubara2010]. For providing access to a P2P network, the gateway acts as both a peer within the P2P network and as a HTTP server. Gateway logic translates between both systems.](figures/matsubara-p2p-gateway.png){#fig:p2p-gateway short-caption="Architecture for bridging resources from a P2P system into the Web"}

In P2P systems, this power over data is distributed. The distinction of clients and servers is being blurred as the centralization of governance is diminished: Clients become servers, forming a collection of alike peers, that provide and at the same time request data. Considering “the data” a system operates on as a database (with support for querying and mutation), in these kind of distributed systems, this database is distributed, sometimes even fragmented.

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

One trade-off of theoretically “pure” P2P systems is, considering all data is exchanged between genuine peers, that each peer is running on commodity hardware—regular consumer devices. Especially in these days, where an increasing number of our interactions with the digital world occurs via handheld devices such as smartphones, their lack of processing power compared to the enormous computational resources of a dedicated cluster is troublesome. Yet, with the wake of the more mature, “smarter” P2P systems, these inequalities were to be addressed. Skype, for instance, as research by @guha2015 showed, analyzed peers’ network performance and promoted particular peers to supernodes. These supernodes “maintain an overlay network network among themselves” [@guha2015, p. 2] and effectively outbalance the weaknesses of less powerful peers [@chawathe2003].

(Textile cafés?). Scuttlebut pubs [@tarr2019].

In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Bridging Swarms and the Web

Web applications leverage technologies planned, audited, and released by the World Wide Web Consortium (W3C). These technologies are known as _web technologies_ and are commonly supported by web browsers such as Mozilla Firefox, Google Chrome, and macOS Safari. Web applications are a popular way of providing tools and services, as opposed to native applications executed directly by the user’s operating system, due to three factors:

* User Experience (UX): Websites are accessible by entering Uniform Resource Locators (URLs). Users don’t have to manually download an application bundle and run it on their machine, as browsers download the application code and assets in-promptu.
* Developer Experience (DX): Developers can choose from a variety of standardized, open technologies for realizing their applications: Building web documents with HTML, realizing complex business logics with JavaScript, 
* Business Benefits: ...

_TODO:_ Make it explicit that the work done in this chapter (and for the thesis) has been to build an architecture that serves in two ways: First, it has to be built around hypermerge—the library itself does not provide any de-facto requirement of how data should be distributed. It facilitates data distribution. Second, the architecture should resemble the notion that I have imposed in @sec:annotation.

_TODO:_ Three approaches to bridging decentralized networks and the web by using web technologies supported by contemporary web browsers (@fig:bridging-approaches):

![Approaches for bridging between decentralized file-sharing networks and the web.](figures/bridging-approaches.pdf){#fig:bridging-approaches short-caption="Approaches for bridging between decentralized file-sharing networks and the web"}

1. Connecting web clients via WebRTC and using WebRTC duplex connections to replicate data. Did not work, as WebRTC failed during testing and Hypermerge has dependencies that don’t work in web browsers (footnote on what that exactly means, comparing it to Node.js and native C++ libraries).
2. Connecting web clients via WebSocket connections which are being terminated/translated by a set of proxy servers
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

With WebRTC[^webrtc], however, the W3C offers a solution for realizing quasi-P2P applications built upon Web technologies. (encryption, discovery via ICE/STUN/TURN). The WebSocket[^websocket] protocol has proven itself much more stable and reliable and in the end led to a gateway-supported solution that bridges WebSocket connections into the Hyperswarm network.

Integrating with the stack of Web technologies at hand, both the peer application running locally as well as the browser integration have been written in the JavaScript programming language. Modern versions of JavaScript---most notably, ECMAScript 7[^ecma7]---are widely supported by modern Web browsers. With the Node.js[^nodejs] JavaScript runtime, applications written in JavaScript can be executed locally via the V8 JavaScript runtime[^v8] developed by Google for the Chrome browser.

_TODO:_ Use Hyperswarm as a decentralized networking solution for swarming, and a WebRTC bridge to connect to browser clients.

_TODO:_ Use Hypermerge as a CRDT-equipped data structure backed by the Hypercore append-only log. Integrates with Hyperswarm to exchange changes with peers operating on copies of the same data structure and merge changes automatically and conflict-free.

* Introduce the terms of repositories (collections of notebooks) and documents (notebooks), and distinguish them from a single annotation.

Implemented a HTTP-like protocol based on Protocol Buffers[^protocol-buffers].

_TODO:_ Extending the Recogito UI has been possible, but required a lot of effort because of complicated tooling around the Scala-based backend. Hence, all extensions, such as the resource discovery mechanism detailed in @sec:thick:discovery, were designed as standalone modules and bundled appropriately.

In the following, I will outline two characteristic contributions of this approach: First, a novel, HTTP-like protocol was intended to enable client-server connections over multiplexed duplex socket connections. This protocol leverages the Protocol Buffers standard and is detailed in @sec:thick:protocols. Second, as peers within the network transfer data without higher-level supernodes, a flat hierarchy is established. An approach for announcing work on particular resources with the intention of collaboration is described in @sec:thick:discovery. By establishing a new protocol for retrieving annotations from a distributed network, browsers need to be provided with libraries to support these protocols---one such library, a Software Development Kit (SDK), for integrating client applications, is detailed in @sec:thick:sdk.

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

By utilizing a server that bridges WebSocket connections into the Hyperswarm network, `hyperswarm-proxy`[^hyperswarm-proxy], Web clients are able to join swarms in the Hyperswarm network and connect to other peers of a swarm.

_TODO:_ Use Protocol Buffers[^protobuf] in order to develop a custom protocol that resembles HTTP, but facilitates parsing. It supported multiplexing of multiple request-response actions over the same connection within a swarm or, rather, a swarm connection to another peer. Furthermore, it supports subscriptions on particular resources, similar to HTTP long-polling.

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

### Resource Discovery {#sec:thick:discovery}

While evaluating the conditions on why Recogito has been chosen as a case study and reference environment for developing the technology presented in this chapter, several prospects around an open and distributed annotation storage have emerged. With Linked Data entities being available for client applications running locally, semantic relations could easily be examined outside of the annotation environment itself. Furthermore, as the UI of an application becomes increasingly _lean_ by decoupling from a heavy and centralized data-processing backend, user-facing functionality can be better integrated with workflows based on the data model itself.

With that in mind, I have designed a functionality for discovering related work of other users based on the URL of the annotated resource. This approach is inherently decentralized: Each peer maintains its own ephemeral list of related work. By leveraging the decentralized networking of Hyperswarm similarly as in @sec:thick:protocols, peers join a swarm of peers based on a topic. In this case of discovering resources, this topic is a hashed representation of the annotated document's canonical identifier, such a CTS URN or a general URL. Once peers discover and connect to each other, they quickly exchange discovery messages. Such a message is defined more precisely in @lst:proto-discovery as a `DiscoveryEvent` message of type `ANNOUNCE`. Once a peer goes offline, it will broadcast an `UNANNOUNCE` type message.

Explicitely broadcasting these messages is required, as opposed to implcitely announcing the available of a resource by joining the respective swarm based on the resource URL: By introducing 'consuming' peers 

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

### Client Software Development Kit {#sec:thick:sdk}

The above mentioned protocols resulted in a quite elaborate assembly: By equipping the HTTP-like functionality of request and response messages with per-request identifiers and subscription capabilities, simulating a distributed Web Annotation system via the distributed Hyperswarm network became achievable. One major drawback emerged immediately, though: By not using HTTP as a transfer protocol, communication capabilities for interfacing with the Hyperswarm network via the WebSocket protocol had to be provided with additional software. Consequently, a client Software Development Kit (SDK) should provide these missing components for abstracting the communication.

_TODO:_ Have a figure with a brief overview of how the SDK interacted with both the gateway and the client software.

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

The Hyperwell gateway server represents the separation of that translating component as well as the manifestation of an institutional entity in a P2P system. In a proof-of-concept implementation, I have outlined how such a gateway could be realized and meet both users’ as well as institution’s requirements. Most fundamentally, the gateway translates JSON-encoded annotations of the Web Annotation Data Model between decentralized swarms of Hyperswarm and the web. Thus, it exposes an HTTP API that complies with the HTTP- and REST-based Web Annotation Protocol and extends this with further functionalities subscribing to real-time updates of annotations via WebSocket connections as well as bulk operations.

Primarily, the gateway provides the following functionalities for peers of the decentralized network:

* **Long-term archival**: Gateways support peers
* **High availability**: Other than personal devices, gateways can be deployed in data centers with high-bandwidth network connections, 24/7 uptime, and enterprise-grade resources.
* **Professional attribution**: In the web, domains issued via DNS can impose _TODO (attribution?)_. Especially in academia, professional attribution via domains such as `xyz.edu` can _TODO (provide a name?)_.

![Architecture of the Hyperwell gateway server. While real-time replication of repositories happens via the Hyperswarm network (1), changes are also persisted to disk (2). Hypermerge (3) then applies uses the Automerge CRDT to merge different versions of a repository. The gateway caches recently accessed repositories (4) and performs a diff (5) if sequential updates are requested. Annotation IDs are then translated into LOD URIs (6) and served via HTTP (7) or WebSocket (8) connections.](figures/gateway-architecture.pdf){#fig:gateway-architecture short-caption="Architecture of the Hyperwell gateway server"}

@Fig:gateway-architecture elaborates components of this implementation. While some components could be adapted from the thick peer approach, such as _TODO ?_, introducing an institution as a neutral entity to the architecture caused some other components to appear. I will detail these components in the following while referring to each component of @fig:gateway-architecture by its number.

Similar to the thick peer prototype, documents are exchanged via the Hyperswarm network over TCP or UTP connections … .

Bridging into the web, the gateway serves HTTP requests as well as WebSocket connections. It uses the hapi[^hapi] web framework for handling both connection types. The HTTP interface implements the Web Annotation Protocol [@web-anno-protocol] by employing a particular URL scheme: `https://www.example.com/annotations/<container>/<annotation>`. The container, as defined by the Web Annotation Protocol specification[^ldp-containers], corresponds with a hexadecimal encoding of the document URL issued by hypermerge. The hexadecimal encoding should ensure an easy approach safety of URLs with an arbitrary content while being reversible—as opposed to hashing functions. _TODO (provide an example HTTP request)_

Other than with the thick peer approach, gateways don’t have all corresponding users’ notebooks available locally. This might be possible for small institutions, but depending on the amount of users, hypermerge repositories can grow in size quickly as they maintain their complete history. However, removing repositories from a gateway promptly after replicating it from the swarm—for example, to add an annotation—To ensure scalability of gateways, they 

By its design, the hypermerge library allows to listen for updates on a particular document via `repo.watch(url, (doc) => {…})`. However, this event handler will receive the complete document state instead of just the changes. In the context of subscriptions on real-time changes in notebooks of Hyperwell, this means sending each subscriber the complete, updated notebook instead of a list of changes—additions, edits, and deletions. 

Some feature, such as archiving, rely on an identity system. While the Hypercore append-only log uses public key encryption for identity and security, Hypermerge currently does not expose such functionality out-of-the-box. With a focus on Linked Data and web technology, I will discuss this matter—among other shortcomings—in @sec:discussion.

[^hapi]: Hapi is a production-ready web framework: <https://hapi.dev/>. Hapi is written in JavaScript and runs in the Node.js runtime. With a variety of plugins, its functionality can be extended, for example by adding support for the WebSocket protocol.
[^ldp-containers]: With Linked Data, resources can be grouped into containers: <https://www.w3.org/TR/ldp/#ldpc>. These containers can assort entities semantically: “Each resource created in the application or site is created within an instance of one of these container-like entities, and users can list the existing artifacts within one.”


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

