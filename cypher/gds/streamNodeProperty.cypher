// Example Syntax
// CALL gds.graph.streamNodeProperties(
//     graphName: String, 
//     nodeProperties: Array
// )

CALL gds.graph.streamNodeProperties('my-graph', ['componentId', 'pageRank', 'communityId'])