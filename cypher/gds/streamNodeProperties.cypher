// Example Syntax
// CALL gds.graph.writeNodeProperties(
//   graphName: String,
//   nodeProperties: List<String>,
//   nodeLabels: List<String>,
//   configuration: Map
// ) YIELD
//   graphName: String,
//   nodeProperties: List<String>,
//   writeMillis: Integer,
//   propertiesWritten: Integer

// Example

CALL gds.graph.writeNodeProperties(
  'my-graph',
  ['componentId', 'pageRank', 'communityId'],
  ['*'],
  {writeConcurrency: 8}
)