<template>
  <v-card
    outlined
  >
    <v-card-title>
      Query Menu Controls
    </v-card-title>
    <v-row
      class="mb-2 ml-2"
    >
      <v-col
        cols="9"
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
      <v-col>
        <v-btn
          v-if="isInitialize"
          rounded
          class="primary ml-8"
          @click="Query()"
        >
          Query
        </v-btn>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
import { mapState } from 'vuex'
export default {
  props: {
    viz: {
      type: Object,
      required: true
    },
    query: {
      type: String,
      required: true
    }
  },
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
  computed: {
    ...mapState({
      isInitialize: state => state.isInitialize
    })
  },
  methods: {
    Query () {
      this.viz.renderWithCypher(this.query)
    },
    addKeyword (string) {
      console.log(string)
      this.$emit('addKeyword', string)
    }
  }
}
</script>
