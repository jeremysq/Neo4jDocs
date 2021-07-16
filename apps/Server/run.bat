@REM Ensure that Docker is installed.
docker run -i -t --name neo4j -p 7474:7474 -p 7687:7687 -v ./data:/var/lib/neo4j/data -v ./logs:/logs neo4j:latest