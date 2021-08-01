// Example syntax
// CALL gds.graph.deleteRelationships(
//     graphName: String, 
//     relationshipType: String
// )
// YIELD graphName, relationshipType, deletedRelationships, deletedProperties

// Example
CALL gds.graph.deleteRelationships('my-graph', 'T')
YIELD graphName, relationshipType, deletedRelationships, deletedProperties