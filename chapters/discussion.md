# Discussion {#discussion}

In the two previous chapters, I detailed the main work of this thesis: An explorative user testing study, and the design and implementation of a P2P system for collaborative annotation.

## Usability

The study was designed to explorative and learn about the multi-faceted experiences of young students. However, the study was limited in some ways:
* It wasn’t a strict lab setting. Offline collaboration in the classroom (chatter) has been mixed with online collaboration.
* Students have been provided individual assistance.
* The required tasks were intended to provide room for exploration, and thus, haven’t been expressed too strictly

For a proper usability study, further work is required.

## Architecture

Identification within distributed networks via the Decentralized Identifiers standard [@did2019]. 

## Implementation

The system currently does not provide authentication nor encryption. There is no idea on how to realize end-to-end encryption using gateways.

Missing performance measuring. Gateways will have many open UDP connections and can just serve a particular amount of peers to the web.

Gateways could introduce a TTL to remove or unwatch notebooks.

Gateways can serve quasi-arbitrary content, as hypermerge does not enforce a particular schema—as gateways are intended to be run on an institutional infrastructure (and domain), they should be safe. Thus, these gateways should not be open. Hypermerge will introduce such functionality soon.

The gateway does not support (proper) pinning.