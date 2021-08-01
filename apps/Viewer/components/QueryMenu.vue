<template>
  <v-card
    outlined
  >
    <v-row
      class="mx-2 mt-2"
    >
      <v-col
        class="ml-n5 mt-n5"
      >
        <v-card-title>
          Query Menu Controls
        </v-card-title>
      </v-col>
      <v-col>
        <v-select
          v-model="choice"
          :items="choices"
          label="Query Options"
          outlined
        />
      </v-col>
    </v-row>
    <v-row
      class="mb-2 ml-2"
    >
      <Presets
        v-if="choice == 'Presets'"
        @overwriteQuery="overwriteQuery($event)"
      />
      <Keywords
        v-if="choice == 'Cypher Keywords'"
        @addKeyword="addKeyword($event)"
      />
      <GDSFunctions
        v-if="choice == 'Graph Data Science Functions'"
        @addKeyword="addKeyword($event)"
      />
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
import Keywords from './Keywords.vue'
import Presets from './Presets.vue'
import GDSFunctions from './GDSFunctions.vue'
export default {
  components: {
    Keywords,
    Presets,
    GDSFunctions
  },
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
      choice: 'Presets',
      choices: ['Presets', 'Cypher Keywords', 'Graph Data Science Functions']
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
      // console.log(string)
      this.$emit('addKeyword', string)
    },
    overwriteQuery (string) {
      // console.log(string)
      this.$emit('overwriteQuery', string)
    }
  }
}
</script>
