// Example Syntax
// CALL gds.graph.streamRelationshipProperties(
//     graphName: String, 
//     relationshipProperties: Array
// )

// Example
CALL gds.graph.streamRelationshipProperties('my-graph', ['similarityScore', 'weight'])
