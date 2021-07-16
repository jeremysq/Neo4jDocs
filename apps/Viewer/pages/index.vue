<template>
  <v-row
    justify="center"
    align="center"
    class="my-4"
  >
    <v-card
      class="logo d-flex justify-center"
    >
      <v-col>
        <v-row>
          <v-card-title>
            Visualizing Neo4j
          </v-card-title>
        </v-row>
        <v-row
          class="my-n6"
        >
          <v-col>
            <v-textarea
              v-model="query"
              label="Query Editor"
              outlined
              rows="2"
            />
          </v-col>
        </v-row>
        <v-row
          class="mt-n2"
        >
          <v-col
            cols="8"
          >
            <QueryMenu
              :viz="viz"
              :query="query"
              @addKeyword="changeQuery($event)"
            />
          </v-col>
          <v-col
            v-if="!isInitialize"
          >
            <v-row
              class="mx-1"
            >
              <v-col>
                <v-text-field
                  v-model="serverUser"
                  label="Server Username"
                  outlined
                />
              </v-col>
              <v-col>
                <v-text-field
                  v-model="serverPassword"
                  label="Server Password"
                  class="ml-2"
                  outlined
                />
              </v-col>
            </v-row>
            <v-row
              class="mt-n6 mx-4"
            >
              <v-text-field
                v-model="serverURL"
                label="Neo4j Server URL"
                outlined
              />
            </v-row>
            <v-row
              align="center"
              justify="center"
              class="mt-n6 mb-5"
            >
              <v-btn
                class="primary"
                @click="draw()"
              >
                Connect
              </v-btn>
            </v-row>
          </v-col>
          <v-col
            v-if="isInitialize"
          >
            <Controls
              :viz="viz"
              :query="query"
            />
          </v-col>
        </v-row>
        <v-row>
          <Viewer />
        </v-row>
      </v-col>
    </v-card>
  </v-row>
</template>

<script>
import { mapState } from 'vuex'
import * as NeoVis from '../node_modules/neovis.js'
import Viewer from '~/components/Viewer.vue'
import QueryMenu from '~/components/QueryMenu.vue'
import Controls from '~/components/Controls.vue'
export default {
  components: {
    QueryMenu,
    Viewer,
    Controls
  },
  data () {
    return {
      serverURL: 'bolt://localhost:7687',
      serverUser: 'neo4j',
      serverPassword: 'admin',
      query: 'MATCH (n)-[r:INTERACTS]->(m) RETURN * LIMIT 1',
      config: null,
      viz: null
    }
  },
  computed: {
    ...mapState({
      isInitialize: state => state.isInitialize
    })
  },
  methods: {
    draw () {
      this.config = {
        container_id: 'viz',
        server_url: this.serverURL,
        server_user: this.serverUser,
        server_password: this.serverPassword,
        labels: {
          Character: {
            caption: 'name',
            size: 'pagerank',
            community: 'community',
            title_properties: [
              'name',
              'pagerank'
            ]
          }
        },
        relationships: {
          INTERACTS: {
            thickness: 'weight',
            caption: false
          }
        },
        initial_cypher: this.query
      }

      // eslint-disable-next-line new-cap
      this.viz = new NeoVis.default(this.config)
      this.viz.registerOnEvent('error', err => this.neoError(err))
      this.viz.render()
      this.$store.dispatch('updateInitialize', true)
      this.$store.dispatch('updateQueryError', null)
    },
    changeQuery (string) {
      this.query = this.query + string
    },
    neoError (err) {
      console.log(err.error_msg)
      this.$store.dispatch('updateInitialize', false)
      this.$store.dispatch('updateQueryError', err.error_msg.toString())
    }
  }
}
</script>
