
// Example syntax:
// CALL gds.graph.create(
//     graphName: String,
//     nodeProjection: String, List or Map,
//     relationshipProjection: String, List or Map,
//     configuration: Map (Optional)
// )

// Example
CALL gds.graph.create(
    'my-native-graph',
    'Person',
    'LIKES'
)
YIELD graphName, nodeCount, relationshipCount, createMillis;