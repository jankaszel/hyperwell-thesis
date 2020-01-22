# Implementation of Hyperwell

## Designing a P2P Architecture

Distributed P2P systems function fundamentally different from the classic client/server architectures (distributed governance figure?). The fundamental difference is explained by the treatment of data: In architectures following the established client-server distinction, such as HTTP, servers hold a monopoly of the contained data while clients request parts of this data on demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, businesses are effectively controlling aspects such as data availability, access to data, its versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

In P2P systems, this power over data is distributed. The distinction of clients and servers is being blurred as the centralization of governance is diminished: Clients become servers, forming a collection of alike peers, that provide and at the same time request data. Considering “the data” a system operates on as a database (with support for querying and mutation), in these kind of distributed systems, this database is distributed, sometimes even fragmented.

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

One trade-off of theoretically “pure” P2P systems is, considering all data is exchanged between genuine peers, that each peer is running on commodity hardware—regular consumer devices. Especially in these days, where an increasing number of our interactions with the digital world occurs via handheld devices such as smartphones, their lack of processing power compared to the enormous computational resources of a dedicated cluster is troublesome. Yet, with the wake of the more mature, “smarter” P2P systems, these inequalities were to be addressed. Skype, for instance, as research by @guha2015 showed, analyzed peers’ network performance and promoted particular peers to supernodes. These supernodes “maintain an overlay network network among themselves” [@guha2015, p. 2] and effectively outbalance the weaknesses of less powerful peers [@chawathe2003].

(Textile cafés?).

In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Resource Exhaustion: “Thick” Peers

### Resource Discovery

### Client SDK

## Institutional Governance with “Hyperwell”

### Gateway: Implementation of a Service for Archival and Institutional Exposition

### Notebook: Implementation of a Local-First Annotation Application

### Adoption in Existing Environments

## Conclusion

With many platforms involved—researchers, institutions, platforms, non-academic users—it’s difficult to find the perfect solution suiting all their needs. The “Thick Client” approach presented first ensures an annotator’s independence when publishing, but bears the quick exhaustion of their computational resources. The second approach, Hyperwell, performed well in testing due to a clear distinction of personal (individual) and institutional (centralized) computational resources, but takes the way of introducing quasi-centralized gateways.


