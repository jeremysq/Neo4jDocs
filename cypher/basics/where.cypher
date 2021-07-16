//query using equality check in the MATCH clause
MATCH (j:Person {name: 'Jennifer'})
RETURN j

//query using equality check in the WHERE clause
MATCH (j:Person)
WHERE j.name = 'Jennifer'
RETURN j