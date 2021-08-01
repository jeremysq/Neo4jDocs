<template>
  <v-col
    cols="10"
  >
    <v-row>
      <v-col
        v-for="query in queries"
        :key="query.name"
        class="mx-n2 my-n2"
      >
        <v-btn
          small
          outlined
          @click="overwriteQuery(query.value)"
        >
          {{ query.name }}
        </v-btn>
      </v-col>
    </v-row>
  </v-col>
</template>

<script>
export default {
  data () {
    return {
      queries: [
        { name: 'Query One Character Interaction', value: 'MATCH (n)-[r:INTERACTS]->(m) RETURN * LIMIT 1' },
        { name: 'Query Specific Character Interaction', value: 'MATCH (n:Character {name: \'<insert character name here>\'})-[r:INTERACTS]->(m) RETURN *' },
        { name: 'Query All Character Interactions', value: 'MATCH p=(:Character)-[:INTERACTS]->(:Character) RETURN p' },
        { name: 'Create New Character', value: 'CREATE (<insert char alias here>:Character { name: \'<insert name here>\'})' },
        { name: 'Create New interacting Relationship', value: 'CREATE (<insert acting char alias here>-[:INTERACTS]->(<insert receiving character alias here)' },
        { name: 'Create a New Graph of Characters (Not Visual)', value: 'CALL gds.graph.create(\'my-graph\', { Character: { label: \'Character\' } }, \'*\' ) YIELD graphName, nodeCount, relationshipCount;' }
      ]
    }
  },
  methods: {
    overwriteQuery (string) {
      // console.log(string)
      this.$emit('overwriteQuery', string)
    }
  }
}
</script>
