# Ensure that Docker is installed.
docker run -i -t --name neo4j -p7474:7474 -p7687:7687 -v /data:/data -v /logs:/logs -v /import:/var/lib/neo4j/import neo4j:latest