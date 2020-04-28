# Peer-to-Peer Annotation {#sec:annotation}

> _Although they let you access your data anywhere, all data access must go via the server, and you can only do the things that the server will let you do. In a sense, you don’t have full ownership of that data --- the cloud provider does. In the words of a bumper sticker: “There is no cloud, it’s just someone else’s computer.”_ [@kleppmann2019, p. 155]

Despite its decentralized nature, resources on the web tend to be centralized on a small number of servers. This development intensified even more amidst the rise of Big Data and the continuous commiditization of personal data, threatening data ownership and autonomy on the web. Arguably, academia and particularly the Digital Humanities treat the web differently by embracing LD principles and establishing sustainable and self-organized infrastructures. Furthermore, with the Web Annotation specification issued by the W3C, academic annotation services can be provided interoperably by research environments and digital libraries. Considering annotation in the overall status quo, however, poses the following questions: Does annotation belong to the institutional domain? If not, where else other than the web to store and distribute them?

In the following, I will argue for establishing an architectural separation between personal annotation and the respective sources based on the assumption that annotations are social data. @Sec:annotation:web revisits characteristics of web; questioning implications of cloud infrastructure in today's internet services, I discuss effects of decentralization in federated networks and P2P systems on digital annotation. P2P systems commonly rely on high-availability infrastructures known as _supernodes_ or _mirrors_ for replication and indexing. @Sec:annotation:infrastructure examines these infrastructures and draws inspiration from public services such as libraries.

In @sec:annotation:ownership, I then define the distinctive terms of _notebook_ and _public institution_ for establishing a separation between personal data and public services in P2P networks and the web. Subsequently, in the following chapter~\ref{sec:implementation}, I discuss proof-of-concept designs and implementations on how such a separation can be realized with P2P technology.

## What's (Not) Wrong with Servers? {#sec:annotation:web}

The web establishes a decentralized network, as I have reported previously in this thesis, and hypertext systems commonly leverage a client-server model in order to distribute hypertext documents among a multitude of servers [@berners-lee1989a; @nelson1993]. This architectural decision brings its benefits and its flaws; smaller networks can benefit from this model by being easily scalable and predictable, yet large-scale networks---or even world-wide ones---can quickly outgrow their intention of being open, accessible, and collaborative:

> _While the Web has the potential to enable full open access to knowledge, the code that powers the Web is not built for that. Instead, the Web uses a centralized data model optimized for use by commercial organizations. In other words, today’s Web values the access and voices of people who are valuable to corporate interests._ [@robinson2018, p. 2]

<!-- web's issues with personal data -->
Besides questionable practices on data privacy . Businesses became increasingly interested in harvesting personal data, which provides them with training data for targeted advertising. Data becoming economic assets for businesses spoon-fed the development of Big Data and the assembly of data silos [@srnicek2017]. This inequality led to a fundamental shift of the distribution of resources on the web:

> _While the Web was originally conceived as a decentralised platform where every organisation and individual can participate, it became increasingly centralised with less than 1% of the servers serving more than 99% of the content._ [@capadisli2017, p. 469]

<!-- personal data / static data -->
I'd like to highlight while the web arguably lacks support for managing personal data. Yet, as work of @kleppmann2019 and @hardenberg2020 showed, local-first data can successfully be synchronized among peer-to-peer networks and benefit from sharing.

<!-- prospects of LDP and federated networks -->
Arguably, the LDP and protocols such as ActivityPub attempt to mitigate this unequal distribution of resources: Federated networks and _ server-to-server communication between entities can improve 

LDP and ActivityPub offer alternatives, yet still building on top of web technology fundamentals. On the web, there is little choice on where to store data in order to make them processable and shareable [@bizer2009; @mansour2016; @capadisli2017].

<!-- annotations are discussion and thus personal data -->
When considering annotation in this context . 

* Annotations are of a personal, and even a social nature---commonly, annotations are personal notes onto something, and annotations are rarely public. Annotations are related to a profile, and just rarely made with the authority of an institution or group. Annotations enable sophisticated discussion [@marshall1997].

Annotation is personal data. Personal data should be carefully considered when discussing ownership questions [@marshall1997; @marshall1998]. 

<!-- modern peer-to-peer protocols increasingly grow in adoption in web browsers -->
The notion of _local-first software_ emerged from a critique on the status quo on the web [@kleppmann2019].

Let's face it: The web has a questionable ownership model for personal data. Local-first applications attempt to fix that, but they require novel protocols and networks. Browsers tend to adopt these protocols: Brave, Opera, Beaker.
* @voss2019, IPFS, content-addressing

<!-- summarize: p2p for personal data. but even p2p systems have some kind of public infrastructure -->
Remind that the web is still okay if you put authority into an entity---for instance, public services such as libraries or academic institutions. 

Fully distributed P2P networks can help solving the ownership question 

## Public Infrastructure in Peer-to-Peer Systems {#sec:annotation:infrastructure}

_Supernodes, relays, pubs, pods, proxies, gateways, pinning, seeding, mirroring:_ Many popular decentralized networks leverage infrastructures that provide resources for sustaining the networks’ operation. For establishing a stable and reliable overlay network, nodes can be promoted to _supernodes_ based their available resources, such as computational power, uptime, and bandwidth [@guha2005]. This can be beneficial for real-time communication systems with high demands on bandwidth. Systems that provide file-sharing capabilities, replicating archives and indexing of data becomes highly relevant as; since personal devices commonly join networks on-demand and establish temporary connections, their data vanishes as they go offline. Many of the systems discussed in @sec:related:p2p leverage 

In the following, I will use some terms interchangeably. While peers concern the abstract notion of homogeneous participants in a system, nodes are connoted rather technical. Supernodes commonly _relay_ or _tunnel_ data to a multitude of nodes. In file-sharing systems, data can be _replicated_ or _mirrored_, as multiple nodes provide a copy of a resource that is indexed under the same address, e.g., in a DHT. I call these kinds of services _public_: They often are of a _volatile_ or _ephemeral_ nature, but help to maintain a complex, distributed system.

Distributed P2P systems function fundamentally different from established architectures that separate between clients and servers in a network. The fundamental difference is explained by how the participants treat data: In architectures following the established client-server separation, such as HTTP, servers hold a monopoly of the contained data while clients request parts of this data on-demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, businesses are effectively controlling aspects such as data availability, access to data, its versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

In P2P systems, this power over data is distributed. The distinction of clients and servers is being blurred as the centralization of governance is diminished: Clients become servers, forming a collection of alike peers, that provide and at the same time request data. Considering “the data” a system operates on as a database (with support for querying and mutation), in these kind of distributed systems, this database is distributed, sometimes even fragmented.

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

One trade-off of theoretically “pure” P2P systems is, considering all data is exchanged between genuine peers, that each peer is running on commodity hardware—regular consumer devices. Especially in these days, where an increasing number of our interactions with the digital world occurs via handheld devices such as smartphones, their lack of processing power compared to the enormous computational resources of a dedicated cluster is troublesome. Yet, with the wake of the more mature, “smarter” P2P systems, these inequalities were to be addressed. Skype, for instance, as research by @guha2005 showed, analyzed peers’ network performance and promoted particular peers to supernodes. These supernodes “maintain an overlay network network among themselves” [@guha2005] and effectively outbalance the weaknesses of less powerful peers [@chawathe2003].

## Distributing Ownership {#sec:annotation:ownership}

Finally, come to the conclusion that personal data can _in fact_ be already stored on and exchanged with P2P networks. Make it concern digital libraries as manifestation of well-indexed, static sources.

Analogies with libraries and personal notes [@wilensky2000].

![Separation of annotations as personal data and resources as institutional data.](figures/ownership-separation.pdf){#fig:separation short-caption="Separation of personal and institutional data"}

_TODO:_ Make a stretch towards the distinction of _personal_ and _institutional_ data. Thus, impose the notions of _notebooks_ (personal collections of annotations) and _institutional services_ (such as archiving, mirroring, and gateways) or _collections_. Libraries are akin to this notion of institutions; they provide a (majorly) static collection of resources that are properly indexed and accessible via canonical identifiers. Examples for such institutions are the Perseus Digital Library[^perseus-dl] and the British Library[^british-library].

[^perseus-dl]: The Perseus Digital Library provides a large amount of classic texts online [@smith2000]. The library’s Scaife Viewer allows for browsing its growing collection of texts available via CTS: <https://scaife.perseus.org/>.
[^british-library]: The British Library uses the IIIF standard for offering some of their digitized items: <https://www.bl.uk/subjects>.
