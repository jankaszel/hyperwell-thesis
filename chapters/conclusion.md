# Conclusion {#sec:conclusion}

## Thesis Summary {#sec:summary}

In summary, pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc eleifend, ex a luctus porttitor, felis ex suscipit tellus, ut sollicitudin sapien purus in libero. Nulla blandit eget urna vel tempus. Praesent fringilla dui sapien, sit amet egestas leo sollicitudin at.

## Future Work {#sec:future-work}

Future prospects:

* As it turned out while working on the implementation of Hyperwell: Building an annotation system is complicated, being it distributed or not. It depends on at least two major components: An annotation environment, as well as a component for storage and inspection. The software presented in @sec:hyperwell does not cover all of this; the Hyperwell gateway and Notebook notebook application lack an annotation environment that supports real-time shared workspaces. In future work, I aim to realize such an environment---if possible, with support of Recogito.
* Leverage Linked Data prospects even further. Especially in the Notebook application, Linked Data could be used to interact with a resource as whole---for instance, when doing georeferencing. Web Annotations can provide an intent and a type, so the application could provide various modes of visualization. The Hyperwell Notebook application could help with that, and implement some annotation target resolvers directly.
  * Linked Data Notifications
  * WebID
* Resource Discovery: While working on the 'thick peer' approach, a discovery mechanism has been developed for the protocol that has been used in this particular approach: Users working on a resource could easily spot other users' notebooks that target this resource.
* Research into pinning in conjunction with institution-provided gateways
* Referencing of particular versions via an extension of the Web Annotation Protocol, e.g., `https://xyz.edu/annotations/<doc>/<annotation>/<version>`

