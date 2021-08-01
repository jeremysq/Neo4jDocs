// Syntax of graph list
// Only parameter required is the graphName, but many things can be returned to the user.

CALL gds.graph.list(
  graphName: String?
) YIELD
  graphName,
  database,
  nodeProjection,
  relationshipProjection,
  nodeQuery,
  relationshipQuery,
  nodeFilter,
  relationshipFilter,
  nodeCount,
  relationshipCount,
  schema,
  degreeDistribution,
  density,
  creationTime,
  modificationTime,
  sizeInBytes,
  memoryUsage;