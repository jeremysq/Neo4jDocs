MATCH (j:Person {name: 'Jennifer'})-[r:IS_FRIENDS_WITH]->(m:Person {name: 'Mark'})
// To delete relationship:
DELETE r
// To delete the node:
// DELETE j