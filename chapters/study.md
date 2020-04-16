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

After reaching out to scholars with a background on Digital Humanities and digital annotation, Chiara Palladino, Assistant Professor of Classics at Furman University, USA, announced interest on launching a joint project on this matter. Chiara Palladino teaches Classics with a focus on Digital Humanities and, as a member of the Pelagios Commons, previously conducted research on the use of Linked Open Data (LOD) tools in the classroom[^chiara-lod-post]. She motivated a group of undergraduate students at Furman University to participate in the study and managed both study sessions overseas. While I designed this study as part of this thesis, we have curated a joint open publication including the students' annotations and notes on the overall feedback (_TODO:_ add reference). This publication has been accompanied by an article on the Pelagios blog (_TODO:_ add reference).

* Highlight that Recogito currently does not provide real-time collaboration, and requires a refresh of the website in order to display fresh work of collaborators. This plays well with the remark of @dourish1992---that the context of digital collaboration not just concerns the content of work, but also its character and expression throughout the ongoing collaboration. @schwartz1998 describe such a system more precisely in their patent.

Aspects we wanted to learn about:

* Digital workflow: How do users actually behave during real-time collaboration, what are their micro-actions and patterns that emerge when there is no real-time update, how often do they revisit others' work?
* Learning curve
* Explore their personal experiences with the sessions; how did they perceive the collaboration in an online & offline way
  * How did they experience the collaborative environment in regard to their own thoughts?

In order to learn about these experiences and achieve further insights into the more complex aspects of collaboration, we have imposed qualitative as well as quantitative feedback, implicitly as well as explicitly. First, in order to learn the qualitative aspects of collaboration, feedback questionnaires have been handed out to participants ... _TODO_. We describe these questionnaires in @sec:study:framework. Implicit insights were achieved by tracking participants' workflows digitally during study sessions. The technology behind this approach is outlined in @sec:study:tracking.

_TODO:_ Emphasize the trade-off of controlling the session versus generating creative input (and simulating the class environment).

In the following, I present the study in its entirety. First, in @sec:study:framework, I will introduce the fundamental study framework that consistent of two distinct sessions, during which participants were asked to collaborate within Recogito. During each sessions, participants actions have been tracked digitally and stored in a database. This allowed us to reconstruct each participants' workflow afterwards. The actual setting of the study with brief summaries of both sessions is outlined in @sec:study:setting. Finally, I present the results in @sec:study:results.

[^recogito-repo]: <https://github.com/pelagios/recogito2>
[^docker]: <https://www.docker.com/>
[^recogito-pelagios]: <https://recogito.pelagios.org/>
[^chiara-lod-post]: In a course on Classical Archeology, Chiara Palladino conducted an experimental project to learn about the use of Linked Open Data (LOD) collections and an LOD search engine while researching historical Graeco-Roman sites: <https://medium.com/pelagios/linked-open-data-to-navigate-the-past-using-peripleo-in-class-4286b3089bf3>

## Study Framework {#sec:study:framework}

_TODO:_ Put into present tense, passive voice?

The study framework consists of six basic components: three questionnaires (demographic survey, first post-session survey, second post-session survey), a modified, self-hosted instance of Recogito, as well as two distinct study sessions during which participants are asked to annotate collaboratively. The questionnaires are partly inspired by a usability questionnaire design called User Experience Questionnaire, or short UEQ [@laugwitz2008]. The UEQ framework emphasizes feedback on the ergonomic and hedonic qualities of a piece of software and has been designed to quickly assess experiences of users. In the following, I will discuss the above components in their chronological order.

Prior to being admitted to the study, each potential participant had to submit an initial survey asking about demographic information such as age and education level. Additionally, this survey posed questions about participants' past habits of annotating digitally as well as on paper, and whether they used Recogito before. All surveys of this study have been created on Google Forms[^google-forms] and have been distributed to all participants via email prior to each session.

The actual study consisted of two distinct sessions during which participants were asked to collaboratively annotate resources. Prior to the session, they have been provided with the URL of a website running a modified version of Recogito, as well as an individual account on this Recogito instance. On this instance, resources fitting the educational background of the participants have been ingested and shared with all accounts working on that resource.

During both sessions, all participants were to be present in the same room with each a computer in front of them and a web browser running, pointing to said Recogito instance. Each session lasted about 60 minutes, with the supervisors present in the room or remotely via video. During the first ten minutes of a session, one supervisor was to give a short introduction at the subject of the session, followed by an opportunity for participants to raise questions. Most notably, in order to ensure the open-ended, creative, and collaborative aspect of this study, we posed little limitations on the participants, as I will illustrate in the following @sec:study:setting.

After the introduction, participants were asked to start working for about 45 minutes while being monitored by the supervisors. During the first sessions, participants received the task of making themselves comfortable with the given resource and the annotation environment of Recogito. They were instructed to work collaboratively and annotate each their resource with textual annotations, given the constraint that one needs to reload the website in order to show others' latest annotations.

Subsequent to the first session, participants were asked to fill out the first post-session questionnaire regarding their experience of working with Recogito in a collaborative environment. This questionnaire is detailed in @sec:questionnaires and asked participants about their work during the session ("Did you interact with others' annotations while working on the document?") and posed questions on experience-related sentiments as Likert-scale questions ("How interactive did the process of annotating collaboratively feel to you?"). 

The second session, taking place days or weeks after the first one (_TODO:_ Why days or even weeks? Explain.), had a focus on the particular task of georeferencing, i.e., annotating words or areas---in a text or image resource, respectively---with entities of historic places, such as Athens in Ancient Greece. This task requires to have the respective gazetteers available ingested[^recogito-gazetteers] into Recogito before the session takes place. The selected gazetteer should provide places matching the contents epoch of the selected resources. The session itself has been scheduled similar to the first meeting, with a total duration of 60 minutes including a 15 minutes introduction. This time, participants were explicitly asked to explore the capabilities of georeferencing and were shown the interactive mapping visualization of Recogito. Additionally, supervisors suggested the participants to revisit their previous annotations, as well as the annotations of others, as the group continued to work on the resources and thus, the annotations, they edited during the first session.

The second questionnaire emphasized feedback on the participants' scholarly experience with georeferencing and their user experience Recogito. The questionnaire is provided in @sec:questionnaires. Focusing on georeferencing, the first part of the questionnaire asked participants about their performance on the given tasks throughout the second session and posed questions on georeferencing in particular ("How beneficial was georeferencing places in annotations for your further understanding?"). Given that users had spent two sessions working with Recogito, the second part of the questionnaire asked participants about the ergonomic and hedonic qualities of Recogito, as introduced by the UEQ. Likert-scale type questions asked about participants experience on comprehensibility, innovation, attractiveness, pragmatics, clutter, and creativity of Recogito.

[^google-forms]: Google Forms is a free service by Google that allows users to create surveys in their web browsers: <https://www.google.com/forms/about/>. Google Forms surveys can be distributed with each their unique URL and results are stored on Google Drive, Google's cloud file storage.
[^recogito-gazetteers]: Recogito allows to import collections of referenceable places called gazetteers: <https://github.com/pelagios/recogito2/wiki/Importing-Gazetteers>. The import should be scheduled well ahead of the second session, as the import of large gazetteers will take a while for Recogito to process.

### Digital Tracking {#sec:study:tracking}

In order to evaluate the _actual_ use of a particular tool while performing tasks, the actions of participants can be recorded. @tang1991 have utilized video recordings of joint collaborative tasks during study sessions, but as our setting was designed to be not limiting participants' creativity and the expected sample size has been relatively large---it would be hard to make out an individuals' actions in a group of ten people or more---, video recording was not suitable for this study. Instead, we opted for real-time aggregation of particular user interactions. Modeling these interactions during an annotation workflow in Recogito as timestamped atomic actions enabled us to reconstruct each participant's actions afterwards. 

![Workflow for (collaborative) annotation in Recogito. The workflow consists of six actions: initialization (1), creation (2), opening (3), editing (4), closing (5), and deleting (6). While opening or creating  will open the annotation editor overlay window, editing, closing, or deleting will close this window and reveal the underlying resource.](figures/recogito-workflow.pdf){#fig:recogito-workflow short-caption="Workflow for annotation in Recogito"}

This workflow is visualized in @fig:recogito-workflow and consists of the following six events:

* **Initialization:** An `init` event gets tracked when Recogito initializes, i.e., either when opening a resource in Recogito after selecting it from the browser or reloading the annotation environment of that resource.
* **Create annotation:** A `create` event gets tracked when a user creates a _new_ annotation on the current resource.
* **Open annotation:** An `open` event gets tracked when a user accesses an _existing_ annotation on the current resource, which will open an editing overlay for that annotation in Recogito. This event is getting tracked independently of who created the annotation.
* **Edit annotation:** An `edit` event gets tracked when a user edits an existing annotation independently of its creator. Within the context of Recogito, editing entails either the original annotation, adding a subordinate annotation to this annotation, editing a subordinate annotation, or deleting a subordinate annotation.
* **Close annotation:** A `close` event gets tracked when a user closes the editing overlay for an annotation.
* **Delete annotation:** A `delete` event gets tracked when a user deletes a parent annotation (and thus, any subordinate annotation).

For tracking these, we adapted parts of Recogito to our needs. As the UI of Recogito is written in JavaScript, we could easily identify the modules controlling Recogito's annotation editor and inject function calls to send the respective events to a backend server via HTTPS. Such an event---depicted in @lst:tracking-event---would include the event type, the acting user's ID, a timestamp, and the respective annotation to which the the event is related. On the server, a HTTP server written in JavaScript, too, and running on the Node.js runtime, would receive the events and insert them as JSON-encoded entry into a CouchDB[^couchdb] NoSQL database. In that database, all events would remain for later evaluation.

Listing: Example JSON-encoded excerpt of a tracking event after querying from the CouchDB database. In this event, `user1` opens an annotation created by `user2`.

```{.js #lst:tracking-event}
{
  "_id": "000c6fd0-1530-11ea-8886-214517bdac3a",
  "type": "open",
  "userId": "user1",
  "annotation": {
    "annotation_id": "5c136455-c514-472a-8d33-4756e23b70e9",
    "version_id": "6d693d8e-58a0-4c38-abe0-47a7523003c2",
    "annotates": { ... },
    "contributors": ["user2"],
    "anchor": "tbox:x=2840,y=746,a=0.19528139809489925,l=93,h=-23",
    "last_modified_by": "user2",
    "last_modified_at": "2019-11-15T18:07:45+00:00",
    "bodies": [
      {
        "type": "TRANSCRIPTION",
        "last_modified_by": "user2",
        "last_modified_at": "2019-11-15T18:07:45+00:00",
        "value": "Bandritum"
      }
    ]
  },
  "timestamp": 1575310649165
}
```

For evaluating the events, we utilized two contemporary approaches for interactive notebooks. The Jupyter[^jupyter] notebook environment with a Node.js-based kernel[^ijavascript]for exploring the vast amount of events recorded during both study sessions [@kassel2020b]. After providing the notebook with a JSON-encoded dump of the CouchDB database used for storing events, it will guide users through preparation and processing of the data and ultimately present key insights into participants' workflows, as detailed in the results section below. With browser-based notebooks on Observable[^observable], we then generated visual insights into survey feedback we received from participants by exporting the Google Forms survey feedback to CSV-based data and processing it with D3[^d3].

[^couchdb]: <https://couchdb.apache.org/>
[^jupyter]: <https://jupyter.org/>
[^ijavascript]: The Jupyter notebook environment supports various kernels for programming languages other than Python. `IJavaScript` is a kernel for running JavaScript snippets via the Node.js runtime: <https://github.com/n-riesco/ijavascript>
[^observable]: <https://observablehq.com/>
[^d3]: D3 is a JavaScript library for manipulating web documents based on data: <https://d3js.org/>. With interactive notebooks on Observable, pre-processed data can be visualized easily using D3.


## Setting and Observations {#sec:study:setting}

Through her teaching at Furman University, Chiara Palladino recruited a group of students who were interested in participating in the study. They have been offered extra credits on their coursework when participating in both sessions and providing the required feedback. A group of size $n = 11$ students with various backgrounds among classics, politics, and social science, signed up for the study. The students had diverse experience with annotation: While all of them were undergraduate students at Furman University, almost all of them frequently annotate resources by hand. When asked about their use of real-time collaboration software, such as Google Docs, a majority stated a frequent use of such software, but with a varying degree of collaboration. Annotating documents digitally has been less common, as just $54.5%$ of the students stated that they use digital annotation at least infrequently. None of them had any prior experience with Recogito itself.

During both sessions, the students worked all together in the Common Room of the classics department at Furman University, which is accommodated with a large screen and a table with multiple chairs.

In the first session, the students have been introduced to the study subject of collaborative annotation with Recogito and have been set up with their accounts and the respective sources to annotate. In the following 45 minutes of 

They received a basic introduction on their sources and their structure, and a very short tutorial on how to use Recogito. In the first session, they were instructed to look for named entities in their sources, transcribe or translate them with appropriate tags, and they georeferenced their findings in the second session.

They were supervised by Chiara Palladino and monitored by Jan Kaßel on video, but the work assignment was intentionally very loose, to allow them a “face-to-face” approach to the concrete issues of annotating primary sources.

To stimulate comradery, and also as a partial reward for the effort, we provided an abundant dose of pizza for everyone. During the whole time of the experiment, they lively engaged in discussions and helped each other as well, occasionally providing feedback on the spot and asking “big picture” questions about the sources. 



monitored by Chiara Palladino, who has been present in the room, and me, who joined remotely from Leipzig via video

* Materials used: Iliads Map of Ships (Greek text) & Tabula Peutingeriana (map)
* Gazetteer used: Digital Atlas of the Roman Empire (DARE) [@ahlfeldt2013]

Additionally, participants had to sign up for an account on a private website running a modified version of Recogito. To ensure their anonymity while filling out surveys, participants each had to pick a unique identifier consisting of alphanumerical characters. 

  * and were each asked to sign up for an account with a
  * install a recent version of either the Mozilla Firefox or Google Chrome web browsers, as Recogito and our tracking functionality rely on modern versions of the JavaScript programming language.
* Liberal setting during class (although it has not been _regular_ class for students)
* Testing group has been a group of X students; mostly freshmen and -women at Furman University. While a majority of them had stated an experience with digital annotation and collaboration (e.g., Google Docs)
* Students have been compensated with extra credits when "successfully" participating---that means, being present on all sessions.
* I have been present via video; more specificially, my video stream was being played back on a big screen directly in front of that table.
* Students have been talking during both sessions; even more, they were encouraged to collaborate physically (by talking---not using others' computers) and creating annotations, exploring the user interface

## Results {#sec:study:results}

_TODO:_ To be continued. I didn't yet calculate final results and formulate hypotheses. However, these should be applied to one of the implementations of @sec:implementation, and be discussed further in @sec:discussion.

While students verbally collaborated with each other within the group room, digital collaboration has just been measurable to a small extent: _TODO_. As it has been mentioned before, Recogito does not support real-time collaboration and will require a refresh of the website---similar to a restart of an application running natively---in order to display collaborators' recent changes. @dourish1992 note, that in order to realize environments for remote collaboration, colleagues' awareness has to be coordinated in real-time across the shared workspace.

Overall, students created $X$ annotations during the first session (median: $X_1$ per student) and $Y$ annotations during the second session (median: $Y_1$ per student). 

_TODO:_ Have graphs showing the results of the Likert scale experience-related questions---either boxplot charts, or stacked diverging bar charts.

First questionnaire:

* How motivated (stagnated/enthusiastic)
* Intellectual privacy (intruded/overprotected)
* Interactivity (static/energetic)
* Communicative (isolated/talkative)

Second questionnaire:

* Georeferencing has been beneficial (worthless/greatly helpful)
* Recogito: Comprehensible (complicated/intuitive)
* Recogito: Innovative (conservative/revolutionary)
* Recogito: Attractive (repulsive/pretty)
* Recogito: Pragmatic (inhibitive/self-propelling)
* Recogito: Cluttered (minimalist/overcharged)
* Recogito: Creative (fanciless/stimulating)

![Results of the second questionnaire](figures/charts/survey-2.pdf)

_TODO:_ Technical evaluation: This will give us insights into the age of the watched annotations. If the data allows for this, create a graph for comparison ('youngest annotation considered at point x'). Even further, it would be great to have some kind of indicator of the average age as well as age range a system allowed (during testing!) to work with in a certain period of time. This is in relation to @dourish1992.

Annotating resources is a semi-synchronous task, one might argue, due to the fact that it requires focused, solitary insights into a particular resource. While annotating a resource, focus is an important facilitator of the intellectual process. @dourish1992 anticipate the overhead of _informational awareness_ and emphasize considerate usage of communication channels depending on the nature of the workspace---being it private or actively shared. The results of this study clearly show a two-fold lack of awareness on collaborative work in Recogito if used in an shared workspace that is used synchronously: First, the workspace _content_ is not synchronized in real-time. Second, if changes of others were to be synchronized, Recogito lacked the presentation of other users' activities.

_TODO:_ Open publication containing the students' work; exported into various formats. However, Recogito is yet missing an import functionality that is easily accessible.

_TODO:_ Verbal feedback of the students that we've gathered for that publication (just cite the blog post).

