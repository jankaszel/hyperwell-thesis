# Discussion {#sec:discussion}

In the two previous chapters, I detailed the main work of this thesis: An explorative user testing study, and the design and implementation of a P2P system for collaborative annotation.

## Usability Research

_TODO:_ This study design has multiple drawbacks---it provided me with viable information for this particular thesis, but in order to learn more about remote collaboration generally, or, more particular, usability of (peer-to-peer) collaborative systems, a more strict environment has to be established. Furthermore, this would enforce a lab setting and improve reproducability of the study's results. Outline these drawbacks.

The study was designed to explorative and learn about the multi-faceted experiences of young students. However, the study was limited in some ways:

* It has not been a strict lab setting. Offline collaboration in the classroom (chatter) has been mixed with online collaboration.
* Students have been provided individual assistance.
* The required tasks were intended to provide room for exploration, and thus, haven’t been expressed too strictly

In order to gain sophisticated insights into the usability of real-time collaboration as well as P2P applications, further work is required. There already exist research and best-practices on data security and usability of data[^if-library] [^simply-secure-kb], yet there have been few publications on the dedicated topic of P2P applications (_TODO:_ Emphasize useful patterns for encryption, network status, multiple hosts, P2P as social instead of a technical problem, ...). While @kleppmann2019 provide a valuable set of prospects of local-first applications---locally available data, security & privacy, and offline capabilities, among others---,yet these provide no hands-on recommendations for developing applications. Pattern libraries have been popular among developers and designers alike for providing accessible and modular best-practices of user interface and interaction design [@borchers2000]. In an ongoing work, Simply Secure, a US-registered 501(c)3 nonprofit organization, curates a selection[^lots] of hands-on patterns and metaphors suited for applications that employ protocols and user interfaces with P2P technology.

[^if-library]: <https://catalogue.projectsbyif.com/>
[^simply-secure-kb]: <https://simplysecure.org/knowledge-base/>
[^lots]: <https://decentpatterns.xyz/>

## Architecture

Identification within distributed networks via the Decentralized Identifiers standard [@did2019].

Some take-aways from both architectures:

* The requirement for a centralized instance in order to bridge data from decentralized systems into the web cannot be rectified: Today’s web browsers can just connect to IP addresses and not join swarms, like with DHTs.
* Federated systems: provide an alternative; yet, in federated systems such as Mastodon (refer to @sec:related?), instances don’t necessarily mirror each others’ data, but refer to it and build a cohesive network altogether.
	* Mirrors: Kind of a federated systems where mirrors provide an dispensable infrastructure; they merely provide a mirror of the data, but can be taken offline. Also, detail in @sec:related.
* Gateways impose some sort of decentralized governance (as opposed to a fully distributed governance), yet they solve the aforementioned issues with a resulting unequal distribution of load in P2P systems. However, as browser vendors are increasingly adding support for P2P data-sharing protocols such as IPFS[^ipfs-opera] and Dat, providing gateway access to a P2P network could soon become legacy infrastructure.

[^ipfs-opera]: Opera for Android recently introduced support for IPFS URLs: <https://blog.ipfs.io/2020-03-30-ipfs-in-opera-for-android/>. While the proposed solution involved directing requests of IPFS URLs to the official IPFS gateway, other browser vendors include actual implementations of the protocols used, such as Beaker does with the Dat protocol: <https://beakerbrowser.com/>.

## Implementation

The system currently does not provide authentication nor encryption. There is no idea on how to realize end-to-end encryption using gateways. Web Cryptography API.

Missing performance measuring. Gateways will have many open UDP connections and can just serve a particular amount of peers to the web.

Gateways could introduce a TTL to remove or unwatch notebooks.

Gateways can serve quasi-arbitrary content, as hypermerge does not enforce a particular schema—as gateways are intended to be run on an institutional infrastructure (and domain), they should be safe. Thus, these gateways should not be open. Hypermerge will introduce such functionality soon.

The gateway does not support (proper) pinning.

Subscription support poses a bottleneck for the gateway. While responding to HTTP requests is easily done---the gateway process has all data already available, as it's local-first, in some way---subscriptions need more information. In particular, with the current architecture and version of Hypermerge, we need to create a _diff_ for each repository update. This is done by calculating by creating SHA1 hashes of each annotation's JSON-encoded string representation. Many updates could easily exhaust a single gateway. However, transmitting a complete notebook for each update to _all_ subscribers could exceed the bandwidth quickly.

