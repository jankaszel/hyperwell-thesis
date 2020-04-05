# User Testing Study {#sec:study}

_TODO:_ Introduce into the study environment:

For the Digital Humanities, an increased usage of digital tools didn't stop at the scientific practice: 

Reason to do this study: Explore how people commonly collaborate with online tools [@hunyadi2016]. What does a virtual space bring us, where people can collaborate in real-time [@dourish1992]? What are the prospects of real-time collaboration in the Digital Humanities? What's about the state of the art of digital collaboration environments [@kleppmann2019]?

Why use Recogito?
  * It's open source software.
  * It can be self-hosted.
  * It supports annotation of various materials.
  * It's a popular tool for Classics and Digital Humanities research.
  * The team has been communicative.
  * It's commonly used, so finding classes for this study would have been easier.
  * Chiara Palladino from Furman University is a member of the Pelagios initiative and related to Recogito.
  * Recogito uses the Web Annotation data model (or, some derivate of it, but supports a major part of the data model)
  * Recogito supports loading and annotating canonical content, such as texts from CTS services as well as image collections via IIIF manifests
  * Highlight that Recogito currently does not provide real-time collaboration, and requires a refresh of the website in order to display fresh work of collaborators. This plays well with the remark of @dourish1992---that the context of digital collaboration not just concerns the content of work, but also its character and expression throughout the ongoing collaboration.

Aspects we wanted to learn about:
  * Digital workflow: How do users actually behave during real-time collaboration, what are their micro-actions and patterns that emerge when there is no real-time update, how often do they revisit others' work?
  * Learning curve
  * Explore their personal experiences with the sessions; how did they perceive the collaboration in an online & offline way

It became a collaborative venture between Chiara and me, and resulted in an open publication as well as a blog post on the Pelagios blog, with an emphasis on using Recogito in the classroom.

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

