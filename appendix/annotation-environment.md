# Annotation Environment {#sec:annotation-environment}

In @sec:hyperwell:support I have presented an experimental annotation environment that leverages the real-time collaboration capabilities of Hyperwell on the web. By using the Hyperwell gateway server introduced in @sec:hyperwell:gateway, users can test these capabilities in their web browsers.

**The following steps require a macOS operating system.** While the software components of Hyperwell could work on Linux machines, I have not tested them in that regard and can not guarantee compatibility with Linux. Furthermore, a total of three terminal sessions are required.

1. Install version 13.6 or newer of the Node.js[^node-js] JavaScript runtime.
2. Obtain the code repositories of both the Hyperwell gateway [@kassel2020] and the Hyperwell annotation environment [@kassel2020c]. These repositories are archived on Zenodo and on GitHub.[^hyperwell-project-again] Please use the respective versions of the software to make sure that the following steps will work.
3. Install dependencies via `npm install` on both repositories.
4. Navigate the first terminal to the gateway directory and start a dummy node via `node tools/touch.js`. This script will create a new notebook and subsequently replicate it on the network. Copy the gateway ID of the newly created notebook, which is a sequence of hexadecimal characters.
5. Navigate the second terminal to the gateway directory and start a gateway server via `./bin/server.js`. The server will listen for connections on the local machine (localhost), defaulting to port 3000.
6. Navigate the third terminal to the annotation environment directory and start the development server via `npm run dev`. The annotation environment will be available on port 5000 by default.
7. Assemble the IRI of the previuosly created notebook by appending its hexadecimal ID to the base URL of the gateway, `http://localhost:3000/annotations/`.
8. After accessing the annotation environment via `http://localhost:5000/` on a web browser such as Mozilla Firefox, enter the notebook IRI in the upper input field and make sure to check the _Hyperwell Gateway_ option for receiving collaborative changes in real-time.
9. By clicking _Load Annotations_, the annotation environment will connect to the gateway server, which again will relay any created annotations to the notebook created in step 4. Users can validate the real-time collaborative capabilities by opening the annotation environments in multiple browser windows on the same machine.

[^node-js]: <https://nodejs.org/en/>.
[^hyperwell-project-again]: <https://github.com/hyperwell>.
