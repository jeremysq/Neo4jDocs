//Count on the Person nodes (does not include null values)
MATCH (p:Person)
RETURN count(p.twitter)

//Count on the Person nodes
MATCH (p:Person)
RETURN count(*)