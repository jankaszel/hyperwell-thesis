# Discussion {#sec:discussion}

In the previous chapters, I detailed the main contributions of this thesis: First, the results of an open-ended user testing study that explored the means of collaborative workflows in DH tools. Second, the design and implementation of two P2P systems for collaborative annotation. These contributions originated from the initial research questions posed in @sec:intro:meta on the aspects of collaborative workflows and the technical feasibility of P2P systems in the context of DH infrastructure.

Throughout this thesis I have emphasized possible shortcomings on the execution and the results. The following chapters will iterate over all contributions and discuss them in detail. @Sec:discussion:usability concerns the study on collaborative annotatation workflows and implications for future usability research on distributed systems.




## Study and Usability Research {#sec:discussion:usability}

The results of the study presented in chapter \ref{sec:study} indicate at validations of initial assumptions on the prospects of real-time synchronization of collaborative applications. While the approach for tracking participants' atomic actions during sessions featured novel insights into their workflows and usability patterns on Recogito, the study design itself has been loose and explorative, which can threaten the reproducibility of its results. In the following, I will address these concerns.

By creating a loose setting, participants could freely explore the means of collaborative annotation on Recogito. Nevertheless, given the open-ended environment, this did not allow to articulate specific hypotheses that we could validate. In that regard, students interacted frequently through chatter and physical interactions, which can distort observations focused purely on online collaboration. Our decision to conduct an explorative study posed a trade-off and required us to provide the participants with a loose environment to explore the sources and annotate "naturally", as opposed to executing highly specified tasks. We also interacted with them during the sessions, although just briefly. Instead of specifying a strict lab setting, we detailed a study framework and our observations. After all, the results presented in @sec:study:results are manyfold and fundamentally shaped the design of the subsequent implementations of chapter \ref{sec:implementation}.

Nevertheless, the method of reconstructing participants' workflows by tracking atomic actions promise further insights into small-scale aspects of digital coolaboration. When reconstructing workflows, researchers are able to not only visualize the exact sequence of actions, but also examine the data acted upon. Considering the concept of _shared feedback_ by @dourish1992, this records would allow to validate collaborative workspaces in terms of how users are able to grasp real-time data. Further work on this method could state key insights, such as the average _age_ of data (i.e., when it has been last modified) in order to estimate the information flow within such a workspace.

Further work could concern a revised study framework with an emphasis on reproducibility and more specific hypothesis validation. By further isolating participants, less noise could be imposed on the resulting data. This could be achieved by establishing strictly-separated remote settings or simply limiting individual interactions within lab. Furthermore, tasks could be expressed more precisely while still considering the aspects of "natural" annotation. Limiting the sample size per session could finally contribute to reducing noise and overall overhead.

In order to gain more sophisticated insights into the usability aspects of real-time collaboration in relation with P2P systems, further work is required. While research on best-practices of data security and usability of data-based systems was already conducted,[^if-library][^simply-secure-kb] there was published just few research on the dedicated topic of P2P usability design and patterns. @kleppmann2019 provide a valuable set of practices for realizing local-first applications---such as locally available data, security & privacy, and offline capabilities---yet these provide no practical recommendations for professionals in terms of usability and user interface design. Pattern libraries are popular tools among designers and developers alike for providing accessible and modular best-practices of user interface and interaction design [@borchers2000]. In forthcoming work, a group of researchers from Simply Secure curate a library[^lots] of hands-on patterns and metaphors suited for applications that employ protocols and user interfaces with P2P technology.

[^if-library]: <https://catalogue.projectsbyif.com/>
[^simply-secure-kb]: <https://simplysecure.org/knowledge-base/>
[^lots]: <https://decentpatterns.xyz/>

## Architectural Challenges {#sec:discussion:architecture}

_TODO:_ There have been severe issues with the first version of the architecture, which led to the development of a second version with fundamental changes. These will be discussed in @sec:discussion:architecture.

Conceptual issues with first approach:

* Peers within the network are considered to be peoples' personal devices---commodity hardware: personal computers, tablets, smartphones. This poses two constraints: First, commodity hardware has limited computing power compared to enterprise, professional, or data center hardware. Second, personal devices don't share the amount of network bandwidth that is available for data center hardware---talking Megabit versus Gigabit connections.
* Request/response protocol implements a client-server architecture within a P2P network
* Pure clients (not serving any data) also become part of the P2P network, imposing an imbalance between data availability and peer connections
* This again leads to bottlenecks around bandwidth and network capacity, with many clients requesting data from a small number of serving peers

TODO: Announce/unannounce methods of the first implememtation.

Some take-aways from both architectures:

* Cloud computing and content delivery networks[^cloudflare-edge] have made data constantly available, commonly driven by economic interests (such as, increasing profit on scale by reducing load times). This shifted a majority of computation on the web over to cloud providers such as AWS or GCP. While that can still benefit a legal entity, a corporation, or an institution, users accessing a website will still expect similar data availability—regarding response times as well as consistent availability—as for cloud-hosted content. Missing this caused a severe bottleneck during the first version of the implementation.
* The requirement for a centralized instance in order to bridge data from decentralized systems into the web cannot be rectified: Today’s web browsers can just connect to IP addresses and not join swarms, like with DHTs.
* Federated systems: provide an alternative; yet, in federated systems such as Mastodon (refer to @sec:related?), instances don’t necessarily mirror each others’ data, but refer to it and build a cohesive network altogether.
	* Mirrors: Kind of a federated system where mirrors provide a dispensable infrastructure; they merely provide a mirror of the data, but can be taken offline. Also, detail in @sec:related.
* Gateways impose some sort of decentralized governance (as opposed to a fully distributed governance), yet they solve the aforementioned issues with a resulting unequal distribution of load in P2P systems. However, as browser vendors are increasingly adding support for P2P data-sharing protocols such as IPFS[^ipfs-opera] and Dat, providing gateway access to a P2P network could soon become legacy infrastructure.

[^cloudflare-edge]: Content delivery network providers such as Cloudflare, Akamai, and Fastly serve a wide array of clients by ensuring data availability anywhere on earth, which again reduces load times for users. So-called ‘edge servers’ are being deployed to the thousands in order to replicate clients’ assets: <https://www.cloudflare.com/learning/cdn/glossary/edge-server/>
[^ipfs-opera]: Opera for Android recently introduced support for IPFS URLs: <https://blog.ipfs.io/2020-03-30-ipfs-in-opera-for-android/>. While the proposed solution involved directing requests of IPFS URLs to the official IPFS gateway, other browser vendors include actual implementations of the protocols used, such as Beaker does with the Dat protocol: <https://beakerbrowser.com/>.

## Hyperwell, Hyperbetter {#sec:discussion:implementation}

_TODO:_ While the second architecture proved itself stable during testing, it lacks features such as many features that local-first applications require---most notably, encryption, privacy, and security. While this is partly due to the work-in-progress of underlying technology, a polished system is expected to provide these and hence, the Hyperwell technology is subject to future enhancements.

TODO.

In @sec:bridging, I have outlined two approaches on bridging the web and decentralized networks for real-time replication of annotations. Two of these approaches utilize additional, centralized services—i.e., proxies or gateways—in order to translate network traffic into protocols commonly supported on the web. The former of these two approaches involved  taking connections from web clients via the WebSocket protocol and forwarding an underlying novel HTTP-inspired protocol via duplex streams to peers on the decentralized network. This allows peers to publish annotations independently of any _particular_ bridge but entails the requirement of SDKs in order to support web applications using the above communication capabilities. The latter approach puts an even larger emphasis on a centralized network extension: With gateways, institutions can reliably provide annotations from affiliated users to annotation environments on the web.

With many stakeholders involved—i.e., researchers, institutions, platforms, non-academic users—it becomes increasingly difficult to settle with a solution suiting all their needs. The implementations derived from the above concepts draw a multifaceted picture of possible solutions to P2P annotation. The first presented “thick client” approach attempts to ensure server-independent publishing of digital notebooks. However, the overlay network for bridging the decentralized network to web clients can cause an unexpected amount of network requests on individuals’, putting a strain on their commonly limited computational resources. With a system named Hyperwell, the second implementation performed well during initial testing due to a clear distinction between personal (individual) and public (institutional) computational resources and introduces an institutionally-governed gateway server for bringing distributed personal notebooks to the web.

The implementations described in chapter \ref{sec:implementation} are multifaceted and include a gateway server and a prototype annotation environment, with an annotation management application still in development. The current stage of all software is considered experimental 

The system currently does not provide authentication or encryption. There is no idea on how to realize end-to-end encryption using gateways, while privacy and security still are at large for local-first applications [@hardenberg2020]. Web Cryptography API could be a solution, but this doesn’t solve the architectural issue that we have with Hyperwell: Will encryption be terminated? If not—maintaining end-to-end encryption—, this will require us to find a solution that adheres both to Linked Data principles as well as ensure end-to-end encryption. Most ideally for security, encryption would not be terminated within the gateway (i.e., not within the architecture depicted in fig:gateway-architecture).

Missing performance measuring. Gateways will have many open UDP connections and can just serve a particular amount of peers to the web.

Gateways can serve quasi-arbitrary content, as hypermerge does not enforce a particular schema—as gateways are intended to be run on an institutional infrastructure (and domain), they should be safe. Thus, these gateways should not be open. Hypermerge will introduce such functionality soon.

Subscription support poses a bottleneck for the gateway. While responding to HTTP requests is easily done---the gateway process has all data already available, as it's local-first, in some way---subscriptions need more information. In particular, with the current architecture and version of Hypermerge, we need to create a _diff_ for each repository update. This is done by calculating by creating SHA1 hashes of each annotation's JSON-encoded string representation. Many updates could easily exhaust a single gateway. However, transmitting a complete notebook for each update to _all_ subscribers could exceed the bandwidth quickly.

