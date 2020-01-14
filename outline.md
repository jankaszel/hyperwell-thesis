# From Me to You: Peer-to-Peer Collaboration Infrastructure with Linked Data Annotations (talk title)


Master’s Thesis due 2020 by Jan Kaßel at Leipzig University. Supervised by Dr. Thomas Koentges and Prof. Gregory Crane at the Department of Computer Science, Leipzig University.

Collection of alternative titles:
* Transcending Sources: Local-First & Collaborative Annotating with Hyperwell
* Hyperwell: A P2P System for Local-First & Collaborative Annotating

Outline draft of this thesis:

## 1. Introduction

### 1.1. Collaboration in the Digital Humanities
Anatomy of annotations (e.g., Marshall, 1998): Describe how annotations work digitally. Advance into how they are used in the Digital Humanities, and how collaboration happens in the DH domain (McCarty, 2016). Embrace the distinction of institutional and personal data.

### 1.2. Digital Authoring with Hypertext
Hypertext as theoretical foundation of what we’re working with. Hypertext has been designed with peer-to-peer in mind (Wiil et al., 2002; Wong et al., 2008). Hypertext annotations (Marshall, 1998). Text theory in general, maybe in relation to OHCO (DeRose et al., 1997).

### 1.3. Peer-to-Peer Systems
Short history of P2P systems (e.g., Ripeanu, 2001). Analyze possible issues and problems of P2P systems (Narayanan, 2012; others) and sketch how a Master’s thesis could be realized in respect to certain possible issues and provide an MVP system (Kleppmann, 2019). Outlook to contemporary P2P technology such as CRDTs and append-only logs.


## 2. Related Work

### 2.1. Infrastructure in the Digital Humanities
Enumerate various tools and platforms that build the foundational infrastructure in major parts of DH research. Then focus in platforms that allow for annotation — i.e., Recogito, IIIF, etc.

### 2.2. Hypertext and Hypermedia Systems
Hypertext as foundation of today’s web. Which are Xanadu’s basic principles? How does annotation relate? Introduce it as theoretical layer for distributed annotation and the distinction introduced in 2.1.

### 2.3. Linked Data and Semantic Web
Web Annotation Data Model and Protocol, JSON-LD, and their prospects.

### 2.4. Peer-to-Peer Technologies
Survey of state-of-the-art P2P software and systems. Basically a short outlook to chapter 4. Distinguish between multiple categories:
* Fundamental P2P systems like IPFS and Dat (hypercore, libp2p, …)
* Related to DH research and publishing: uv.pub, IIIF with IPFS (from Samuel Klein et al. at Vatican)
* CRDTs like Automerge (Kleppmann, 2017)
* Hypertext-related P2P software (Wong, 2018)


## 3. Peer-to-Peer Systems
Survey of contemporary peer-to-peer technology for my use.

### 3.1. DHTs and swarming (hyperswarm, libp2p)
Distributed Hash Tables, such as the Kademlia DHT, provide a decentralized way of announcing data within a network (which might be considered a swarm of like-minded peers). Dat's hyperswarm offers a JavaScript implementation for Node.js.

### 3.2. Append-only logs (hypercore, libp2p)
Append-only logs like Dat's hypercore provide a cryptographically secured, distributed single source of truth, similar to Git's log.

### 3.3. CRDTs (hypermerge, libp2p)
Conflict-Free Replicated Datatypes provide mechanisms for conflict-free merging of distributed data streams in real-time. Hypermerge by Martin Kleppmann and Ink & Switch combines Dat's hyper core append-only log with Automerge, a JavaScript CRDT implementation for JSON objects.


## 4. Requirement Analysis: User Testing
In a preliminary survey, I collaborated with Professor Chiara Palladino from Furman University. We aimed to find out how students use Recogito, a platform for geo-spatial annotation of resources like texts and images.

## 4.1. Case Study: Recogito
How does Hyperwell perform when being used and what pitfalls occur when existing systems are trying to adopt it?

### 4.2. Survey Design
Design of both sessions, questionnaires, measurements.

### 4.3. Results: Derived Hypotheses
Present an analysis of the results that have been measured during the survey: both recorded data and questionnaire data. Formulate hypotheses from these that are validated in chapter 7.


## 5. Implementation of Hyperwell

### 5.1. Resource Exhaustion: A “Thick” Peer
Explain the failed design that made each peer provide the required functionality for exposing real-time collaboration to existing applications. Enumerate all components (that is, the peer, the WebSocket/WebRTC gateway, the SDK).

### 5.2. Implementing and Designing a P2P System
Describe the architecture, design decisions, and which technology has been used.

### 5.3. Gateway: Implementation of a Service for Archival and Institutional Exposition
Illustrate the architecture using gateways: Connecting annotations distributed via P2P with centralized infrastructures by using institutional gateways with optional pinning.

### 5.4. Notebook: Implementation of a Local-First Annotation Application
Describe how the Hyperwell notebook application has been developed for macOS and iOS with React Native.

### 5.5. Adoption in Existing Environments
Explain how existing environments such as Recogito can adopt the software.

#### 5.5.1. A Standard Annotation Server 
As the Recogito text annotator showed, tools should be running smoothly when adapting the Hyperwell gateway.

#### 5.5.2. Adding Real-Time Support
A Question of Reactivity: How well can real-time updates be implemented?


## 6. Validation
Compare my work with the knowledge gathered from the preliminary survey: a) Architecture/implementation and b) case study.


## 7. Future Prospects
Summarize and give a future outlook, e.g., permission- or trustless systems that are realized with Blockchain technology and decentralize further.
* Further integration with and feature parity for other systems (Dat, IPFS) and existing platforms (Brukeion)
* Further integrations with Linked Data services like Thomas’ Hermes
* P2P HCI research
* Improved functionality: Privacy (Marshall, 1998 in regard to privacy and anonymity of personal annotations), [“web of privacy”](https://blog.datproject.org/2016/12/12/reader-privacy-on-the-p2p-web/).


## 8. Summary


## References
* **DeRose**, Steven J., David G. Durand, Elli Mylonas, and Allen H. Renear. 1997. “What Is Text, Really?” ACM SIGDOC Asterisk Journal of Computer Documentation 21 (3): 1–24. https://doi.org/10.1145/264842.264843.
* **Kleppmann**, Martin. 2019. “Local-First Software: You Own Your Data, in Spite of the Cloud.” https://doi.org/10.1145/3359591.3359737.
* **Marshall**, Catherine C. 1998. “Toward an Ecology of Hypertext Annotation.” In Proceedings of the Ninth ACM Conference on Hypertext and Hypermedia : Links, Objects, Time and Space—Structure in Hypermedia Systems: Links, Objects, Time and Space—Structure in Hypermedia Systems, 40–49. HYPERTEXT ’98. New York, NY, USA: ACM. https://doi.org/10.1145/276627.276632.
* **Maymounkov**, Petar, and David Mazières. 2002. “Kademlia: A Peer-to-Peer Information System Based on the XOR Metric.” In Peer-to-Peer Systems, edited by Peter Druschel, Frans Kaashoek, and Antony Rowstron, 2429:53–65. Berlin, Heidelberg: Springer Berlin Heidelberg. https://doi.org/10.1007/3-540-45748-8_5.
* **McCarty**, Willard. 2016. “Collaborative Research in the Digital Humanities.” Collaborative Research in the Digital Humanities. May 23, 2016. https://doi.org/10.4324/9781315572659-5.
* **Narayanan**, Arvind, Vincent Toubiana, Solon Barocas, Helen Nissenbaum, and Dan Boneh. 2012. “A Critical Look at Decentralized Personal Data Architectures.” ArXiv:1202.4503 [Cs], February. http://arxiv.org/abs/1202.4503.
* **Robinson**, Danielle C., Joe A. Hand, Mathias Buus Madsen, and Karissa R. McKelvey. 2018. “The Dat Project, an Open and Decentralized Research Data Tool.” Scientific Data 5 (October): 180221. https://doi.org/10.1038/sdata.2018.221.
* **Shapiro**, Marc, Nuno Preguiça, Carlos Baquero, and Marek Zawirski. 2011. “Conflict-Free Replicated Data Types.” In Stabilization, Safety, and Security of Distributed Systems, edited by Xavier Défago, Franck Petit, and Vincent Villain, 6976:386–400. Berlin, Heidelberg: Springer Berlin Heidelberg. https://doi.org/10.1007/978-3-642-24550-3_29.
* **Wiil**, Uffe K., Niels Olof Bouvin, Deena Larsen, David C. De Roure, and Mark K. Thompson. 2002. “Peer-to-Peer Hypertext.” In Proceedings of the Thirteenth ACM Conference on Hypertext and Hypermedia, 69–71. HYPERTEXT ’02. New York, NY, USA: ACM. https://doi.org/10.1145/513338.513339.
