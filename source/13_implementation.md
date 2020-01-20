# Implementation of Hyperwell

## Designing a P2P Architecture

Distributed P2P systems function fundamentally different from the classic client/server architectures (distributed governance figure?). The fundamental difference is explained by the treatment of data: In established client-server architectures, such as HTTP, servers hold a monopoly of the contained data, while clients request parts of this data on demand. This provides several benefits for businesses: They are able to govern the singular source of their services’ data by properly “owning” it. This means, effectively controlling aspects such as data availability, access of data, versioning, and basically any kind of operation on it, ensuring commercial exploitation. (Something on providing guaranteed uptime, data backups, etc.).

In P2P systems, this power over data is distributed. The distinction of clients and servers is blurred as the centralization of governance is diminished—clients become servers, a collection of alike peers, that provide as well as request data. The database

(Something on supporting nodes).

This poses many questions when conceiving P2P architectures: Which parts do work well centralized? Which functionality does effectively when being distributed? How can certain control structures be realized?

In the following, I will describe two attempts at an implementation for a system that bears a critical burden: Realizing a distributed system that bridges its data into the web via HTTP. The question of where to put that bridge shapes the distinction between both attempts: With the first attempt described in section X, the “Thick” Peer, that bridging is provided from within each peer, effectively ensuring the realization of distributed, independent publishing of one’s annotations. As I will lay out in the following, putting that much liability, and hence, network load, onto an independent peer, will quickly exhaust the given resources and hinder the scalability of this approach. With the second, more successful attempt presented in section Y, this liability is moved into institutional governance: While peers exchange their data within the P2P network, the task of bridging that data into the web is done by institutions who run quasi-centralized gateways. As tests showed, this attempt scales well with real-time updates, while individual peers are excused from responding to a growing number of HTTP requests.

## Resource Exhaustion: “Thick” Peers with “me2u”

## Institutional Governance with “Hyperwell”

### Gateway: Implementation of a Service for Archival and Institutional Exposition

### Notebook: Implementation of a Local-First Annotation Application

## Adoption in Existing Environments

## Conclusion