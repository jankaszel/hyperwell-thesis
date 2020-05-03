# Annotation Environment {#sec:annotation-environment}

* Hyperwell is in an experimental stage, but I have created a setup for testing that works (software detailed in @sec:hyperwell:gateway and @sec:hyperwell:support, obtain via DOIs A and B).
* Requires Node.js version X for running.
* Install dependencies via `npm install` on each project
* Run a dummy node via `node tools/touch.js`. Copy the ID as a hexadecimal string.
* Run a gateway server via `./bin/server.js`.
* Run the annotation environment development server via `npm run dev`.
* Construct the URL with the aforementioned ID.
* Enter the string in the environment input, make sure 'Hyperwell' is checked.
* Enjoy.
