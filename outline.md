# From Me to You: Peer-to-Peer Collaboration Infrastructure with Linked Data Annotations

Master’s Thesis * Jan Kaßel * Leipzig University

## Table of Contents
1. Introduction
	1.1. Collaboration in the Digital Humanities
				* Anatomy of annotations (e.g., Marshall, 1998)
	1.2. Peer-to-Peer Systems
				* Analyze possible issues and problems of P2P systems (Stanford paper?) and sketch how a Master’s thesis could be realized in respect to certain possible issues, while realizing an MVP.
				* Kleppmann, 2019
	1.3. Digital Authoring with Hypertext
				* Hypertext as foundation for the philosophical entity we’re working with. **Hypertext was designed with peer-to-peer in mind?** (Wiil et al., 2002; Wong et al., )
				* Hypertext annotations (Marshall, 1998)
2. Related Work
	2.1. Infrastructure in the Digital Humanities
		* Recogito
		* IIIF
	2.2. Hypertext Systems
		* Xanadu
	2.3. Collaboration Software (Similar to Kleppmann, 2019)
		* Google Docs
		* Trello?
	2.4. Peer-to-Peer Technologies
		* IPFS, Dat
			* uv.pub
			* IIIF with IPFS, from Samuel Klein & at Vatican
			* hypercore 
			* Hyperswarm
		* Automerge (Kleppmann et al.)
		* Wong et al. (Approximate Matching with Cubit)
3. Preliminary questionnaire
	3.1. Analyze specification requirements and analyze P2P technology in relation to business needs, environments, and practicability for a successful adoption among universities participating in that project.
	3.2. Results
4. Peer-to-Peer Systems
	4.1. DHTs and swarming (hyperswarm, libp2p)
	4.2. Append-only logs (hypercore, libp2p)
	4.3. CRDTs (hypermerge, libp2p)
5. Implementation
	5.1. Implement and design a P2P network stack and CRDT
	5.2. Implement a user interface (UI) for interacting with that system
	5.3. Implement a pinning service for institutional control and backup
6. Case Studies
	6.1. Recogito
	6.2. Universal Viewer, Scaife Viewer?
	6.3. (_Brukeion_)
7. Validate both the network and the user interface. Even more: Conduct research usability of this system. **MAKE SURE THAT BOTH THE NETWORK AND THE UI ARE ACTUALLY TO BE VALIDATED.**
		* ... or, rather the actual functionality?
8. Summarize and give a future outlook, e.g., permission- or trustless systems that are realized with Blockchain technology and decentralize further.
	8.1. Integration with other systems (Dat, IPFS) and existing platforms (Brukeion)
	8.2. Further integrations with Linked Data services
	8.3. P2P HCI research
	8.4. Improved functionality: Privacy (Marshall, 1998 in regard to privacy and anonymity of personal annotations)
		* [Web of privacy](https://blog.datproject.org/2016/12/12/reader-privacy-on-the-p2p-web/)
9. Summary
10. References