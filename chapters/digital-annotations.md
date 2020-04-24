# Digital Annotation {#sec:annotation}

_TODO/Commentary:_ This chapter is still pretty rough. It’s partly related work/lit review, part argumentation. What I want to convey here is:

* _What is digital annotation?_ Discuss how Hypertext can be collaborative, what’s in for annotation and how digital annotation could benefit from e.g. links [@nelson1993; @marshall1997].
	* How can LOD benefit this? What are the prospects of LOD annotations as, opposed to e.g. simple text-based annotations
* Transitioning to decentralized systems and ownership: What are gateways in P2P systems, how can they connect to the web and LOD?
* Finally, questioning ownership on the web and proposing the _quintessential_ concepts of **notebooks** and **institutions**.

The way we treat annotations today is wrong, and by considering how tools for annotating PDFs and websites work we can learn about the issues. Coming from the Related Work section, this chapter should give a theoretical introduction into issues of text theory and how annotations fits in there. By leveraging a comparison of OHCO and Hypertext (or, Ted Nelson’s Xanadu), we should derive an architecture for annotations, and be able to show how annotations work in the Web’s notion of hypertext.

Hypothes.is. Browser Storage APIs.

## Hypertext Annotation

Explicate Nelson’s work on Hypertext and Xanadu [@nelson1993].

_TODO:_ Go further from @sec:related:ld-dh and relate the prospects of Linked Data onto annotation and P2P systems. Linked Data has a point, as the Solid project of @mansour2016 shows: it allows for standardizing personal storage by exposing semantic relations of data. WebID[^webid] specification allows for distributed, standardized, and platform-less logins using the web technology stack.

[^web-id]: <https://www.w3.org/2005/Incubator/webid/spec/>

## Gateways and Peer-to-Peer Systems {#sec:gateways}

Distributed P2P systems function fundamentally different from established architectures that separate between clients and servers in a network. The fundamental difference is explained by how the participants treat data: In architectures following the established client-server separation, such as HTTP, servers hold a monopoly of the contained data while clients request parts of this data on-demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, businesses are effectively controlling aspects such as data availability, access to data, its versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

![An architecture leveraging a gateway node for bridging resources from a P2P system into the Web [@matsubara2010]. For providing access to a P2P network, the gateway acts as both a peer within the P2P network and as a HTTP server. Gateway logic translates between both systems.](figures/matsubara-p2p-gateway.png){#fig:p2p-gateway short-caption="Architecture for bridging resources from a P2P system into the Web"}

In P2P systems, this power over data is distributed. The distinction of clients and servers is being blurred as the centralization of governance is diminished: Clients become servers, forming a collection of alike peers, that provide and at the same time request data. Considering “the data” a system operates on as a database (with support for querying and mutation), in these kind of distributed systems, this database is distributed, sometimes even fragmented.

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

One trade-off of theoretically “pure” P2P systems is, considering all data is exchanged between genuine peers, that each peer is running on commodity hardware—regular consumer devices. Especially in these days, where an increasing number of our interactions with the digital world occurs via handheld devices such as smartphones, their lack of processing power compared to the enormous computational resources of a dedicated cluster is troublesome. Yet, with the wake of the more mature, “smarter” P2P systems, these inequalities were to be addressed. Skype, for instance, as research by @guha2015 showed, analyzed peers’ network performance and promoted particular peers to supernodes. These supernodes “maintain an overlay network network among themselves” [@guha2015, p. 2] and effectively outbalance the weaknesses of less powerful peers [@chawathe2003].

(Textile cafés?). Scuttlebut pubs [@tarr2019].

In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Distributed Systems and Data Ownership

> Although they let you access your data anywhere, all data access must go via the server, and you can only do the things that the server will let you do. In a sense, you don’t have full ownership of that data --- the cloud provider does. In the words of a bumper sticker: “There is no cloud, it’s just someone else’s computer.” [@kleppmann2019]

_TODO:_ Take on how hypertext systems have been considered earlier (less monopolistic?) and how the distribution of data plays along with data ownership. Even further, establish the notion of a separation between institutional and personal data (along with the ownership question). Solid by @mansour2016 will surely help to support this hypothesis (technically). Solid, however, builds upon Web ID and RFD, among other standards issued by the W3C. Within the Web, IDs still are tied to servers, which again most people aren't able to provide for themselves.

Annotations are of a personal, and even a social nature---commonly, annotations are personal notes onto something, and annotations are rarely public. Annotations are related to a profile, and just rarely made with the authority of an institution or group. Annotations enable for sophisticated discussion [@marshall1997].

_TODO:_ Cite @srnicek2017 with issues of 'digital walled gardens' and, more generally, platforms.

![Separation of annotations as personal data and resources as institutional data.](figures/ownership-separation.pdf){#fig:separation short-caption="Separation of personal and institutional data"}

_TODO:_ Make a stretch towards the distinction of _personal_ and _institutional_ data. Thus, impose the notions of _notebooks_ (personal collections of annotations) and _institutional services_ (such as archiving, mirroring, and gateways) or _collections_. Libraries are akin to this notion of institutions; they provide a (majorly) static collection of resources that are properly indexed and accessible via canonical identifiers. Examples for such institutions are the Perseus Digital Library[^perseus-dl] and the British Library[^british-library].

[^perseus-dl]: The Perseus Digital Library provides a large amount of classic texts online [@smith2000]. The library’s Scaife Viewer allows for browsing its growing collection of texts available via CTS: <https://scaife.perseus.org/>.
[^british-library]: The British Library uses the IIIF standard for offering some of their digitized items: <https://www.bl.uk/subjects>.

