// Example syntax
// CALL gds.graph.create.cypher(
//     graphName: String,
//     nodeQuery: String,
//     relationshipQuery: String,
//     configuration: Map
// )

// Example
CALL gds.graph.create.cypher(
  'social-graph',
  'MATCH (n) RETURN id(n) AS id, labels(n) AS labels, coalesce(n.age, 0) AS age',
  'MATCH (n)-[r]->(m) RETURN id(n) AS source, id(m) AS target, r.since AS since, type(r) AS type'
)
YIELD graphName, nodeCount, relationshipCount, createMillis;