# Cypher Querying Language

Cypher is Neo4j's graph query language, allowing for users to store and retrieve data from the graph database.
Cypher is open source, but is not available for all graph database toolkits. Though, the methods in which data is queried is similar.
In this directory, scripts for different functions written in Cypher will be provided. Cypher files end in **.cypher**.

#### Property Graph Model

The main components of this model are **nodes** and **relationships**.

**Nodes** are data entities in the graph, and are identified by nouns and objects pertaining to it.
They are denoted by being surrounded by parenthesis. Ex. *(node)*
Nodes can also be given **labels**, which are used to group similar nodes together for easier querying. It is always better to use node labels in queries where possible.

**Relationships** are represented in Cypher using arrows. Ex. *->* or *<-*.
Relationships can be bi-directional represented by two dashes. Ex. *--*
Any type of relationships can be made between nodes, but the recommendation is to use naming conventions fitting to **verbs** and **actions** as descriptors.
Relationships are denoted by: [rel:<name_of_relationship>]

#### Keywords

1. MATCH    - Searches for nodes, relationships, labels, properties, or patterns in the database.
2. RETURN   - Specifies what values to return from a query.
3. CREATE   - Insert nodes, relationships, and patterns into the database.
4. SET      - Add, remove, and update properties.
5. DELETE   - Remove nodes and relationships.
6. DETACH DELETE (node) - Removes node, and removes relationship(s) related to it.
7. REMOVE   - Removes property from the node, and no longer stores it.
8. MERGE    - Ensures that a node exists, and combines existing node data with new data.
9. WHERE    - Clause for filtering queries.
10. AND,OR  - Boolean operators for verifying multiple properties.
11. NOT     - Boolean operator for verifying if checking a property results in False.
12. STARTS WITH - Checks value of property beginning with the string specified.
13. IN          - Checks value of property within array specified.
14. WITH        - Used for specifying variables.
15. UNWIND      - Unwraps a list into its individual values.
16. ORDER BY    - Sorts results based on the value specified.
17. DISTINCT    - Trims duplicate entries.
18. LIMIT       - Based on the number specified, limits the volume returned of a query.
19. LOAD CSV    - Imports a .csv file into the database.
20. LOAD CSV WITH HEADERS   - Imports a .csv file with the headers mapped to the entities.

#### Functions

1. count (\<property>) - Counts the number of occurrences of \<property>.
2. exists(\<property>) - Checks if the given property exists.
3. collect(\<property>) - Aggregates values into a list.

Neo4j comes with an example database for testing upon installation, and the following scripts using the keywords and functions as examples can be found [here]((https://github.com/jeremysq/Neo4jDocs/cypher/basics)).

#### The Bolt protocol
  

  Neo4j uses the Bolt network protocol, which is focused on client-server communication within database applications. Bolt is statement-oriented, meaning that a client can send messages containing statements consisting of:
  1. A single string
  2. A set of parameters
  
  In response, a resultant message and a stream of records pertaining to the previous information given is yielded.

#### Running the Application

  Using Neo4j's Desktop application, a Bolt connection is made on the current computer accessing it throughthe hostname **localhost** on port **7687** by default (**localhost:7687**). In addition to this, a remote interface is provided on **localhost:7474** for HTTP access, and **localhost:7473** for HTTPS. Though this allows users to access nodes and runs queries from the get-go, it exposes the whole system, which may not be ideal.

  In the **/apps** directory, applications that allow for querying this data using different frameworks are provided. For hosting the Neo4j database, Docker containers are used to keep the environments consistent.
