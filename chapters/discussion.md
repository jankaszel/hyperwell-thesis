# Discussion {#sec:discussion}

In the two previous chapters, I detailed the main work of this thesis: First, an open-ended user testing study, and the design and implementation of a P2P system for collaborative annotation.

The study validated some initial assumptions about the prospects of real-time synchronization of collaborative applications, which could further facilitate collaboration in shared workspaces. While the custom approach for tracking participants' actions during sessions featured some novel insights into workflows and usability of Recogito, the study design itself has been open-ended to some degree and lacks reproducibility. In the following @sec:discussion:usability, I discuss the emerging issues in more depth.

_TODO:_ There have been severe issues with the first version of the architecture, which led to the development of a second version with fundamental changes. These will be discussed in @sec:discussion:architecture.

_TODO:_ While the second architecture proved itself stable during testing, it lacks features such as many features that local-first applications require---most notably, encryption, privacy, and,security. While this is partly due to the work-in-progress of underlying technology, a polished systems is expected to provide these and hence, the Hyperwell technology is subject of future enhancements.

## Study and Usability Research {#sec:discussion:usability}

_TODO:_ This study design has multiple drawbacks. It provided me with viable information for this particular thesis, but in order to learn more about remote collaboration generally, or, more particular, usability of (peer-to-peer) collaborative systems, a more strict environment has to be established. Furthermore, this would enforce a lab setting and improve reproducibility of the study's results. Outline these drawbacks.

_TODO:_ Technical evaluation: This will give us insights into the age of the watched annotations. If the data allows for this, create a graph for comparison ('youngest annotation considered at point x'). Even further, it would be great to have some kind of indicator of the average age as well as age range a system allowed (during testing!) to work with in a certain period of time. This is in relation to @dourish1992. Give this outlook in @sec:discussion.

The study was designed to explorative/open-ended and learn about the multi-faceted experiences of young students. However, the study was limited in some ways:

* It has not been a strict lab setting. Offline collaboration in the classroom (chatter) has been mixed with online collaboration.
* Students have been provided individual assistance.
* The amount of students has not been easy to handle, as they heavily interacted verbally during the sessions. This not only caused possible noise in the students' experience, but also in our measurements.
* The required tasks were intended to provide room for exploration, and thus, haven’t been expressed too strictly

With the above issues in mind and a focus on better reproducibility, a second study could be conducted. Similar to studies on collaboration by @tang1991 and @dourish1992, the group size should be reduced to about three to five people in order to resemble common collaboration settings.  Furthermore, multiple study groups could be formed to establish between-group frameworks, e.g., with a focus on real-time collaboration.

In order to gain more sophisticated insights into the usability of real-time collaboration in conjunction with P2P systems, further work is required. There already exist research as well as best-practices on data security and usability of data-based systems[^if-library] [^simply-secure-kb], yet there has been just little research on the dedicated topic of P2P usability (_TODO:_ Emphasize useful patterns for encryption, network status, multiple hosts, P2P as social instead of a technical problem, ...). @kleppmann2019 provide a valuable set of prospects of local-first applications---such as locally available data, security & privacy, and offline capabilities, among others---, yet these provide no hands-on recommendations for professionals. Pattern libraries have been popular among designers and developers alike for providing accessible and modular best-practices of user interface and interaction design [@borchers2000]. In an ongoing work, Simply Secure, a US-registered 501(c)3 nonprofit organization, curates a library[^lots] of hands-on patterns and metaphors suited for applications that employ protocols and user interfaces with P2P technology and is due to be released soon.

[^if-library]: <https://catalogue.projectsbyif.com/>
[^simply-secure-kb]: <https://simplysecure.org/knowledge-base/>
[^lots]: <https://decentpatterns.xyz/>

## Architecture {#sec:discussion:architecture}

Identification within distributed networks via the Decentralized Identifiers standard [@did2019].

Some take-aways from both architectures:

* Cloud computing and Content Delivery Networks[^cloudflare-edge] (CDNs) have made data constantly available, commonly driven by economic interests (such as, increasing profit on scale by reducing load times). This shifted a majority of computation on the web over to cloud providers such as AWS or GCP. While that can still benefit a legal entity, a corporation, or an institution, users accessing a website will still expect similar data availability—regarding response times as well as consistent availability—as for cloud-hosted content. Missing this caused a severe bottleneck during the first version of the implementation.
* The requirement for a centralized instance in order to bridge data from decentralized systems into the web cannot be rectified: Today’s web browsers can just connect to IP addresses and not join swarms, like with DHTs.
* Federated systems: provide an alternative; yet, in federated systems such as Mastodon (refer to @sec:related?), instances don’t necessarily mirror each others’ data, but refer to it and build a cohesive network altogether.
	* Mirrors: Kind of a federated systems where mirrors provide an dispensable infrastructure; they merely provide a mirror of the data, but can be taken offline. Also, detail in @sec:related.
* Gateways impose some sort of decentralized governance (as opposed to a fully distributed governance), yet they solve the aforementioned issues with a resulting unequal distribution of load in P2P systems. However, as browser vendors are increasingly adding support for P2P data-sharing protocols such as IPFS[^ipfs-opera] and Dat, providing gateway access to a P2P network could soon become legacy infrastructure.

[^cloudflare-edge]: CDN providers such as Cloudflare, Akamai, and Fastly serve a wide array of clients by ensuring data availability anywhere on earth, which again reduces load times for users. So-called ‘edge servers’ are being deployed to the thousands in order to replicate clients’ assets: <https://www.cloudflare.com/learning/cdn/glossary/edge-server/>
[^ipfs-opera]: Opera for Android recently introduced support for IPFS URLs: <https://blog.ipfs.io/2020-03-30-ipfs-in-opera-for-android/>. While the proposed solution involved directing requests of IPFS URLs to the official IPFS gateway, other browser vendors include actual implementations of the protocols used, such as Beaker does with the Dat protocol: <https://beakerbrowser.com/>.

## Implementation {#sec:discussion:implementation}

The system currently does not provide authentication nor encryption. There is no idea on how to realize end-to-end encryption using gateways, while privacy and security still are at large for local-first applications [@hardenberg2020]. Web Cryptography API could be a solution, but this doesn’t solve the architectural issue that we have with Hyperwell: Will encryption be terminated? If not—maintaining end-to-end encryption—, this will require us to find a solution that adheres both to Linked Data principles as well as ensure end-to-end encryption. Most ideally for security, encryption would not be terminated within the gateway (i.e., not within the architecture depicted in fig:gateway-architecture).

Missing performance measuring. Gateways will have many open UDP connections and can just serve a particular amount of peers to the web.

Gateways could introduce a TTL to remove or unwatch notebooks.

Gateways can serve quasi-arbitrary content, as hypermerge does not enforce a particular schema—as gateways are intended to be run on an institutional infrastructure (and domain), they should be safe. Thus, these gateways should not be open. Hypermerge will introduce such functionality soon.

The gateway does not support (proper) pinning.

Subscription support poses a bottleneck for the gateway. While responding to HTTP requests is easily done---the gateway process has all data already available, as it's local-first, in some way---subscriptions need more information. In particular, with the current architecture and version of Hypermerge, we need to create a _diff_ for each repository update. This is done by calculating by creating SHA1 hashes of each annotation's JSON-encoded string representation. Many updates could easily exhaust a single gateway. However, transmitting a complete notebook for each update to _all_ subscribers could exceed the bandwidth quickly.

