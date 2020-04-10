# User Testing Study {#sec:study}

Clearly, mainstream achievements in the development and engineering of computers led to what we know today as the Digital Humanities. As I've outlined before, the increasing computational powers brought us Humanities Computing---computational approaches for the Humanities---as well as an overall digital practice. Yet, the capabilities of computers are not yet limited by these terms: Devices are connected via a vast digital network with an increasing throughput. Contemporary computer networks allow not just for a mere exchange of discrete information, but rather for real-time exchange of virtual spaces.

One modality of such a virtual space is video conferencing. As @hunyadi2016 notes, scheduling meetings online---with local and remote colleagues alike---has had an enormous impact on interdisciplinary collaboration in the Digital Humanities. In some academic Digital Humanities communities, video conferencing facilitated holding international events and local plenary discussions alike with little effort to great effect: Students could interact with internationally acclaimed researchers, and regular remote meetings emerged quickly.

Remote collaboration does not end with video conferencing, however. As workplaces can be understood as a collection of tools for particular tasks of work---physical or virtual---, video conferencing does not allow for using actual tools collaboratively. By transmitting changes on a collaborative piece of work and respective tools, progress can be achieved remotely in a shared workspace between colleagues [@dourish1992; @schwartz1998]. @tang1991 outline the modalities of a collectively shared workspace: _TODO_. @dourish1992 highlights further prospects of shared workspaces that are being accessed by colleagues remotely. _TODO_(expand on @dourish1992 insights). With the positive feedback on meetings held remotely in academia, this leaves us with many possible benefits of real-time collaborative applications.

_TODO:_ Reason to do this study: What are the prospects of real-time collaboration in the Digital Humanities? What's about the state of the art of digital collaboration environments [@kleppmann2019]?

With the collaborative prospects of local-first applications in mind, this study is intended to shine light upon how people _actually_ collaborate in an annotation environment. 

Instead of developing a novel annotation environment---which would have extended the scope of this thesis---I've set out to find an existing environment for a major reason: To learn about peoples' habits when collaborating with digital tools, arbitrary design choices in the UI should be a minor factor. Already established environments commonly received feedback from their users and adjusted its UI and UX to their users' needs. Among various candidates such as Hypothes.is and the Mirador IIIF viewer, I've chosen the Recogito annotation tool as the setting for this study and as proof-of-concept for further experimenting with integrating peer-to-peer annotation storage. Among the requirements---documentation, Web Annotation interoperability, collaboration, popularity---, Recogito scored well:

* **Technical and academic documentation:** The Recogito team has published about the development process [@simon2015; @simon2017] and the source code of Recogito is available publicly[^recogito-repo]. The web application's user interface is extensible, as it is written in JavaScript for browser use. While Pelagios provides an official instance of Recogito[^recogito-pelagios], providing an own instance by using the Docker[^docker] container virtualization environment is supported. Additionally, the team behind Recogito has been responsive and supported us while setting up our own instance as well as transferring data over to Pelagios' official instance.
* **Web Annotation interoperability:** While Recogito does not support an external annotation storage, its annotation data model is _partially compliant_ with the Web Annotation data model. This would be of importance for eventual later stages of this project, when trying to integrate P2P storage into the annotation environment.
* **Collaborative workflows:** With Recogito, resources can be shared with other users, allowing for collaborative annotation. I'll discuss Recogito's collaboration functionality below.
* **Annotation capabilities:** Recogito provides an environment for annotating textual resources, including classic Greek or Latin texts, and annotating images. Furthermore, users can import canonical resources from CTS repositories and IIIF manifests. With a focus on georeferencing, Recogito emphasizes the usage of Linked Data references for annotations.
* **Popularity:** Usage of Recogito is widespread among some Digital Humanities communities. Over the course of this thesis, the number of signed-up users went up to 5.000. Picking a renowned tool for the user testing has had a high priority, as finding collaborating scholars with proficiency in using that tool was easier. 

After a round of initial inquiries, Chiara Palladino, Assistant Professor of Classics at Furman University, USA, has been excited to draw a joint project in 

* Chiara Palladino from Furman University is a member of the Pelagios Commons and is involved in the development and planning of Recogito.

* Highlight that Recogito currently does not provide real-time collaboration, and requires a refresh of the website in order to display fresh work of collaborators. This plays well with the remark of @dourish1992---that the context of digital collaboration not just concerns the content of work, but also its character and expression throughout the ongoing collaboration. @schwartz1998 describe such a system more precisely in their patent.

Aspects we wanted to learn about:

* Digital workflow: How do users actually behave during real-time collaboration, what are their micro-actions and patterns that emerge when there is no real-time update, how often do they revisit others' work?
* Learning curve
* Explore their personal experiences with the sessions; how did they perceive the collaboration in an online & offline way
  * How did they experience the collaborativ environment in regard to their own thoughts?

_TODO:_ It became a collaborative venture between Chiara and me, and resulted in an open publication as well as a blog post on the Pelagios blog, with an emphasis on using Recogito in the classroom.

In the following, I present the study in its entirety. First, in @sec:study:framework, I will introduce the fundamental study framework that consistent of two distinct sessions, during which participants were asked to collaborate within Recogito. During each sessions, participants actions have been tracked digitally and stored in a database. This allowed us to reconstruct each participants' workflow afterwards. The actual setting of the study with brief summaries of both sessions is outlined in @sec:study:setting. Finally, I present the results in @sec:study:results.

[^recogito-repo]: <https://github.com/pelagios/recogito2>
[^docker]: <https://www.docker.com/>
[^recogito-pelagios]: <https://recogito.pelagios.org/>

## Study Framework {#sec:study:framework}

_TODO:_ Put into present tense, passive voice?

Prior to being admitted to the study, each potential participant had to submit an initial survey asking about demographic information such as age and education level. Additionally, this survey posed questions about participants' past habits of annotating digitally as well as on paper, and whether they used Recogito before. All surveys of this study have been created on Google Forms[^google-forms] and have been distributed to all participants via email prior to each session.

The actual study consisted of two distinct sessions during which participants were asked to collaboratively annotate resources. Prior to the session, they have been provided with the URL of a website running a modified version of Recogito, as well as an individual account on this Recogito instance. On this instance, resources fitting the educational background of the participants have been ingested and shared with all accounts working on that resource.

During both sessions, all participants were to be present in the same room with each a computer in front of them and a web browser running, pointing to said Recogito instance. Each session lasted about 60 minutes, with the supervisors present in the room or remotely via video. During the first ten minutes of a session, one supervisor was to give a short introduction at the subject of the session, followed by an opportunity for participants to raise questions. Most notably, in order to ensure the open-ended, creative, and collaborative aspect of this study, we posed little limitations on the participants, as I will illustrate in the following @sec:study:setting.

After the introduction, participants were asked to start working for about 45 minutes while being monitored by the supervisors. During the first sessions, participants each received the task of making themselves comfortable with the given resource and the annotation environment of Recogito. They were instructed to work collaboratively given the constraint that one needs to reload the website in order to show others' latest annotations.

_TODO:_ Subsequent to the first session, participants were asked to fill out the first questionnaire regarding their experience with Recogito and in a collaborative environment. This questionnaire is detailed in @app:questionnaires and asked participants about their work during the session ("Did you interact with others' annotations while working on the document?") and posed questions on experience-related sentiments as Likert-scale questions ("How interactive did the process of annotating collaboratively feel to you?").

_TODO:_ Second session, focused on georeferencing. Ingested the respective digital atlas beforehand.

_TODO:_ Second questionnaire on scholarly experience (georeferencing) and user experience (Recogito)

[^google-forms]: Google Forms is a free service by Google that allows users to create surveys in their web browsers: <https://www.google.com/forms/about/>. Google Forms surveys can be distributed with each their unique URL and results are stored on Google Drive, Google's cloud file storage.

### Digital Tracking {#sec:study:tracking}

In order to evaluate the _actual_ use of a particular tool while performing tasks, the actions of participants can be recorded. @tang1991 utilized video recordings of joint collaborative tasks during study sessions, but as our setting was designed to be less determining and the amount of participants has been relatively large, video recording was not suitable for this study. Instead, we opted for real-time aggregation of user events, i.e., particular user interactions. Modeling these interactions during an annotation workflow in Recogito as timestamped atomic actions enabled us to reconstruct each participant's actions afterwards. This workflow is depicted in @fig:recogito-workflow.

![Workflow for (collaborative) annotation in Recogito.](figures/recogito-workflow.pdf){#fig:recogito-workflow}

* illustration which events where sent, describe which actions they should express in detail

For tracking these 

* Telemetry/tracking setup (API, SDK, database)

* Implementing tracking into Recogito
* Evaluation of all tracking data via Jupyter Notebooks (with a Node.js backend)

## Setting and Testing Group {#sec:study:setting}

* No participant used Recogito prior to this study
* Only a fraction of the participants had frequent experience with digital annotation
* IDs, accounts, and sign-ups caused confusion among students, and did cost us some time during the first session.

monitored by Chiara Palladino, who has been present in the room, and me, who joined remotely from Leipzig via video

* Materials used: Iliads Map of Ships (Greek text) & Tabula Peutingeriana (map)

Additionally, participants had to sign up for an account on a private website running a modified version of Recogito. To ensure their anonymity while filling out surveys, participants each had to pick a unique identifier consisting of alphanumerical characters. 

  * and were each asked to sign up for an account with a
  * install a recent version of either the Mozilla Firefox or Google Chrome web browsers, as Recogito and our tracking functionality rely on modern versions of the JavaScript programming language.

The students worked all together in the Common Room of the classics department, which is accommodated with a large screen and a table with multiple chairs. They received a basic introduction on their sources and their structure, and a very short tutorial on how to use Recogito. In the first session, they were instructed to look for named entities in their sources, transcribe or translate them with appropriate tags, and they georeferenced their findings in the second session. They were supervised by Chiara Palladino and monitored by Jan Kassel on video, but the work assignment was intentionally very loose, to allow them a “face-to-face” approach to the concrete issues of annotating primary sources. To stimulate comradery, and also as a partial reward for the effort, we provided an abundant dose of pizza for everyone. During the whole time of the experiment, they lively engaged in discussions and helped each other as well, occasionally providing feedback on the spot and asking “big picture” questions about the sources. 

* Liberal setting during class (although it has not been _regular_ class for students)
* Testing group has been a group of X students; mostly freshmen and -women at Furman University. While a majority of them had stated an experience with digital annotation and collaboration (e.g., Google Docs)
* Students have been compensated with extra credits when "successfully" participating---that means, being present on all sessions.
* Students have been sitting on a single large desk at some room of the Furman University Classics department.
* I have been present via video; more specificially, my video stream was being played back on a big screen directly in front of that table.
* Students have been talking during both sessions; even more, they were encouraged to collaborate physically (by talking---not using others' computers) and creating annotations, exploring the user interface

## Results {#sec:study:results}

_TODO:_ To be continued. I didn't yet calculate final results and formulate hypotheses. However, these should be applied to one of the implementations of @sec:implementation, and be discussed further in @sec:discussion.

While students verbally collaborated with each other within the group room, digital collaboration has just been measurable to a small extent: _TODO_. As it has been mentioned before, Recogito does not support real-time collaboration and will require a refresh of the website---similar to a restart of an application running natively---in order to display collaborators' recent changes. @dourish1992 note, that in order to realize environments for remote collaboration, colleagues' awareness has to be coordinated in real-time across the shared workspace.

Annotating resources is a semi-synchronous task, one might argue, due to the fact that it requires focused, solitary insights into a particular resource. While annotating a resource, focus is an important facilitator of the intellectual process. @dourish1992 anticipate the overhead of _informational awareness_ and emphasize considerate usage of communication channels depending on the nature of the workspace---being it private or actively shared. The results of this study clearly show a two-fold lack of awareness on collaborative work in Recogito if used in an shared workspace that is used synchronously: First, the workspace _content_ is not synchronized in real-time. Second, if changes of others were to be synchronized, Recogito lacked the presentation of other users' activities.

_TODO:_ Open publication containing the students' work; exported into various formats. However, Recogito is yet missing an import functionality that is easily accessible.

_TODO:_ Verbal feedback of the students that we've gathered for that publication (just cite the blog post).

