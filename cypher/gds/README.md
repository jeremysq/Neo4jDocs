# Graph Data Science Functions

  The following functions are available when the `graph-data-science` plugin is installed. We will NOT consider the `alpha` or `beta` tier functions provided by the `gds` library, as they are considered to not be production ready for mass usage. This directory also contains cypher query examples of the functions used here.

  ## General functions
  Some of these functions relate solely to native or cypher projections. For information on that, look [here](https://github.com/jeremysq/Neo4jDocs/blob/master/docs/algorithms.md).

  1. gds.graph.create - Creates a graph in the catalog using a Native projection.
  2. gds.graph.create.cypher - Creates a graph in the catalog using the Cypher projection.
  3. gds.graph.list - Prints information about graphs currently stored in the catalog
  4. gds.graph.exists - Checks if a graph is stored.
  5. gds.graph.removeNodeProperties - Removes node properteis from the graph.
  6. gds.graph.deleteRelationships - Deletes relationships of a given relationship type from a graph.
  7. gds.graph.drop - Drop a graph from the catalog.
  8. gds.graph.streamNodeProperty - Streams a single relationship property stroed in a graph.
  9. gds.graph.writeNodeProperties - Writes node properties stored in a graph to Neo4j.
  10. gds.graph.writeRelationship - Writes relationships stored in a graph to Neo4j.
  11. gds.graph.export - Exports a graph into a new offline database.

  ## Algorithms

  Explanation of the theory behind the many algorithms brought forth by Neo4j are further outlined [here](https://github.com/jeremysq/Neo4jDocs/blob/master/docs/algorithms.md).

  It is good to note that for functions that use the centrality algorithms, there are several execution modes to consider:
  1. stream - Returns the result of the algorithm as a stream of records.
  2. stats - Returns a single record of summary statistics, but does not write to the database.
  3. mutate - Writes the results of the algorithm to the in-memorgy graph. Returns a single record of summary statistics.
  4. write - Writes the results of the algorithm to the Neo4j database. Returns a single record of the summary statistics.
  
  These are functions of the algorithms that can be initialized in the Cypher syntax. Every algorithm takes in the two following parameters:

  1. graphName - The name of the graph stored in the catalog.
  2. configuration - Mapping for algorithm specifics or graph filtering.
