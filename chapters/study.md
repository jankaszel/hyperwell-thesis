# User Testing Study {#sec:study}

Clearly, mainstream achievements in the development and engineering of computers led to what we know today as the Digital Humanities. As I've outlined before, the increasing computational powers brought us Humanities Computing---computational approaches for the Humanities---as well as an overall digital practice. Yet, the capabilities of computers are not yet limited by these terms: Devices are connected via a vast digital network with an increasing throughput. Contemporary computer networks allow not just for a mere exchange of discrete information, but rather for real-time exchange of virtual spaces.

One modality of such a virtual space is video conferencing. As @hunyadi2016 notes, scheduling meetings online---with local and remote colleagues alike---has had an enormous impact on interdisciplinary collaboration in the Digital Humanities. In some academic Digital Humanities communities, video conferencing facilitated holding international events and local plenary discussions alike with little effort to great effect: Students could interact with internationally acclaimed researchers, and regular remote meetings emerged quickly.

Remote collaboration does not end there, however. As workplaces can be understood as a collection of tools for particular tasks of work---physical or virtual---, video conferencing does not allow for using all of these tools collaboratively. By transmitting changes on a collaborative piece of work, however, progress can be achieved remotely between colleagues [@dourish1992; @schwartz1998].

_TODO:_ Reason to do this study: What does a virtual space bring us, where people can collaborate in real-time [@dourish1992]? What are the prospects of real-time collaboration in the Digital Humanities? What's about the state of the art of digital collaboration environments [@kleppmann2019]?

Instead of developing a novel annotation environment---which would have extended the scope of this thesis---I've set out to find an existing environment for a major reason: To learn about peoples' habits when collaborating with digital tools, arbitrary design choices in the UI should be a minor factor. Already established environments commonly received feedback from their users and adjusted its UI and UX to their users' needs. Among various candidates such as Hypothes.is and the Mirador IIIF viewer, I've chosen the Recogito annotation tool as the setting for this study and as proof-of-concept for further experimenting with integrating peer-to-peer annotation storage. Among the requirements---documentation, Web Annotation interoperability, collaboration, popularity---, Recogito scored well:

* **Technical and academic documentation:** The Recogito team has published about the development process [@simon2015; @simon2017] and the source code of Recogito is available publicly[^recogito-repo]. The web application's user interface is extensible, as it is written in JavaScript for browser use. While Pelagios provides an official instance of Recogito[^recogito-pelagios], providing an own instance by using the Docker[^docker] container virtualization environment is supported. Additionally, the team behind Recogito has been responsive and supported us while setting up our own instance as well as transferring data over to Pelagios' official instance.
* **Web Annotation interoperability:** While Recogito does not support an external annotation storage, its annotation data model is _partially compliant_ with the Web Annotation data model. This would be of importance for eventual later stages of this project, when trying to integrate P2P storage into the annotation environment.
* **Collaborative workflows:** With Recogito, resources can be shared with other users, allowing for collaborative annotation. I'll discuss Recogito's collaboration functionality below.
* **Annotation capabilities:** Recogito provides an environment for annotating textual resources, including classic Greek or Latin texts, and annotating images. Furthermore, users can import canonical resources from CTS repositories and IIIF manifests. With a focus on georeferencing, _TODO_.
* **Popularity:** Usage of Recogito is widespread among some Digital Humanities communities. Over the course of this thesis, the number of signed-up users went up to 5.000. Picking a renowned tool for the user testing has had a high priority, as finding collaborating scholars with proficiency in using that tool was easier. 

* Chiara Palladino from Furman University is a member of the Pelagios initiative and related to Recogito.

* Highlight that Recogito currently does not provide real-time collaboration, and requires a refresh of the website in order to display fresh work of collaborators. This plays well with the remark of @dourish1992---that the context of digital collaboration not just concerns the content of work, but also its character and expression throughout the ongoing collaboration. @schwartz1998 describe such a system more precisely in their patent.

Aspects we wanted to learn about:

* Digital workflow: How do users actually behave during real-time collaboration, what are their micro-actions and patterns that emerge when there is no real-time update, how often do they revisit others' work?
* Learning curve
* Explore their personal experiences with the sessions; how did they perceive the collaboration in an online & offline way

It became a collaborative venture between Chiara and me, and resulted in an open publication as well as a blog post on the Pelagios blog, with an emphasis on using Recogito in the classroom.

[^recogito-repo]: <https://github.com/pelagios/recogito2>
[^docker]: <https://www.docker.com/>
[^recogito-pelagios]: <https://recogito.pelagios.org/>

## Study Design {#sec:study:design}

* Duration & Schedule of sessions
* Focus of each session
* Explicit feedback via surveys on Google Forms 
  * Type of feedback questions (open-ended, Likert scale, ...)
* Materials used: Iliads Map of Ships (Greek text) & Tabula Peutingeriana (map)

The study has been designed with two sessions in mind. During these sessions, volunteer participants would perform tasks using the Recogito annotation environment.

### Technical Evaluation

* Docker setup

* Telemetry/tracking setup (API, SDK, database)
* illustration which events where sent, describe which actions they should express in detail

* Implementing tracking into Recogito
* Evaluation of all tracking data via Jupyter Notebooks (with a Node.js backend)

## Setting and Testing Group {#sec:study:setting}

* Liberal setting during class (although it has not been _regular_ class for students)
* Testing group has been a group of X students; mostly freshmen and -women at Furman University. While a majority of them had stated an experience with digital annotation and collaboration (e.g., Google Docs)
* Students have been compensated with extra credits when "successfully" participating---that means, being present on all sessions.
* Students have been sitting on a single large desk at some room of the Furman University Classics department.
* I have been present via video; more specificially, my video stream was being played back on a big screen directly in front of that table.
* Students have been talking during both sessions; even more, they were encouraged to collaborate physically (by talking---not using others' computers) and creating annotations, exploring the user interface

## Results {#sec:study:results}

_TODO:_ To be continued. I didn't yet calculate final results and formulate hypotheses. However, these should be applied to one of the implementations of @sec:implementation, and be discussed further in @sec:discussion.

_TODO:_ Open publication containing the students' work; exported into various formats. However, Recogito is yet missing an import functionality that is easily accessible.

_TODO:_ Verbal feedback of the students that we've gathered for that publication (just cite the blog post).

