# Discussion {#sec:discussion}

In the two previous chapters, I detailed the main work of this thesis: An explorative user testing study, and the design and implementation of a P2P system for collaborative annotation.

## Usability Research

The study was designed to explorative and learn about the multi-faceted experiences of young students. However, the study was limited in some ways:

* It has not been a strict lab setting. Offline collaboration in the classroom (chatter) has been mixed with online collaboration.
* Students have been provided individual assistance.
* The required tasks were intended to provide room for exploration, and thus, haven’t been expressed too strictly

For a proper usability study, further work is required.

_TODO:_ This study design has multiple drawbacks---it provided me with viable information for this particular thesis, but in order to learn more about remote collaboration generally, or, more particular, usability of (peer-to-peer) collaborative systems, a more strict environment has to be established. Furthermore, this would enforce a lab setting and improve reproducability of the study's results. Outline these drawbacks.

## Architecture

Identification within distributed networks via the Decentralized Identifiers standard [@did2019].

Some take-aways from both architectures:

* The requirement for a centralized instance in order to bridge data from decentralized systems into the web cannot be rectified: Today’s web browsers can just connect to IP addresses and not join swarms, like with DHTs.
* Federated systems: provide an alternative; yet, in federated systems such as Mastodon (refer to @sec:related?), instances don’t necessarily mirror each others’ data, but refer to it and build a cohesive network altogether.
	* Mirrors: Kind of a federated systems where mirrors provide an dispensable infrastructure; they merely provide a mirror of the data, but can be taken offline. Also, detail in @sec:related.

## Implementation

The system currently does not provide authentication nor encryption. There is no idea on how to realize end-to-end encryption using gateways. Web Cryptography API.

Missing performance measuring. Gateways will have many open UDP connections and can just serve a particular amount of peers to the web.

Gateways could introduce a TTL to remove or unwatch notebooks.

Gateways can serve quasi-arbitrary content, as hypermerge does not enforce a particular schema—as gateways are intended to be run on an institutional infrastructure (and domain), they should be safe. Thus, these gateways should not be open. Hypermerge will introduce such functionality soon.

The gateway does not support (proper) pinning.

Subscription support poses a bottleneck for the gateway. While responding to HTTP requests is easily done---the gateway process has all data already available, as it's local-first, in some way---subscriptions need more information. In particular, with the current architecture and version of Hypermerge, we need to create a _diff_ for each repository update. This is done by calculating by creating SHA1 hashes of each annotation's JSON-encoded string representation. Many updates could easily exhaust a single gateway. However, transmitting a complete notebook for each update to _all_ subscribers could exceed the bandwidth quickly.

