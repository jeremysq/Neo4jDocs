<template>
  <v-card
    outlined
  >
    <v-card-title>
      Visual Controls
    </v-card-title>
    <v-row>
      <v-col
        class="mb-4 ml-2"
      >
        <v-btn
          class="ml-2"
          small
          outlined
          @click="Clear()"
        >
          Clear
        </v-btn>
        <v-btn
          class="ml-2"
          small
          outlined
          @click="Freeze()"
        >
          Freeze
        </v-btn>
        <v-btn
          class="ml-2"
          small
          outlined
          @click="Reset()"
        >
          Reset Connection
        </v-btn>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
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
  methods: {
    Clear () {
      this.viz.clearNetwork()
    },
    Freeze () {
      this.viz.stabilize()
    },
    Reset () {
      window.location.reload(true)
    }
  }
}
</script>
