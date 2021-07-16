# Usage

 This section involves the basic overview of the approaches to take into consideration when developing in Neo4j's Graph Database Library. To install the Graph Database Library, the best way to do so in the Neo4j interactive environment is through the **Plugins** section in the Neo4j Browser:
 ![GDSL Install From Neo4j Browser](docs/../images/gdsl_install_browser.png)
 
 For additional functionality, it is also advised to install the APOC (Awesome Procedures on Cypher) module to allow for additional query functionality with files on startup of a Neo4j instance.
 
 If running within a **Docker** instance, you can add the following environment variable to your Docker instance by adding the following environment variable to either the <code>build</code>, or <code>run</code> step:

    NEO4JLABS_PLUGINS='["graph-data-science", "apoc"]'

 These changes have already been implemented during the <code>build</code> process of the Docker server provided in this repository.

## Phases
  
  Similar to web application development, there are production and development phases when using Neo4j's Graph Database Library. During the development phase, graph projections and algorithms are determined, which are then stored in memory. In the production phase, Neo4j is configured to run these algorithms developed from the building phase. From the Neo4j documentation, the following graphic gives a general overview:

  ![Projected Graph Model](https://neo4j.com/docs/graph-data-science/current/_images/projected-graph-model.png)

## Projections

  When algorithms are run, it is actually using a projection of the graph data model instantiated by Neo4j. A projection can be seen as an overview of the stored graph, which only contains the most relevant, topological, and property information. These projections are stored entirely in memory, which are helped by compressed data structures optimized for topology and propertly lookup operations.
  Projections are managed by a **graph catalog**, which is a concept maintained by Neo4j that ties projections by name. Once an instance of Neo4j is terminated, the graph catalog is also deleted, meaning that they must be re-created once the instance is taken down.
  There are two projections provided by Neo4j:
  1. Native Projection
  2. Cypher Projection

  Further details will be explained here (Work In Progress)

## Memory
  
  Most of the memory allocation will be related to the in-memory graph model, which stores the projections previously mentioned. The graph model contains three types of data:
  1. Node IDs
  2. Relationships
  3. Weights

  Weights are an array-like data structure stored as doubles. Estimating memory can be done to ensure that certain algorithms by using the <code>.estimate</code> function when conducting a Cypher query that supports this mode. Examples of these Cypher queries can be found [here](https://github.com/jeremysq/Neo4jDocs/tree/master/cypher/memory).
