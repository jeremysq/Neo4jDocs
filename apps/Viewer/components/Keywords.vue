<template>
  <v-col
    cols="10"
  >
    <v-row>
      <v-col
        v-for="keyword in keywords"
        :key="keyword.name"
        class="mx-n2 my-n2"
      >
        <v-btn
          small
          outlined
          @click="addKeyword(keyword.value)"
        >
          {{ keyword.name }}
        </v-btn>
      </v-col>
    </v-row>
  </v-col>
</template>

<script>
export default {
  data () {
    return {
      keywords: [
        { name: 'Match', value: 'MATCH' },
        { name: 'Create', value: 'CREATE' },
        { name: 'Set', value: 'SET' },
        { name: 'Delete', value: 'DELETE' },
        { name: 'Remove', value: 'REMOVE' },
        { name: 'Merge', value: 'MERGE' },
        { name: 'Where', value: 'WHERE' },
        { name: 'And', value: 'AND' },
        { name: 'Or', value: 'OR' },
        { name: 'Not', value: 'NOT' },
        { name: 'In', value: 'IN' },
        { name: 'As', value: 'AS' },
        { name: 'Return', value: 'RETURN' },
        { name: 'Limit', value: 'LIMIT' },
        { name: 'Unwind', value: 'UNWIND' },
        { name: 'Distinct', value: 'DISTINCT' },
        { name: 'Starts With', value: 'STARTS WITH' },
        { name: 'Detach Delete', value: 'DETACH DELETE' },
        { name: 'Order By', value: 'ORDER BY' },
        { name: 'Load CSV', value: 'LOAD CSV FROM' },
        { name: 'Load CSV with Headers', value: 'LOAD CSV WITH HEADERS FROM' }
      ]
    }
  },
  methods: {
    addKeyword (string) {
      // console.log(string)
      this.$emit('addKeyword', string)
    }
  }
}
</script>
