FROM neo4j:4.1.10-enterprise

ENV NEO4J_AUTH=none
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT='yes'
ENV NEO4JLABS_PLUGINS='["graph-data-science", "apoc"]'
ENV NEO4J_apoc_import_file_enabled=true
ENV NEO4J_apoc_export_file_enabled=true
ENV NEO4J_dbms_security_allow__csv__import__from__file__urls=true
ENV NEO4J_apoc_initializer_cypher="CALL apoc.cypher.runFile('file:///startup.cypher')"

COPY ./data /var/lib/neo4j/data
COPY ./import /var/lib/neo4j/import
COPY ./startup.cypher /var/lib/neo4j/import