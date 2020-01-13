# From Me to You: Peer-to-Peer Collaboration Infrastructure with Linked Data Annotations (talk title)


Master’s Thesis due 2020 by Jan Kaßel at Leipzig University. Supervised by Dr. Thomas Koentges and Prof. Gregory Crane at the Department of Computer Science, Leipzig University.

Collection of alternative titles:
* Transcending Sources: Local-First & Collaborative Annotating with Hyperwell
* Hyperwell: A P2P System for Local-First & Collaborative Annotating

Outline draft of this thesis:

## 1. Introduction

### 1.1. Collaboration in the Digital Humanities
Anatomy of annotations (e.g., Marshall, 1998)

### 1.3. Digital Authoring with Hypertext
Hypertext as foundation for the philosophical entity we’re working with. **Hypertext was designed with peer-to-peer in mind?** (Wiil et al., 2002; Wong et al., ). Hypertext annotations (Marshall, 1998)

### 1.2. Peer-to-Peer Systems
Analyze possible issues and problems of P2P systems (Narayanan, 2012; others) and sketch how a Master’s thesis could be realized in respect to certain possible issues and provide an MVP system (Kleppmann, 2019).


## 2. Related Work

### 2.1. Infrastructure in the Digital Humanities
Recogito, IIIF, …

### 2.2. Hypertext Systems
Xanadu

### 2.3. Collaboration Software (Similar to Kleppmann, 2019)
Google Docs. Trello?
		
### 2.4. Peer-to-Peer Technologies
Survey of state-of-the-art P2P software and systems. Distinguish between multiple categories:
* Fundamental P2P systems like IPFS and Dat (hypercore, libp2p, …)
* 
* IPFS, Dat
	* uv.pub
	* IIIF with IPFS, from Samuel Klein & at Vatican
	* hypercore 
	* Hyperswarm
	* Automerge (Kleppmann et al.)
	* Wong et al. (Approximate Matching with Cubit)

## 3. Preliminary Survey
In a preliminary survey, I collaborated with Professor Chiara Palladino from Furman University. We aimed to find out how students use Recogito, a platform for geo-spatial annotation of resources like texts and images.

### 3.1. Specification Requirements

### 3.2. Results
Present an


## 4. Peer-to-Peer Systems

### 4.1. DHTs and swarming (hyperswarm, libp2p)

### 4.2. Append-only logs (hypercore, libp2p)

### 4.3. CRDTs (hypermerge, libp2p)
	
	
## 5. Implementation of Hyperwell

### 5.1. Implementing and Designing a P2P System

### 5.2. Notebook: Implementation of a Local-First Annotation Application

### 5.3. Gateway: Implementation of a Service for Archival and Institutional Exposition

## 6. Case Study: Recogito

## 6.1. A Question of Reactivity: Adding Real-Time Support

## 7. Validation
		
## 8. Future Prospects
Summarize and give a future outlook, e.g., permission- or trustless systems that are realized with Blockchain technology and decentralize further.
	8.1. Further integration with and feature parity for other systems (Dat, IPFS) and existing platforms (Brukeion)
	8.2. Further integrations with Linked Data services
	8.3. P2P HCI research
	8.4. Improved functionality: Privacy (Marshall, 1998 in regard to privacy and anonymity of personal annotations)
		* [Web of privacy](https://blog.datproject.org/2016/12/12/reader-privacy-on-the-p2p-web/)

## 9. Summary

## 10. References
* **Kleppmann**, Martin. 2019. “Local-First Software: You Own Your Data, in Spite of the Cloud.” https://doi.org/10.1145/3359591.3359737.
* **Maymounkov**, Petar, and David Mazières. 2002. “Kademlia: A Peer-to-Peer Information System Based on the XOR Metric.” In Peer-to-Peer Systems, edited by Peter Druschel, Frans Kaashoek, and Antony Rowstron, 2429:53–65. Berlin, Heidelberg: Springer Berlin Heidelberg. https://doi.org/10.1007/3-540-45748-8_5.
* **McCarty**, Willard. 2016. “Collaborative Research in the Digital Humanities.” Collaborative Research in the Digital Humanities. May 23, 2016. https://doi.org/10.4324/9781315572659-5.
* **Narayanan**, Arvind, Vincent Toubiana, Solon Barocas, Helen Nissenbaum, and Dan Boneh. 2012. “A Critical Look at Decentralized Personal Data Architectures.” ArXiv:1202.4503 [Cs], February. http://arxiv.org/abs/1202.4503.
* **Robinson**, Danielle C., Joe A. Hand, Mathias Buus Madsen, and Karissa R. McKelvey. 2018. “The Dat Project, an Open and Decentralized Research Data Tool.” Scientific Data 5 (October): 180221. https://doi.org/10.1038/sdata.2018.221.
* **Shapiro**, Marc, Nuno Preguiça, Carlos Baquero, and Marek Zawirski. 2011. “Conflict-Free Replicated Data Types.” In Stabilization, Safety, and Security of Distributed Systems, edited by Xavier Défago, Franck Petit, and Vincent Villain, 6976:386–400. Berlin, Heidelberg: Springer Berlin Heidelberg. https://doi.org/10.1007/978-3-642-24550-3_29.
* **Wiil**, Uffe K., Niels Olof Bouvin, Deena Larsen, David C. De Roure, and Mark K. Thompson. 2002. “Peer-to-Peer Hypertext.” In Proceedings of the Thirteenth ACM Conference on Hypertext and Hypermedia, 69–71. HYPERTEXT ’02. New York, NY, USA: ACM. https://doi.org/10.1145/513338.513339.
