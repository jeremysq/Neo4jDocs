# Applications

  Neo4j can be used to grant visualizations to users both locally and remotely. This section goes into the detail involving the applications used to create interactions with Neo4j using web browsers for easy accessbility.
  
## Frontend
  Built in NUXT using Vue.js, this simple frontend application allows for users to connect locally to their Neo4j instance, or remotely depending on the information provided. 
  For visualization in the frontend, NeoVis.js is the open-source module that allows for a websocket connection to be instantiated to an existing Neo4j instance using the Bolt protocol.

  To begin using the frontend in a development environment, within the working directory (/Viewer):

    yarn
    yarn dev

  For a production environment:
    
    yarn build
    yarn start

  By locating to http://localhost:3000 after application startup, you should be able to access the frontend.

## Backend

  Using Docker and Neo4j, a fresh instance of Neo4j is initialized without the need of having the software installed locally on one's machine. This Docker container is also configured to load the Game of Thrones dataset, allowing for queries to be made to those specific nodes and relationships. In addition, any other graph database can also be loaded into this Docker container upon build given the configuration.

  To begin using this backend, ensure that you have [Docker](https://www.docker.com/products/docker-desktop) installed on your system, then, can run the following scripts:

  For Linux/MacOS:

    bash build.sh
    bash run.sh
  
  For Windows:
    
    ./build
    ./run

  For stopping the container, the <code>cleanup</code> script can be used as such:

  For Linux/MacOS:

    bash cleanup.sh
  
  For Windows:
    
    ./cleanup
    