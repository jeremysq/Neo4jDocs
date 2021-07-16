FROM neo4j:4.1.10-enterprise

ENV NEO4J_AUTH=none
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT='yes'
ENV NEO4JLABS_PLUGINS='["graph-data-science"]'
ENV NEO4J_dbms_security_allow__csv__import__from__file__urls=true

COPY ./data /var/lib/neo4j/data
COPY ./import /var/lib/neo4j/import