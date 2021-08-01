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
        { name: 'Graph Create (Native)', value: 'CALL gds.graph.create()' },
        { name: 'Graph Create Cypher (Cypher)', value: 'CALL gds.graph.create.cypher()' },
        { name: 'Graph List', value: 'CALL gds.graph.list()' },
        { name: 'Graph Exists', value: 'CALL gds.graph.exists()' },
        { name: 'Graph Remove Node Properties', value: 'CALL gds.graph.removeNodeProperties()' },
        { name: 'Graph Delete Relationships', value: 'CALL gds.graph.deleteRelationships()' },
        { name: 'Graph Drop', value: 'CALL gds.graph.drop()' },
        { name: 'Graph Stream Node Property', value: 'CALL gds.graph.streamNodeProperty()' },
        { name: 'Graph Stream Node Properties', value: 'CALLgds.graph.streamNodeProperties()' },
        { name: 'Graph Stream Relationship Property', value: 'CALLgds.graph.streamRelationshipProperty()' },
        { name: 'Graph Stream Relationship Properties', value: 'CALL gds.graph.streamRelationshipProperties()' },
        { name: 'Graph Write Relationship', value: 'CALL gds.graph.writeRelationship()' },
        { name: 'Graph Export', value: 'CALL gds.graph.export()' },
        { name: 'Page Rank (Stream)', value: 'CALL gds.graph.pageRank.stream()' },
        { name: 'Page Rank (Stats)', value: 'CALL gds.graph.pageRank.stats()' },
        { name: 'Page Rank (Mutate)', value: 'CALL gds.graph.pageRank.mutate()' },
        { name: 'Page Rank (Write)', value: 'CALL gds.graph.pageRank.write()' },
        { name: 'Article Rank (Stream)', value: 'CALL gds.graph.articleRank.stream()' },
        { name: 'Article Rank (Stats)', value: 'CALL gds.graph.articleRank.stats()' },
        { name: 'Article Rank (Mutate)', value: 'CALL gds.graph.articleRank.mutate()' },
        { name: 'Article Rank(Write)', value: 'CALL gds.graph.articleRank.write()' },
        { name: 'Eigenvector Centrality (Stream)', value: 'CALL gds.graph.eigenvector.stream()' },
        { name: 'Eigenvector Centrality (Stats)', value: 'CALL gds.graph.eigenvector.stats()' },
        { name: 'Eigenvector Centrality (Mutate)', value: 'CALL gds.graph.eigenvector.mutate()' },
        { name: 'Eigenvector Centrality (Write)', value: 'CALL gds.graph.eigenvector.write()' },
        { name: 'Betweenness Centrality (Stream)', value: 'CALL gds.graph.betweenness.stream()' },
        { name: 'Betweenness Centrality (Stats)', value: 'CALL gds.graph.betweenness.stats()' },
        { name: 'Betweenness Centrality (Mutate)', value: 'CALL gds.graph.betweenness.mutate()' },
        { name: 'Betweenness Centrality (Write)', value: 'CALL gds.graph.betweenness.write()' },
        { name: 'Degree Centrality (Stream)', value: 'CALL gds.graph.degree.stream()' },
        { name: 'Degree Centrality (Stats)', value: 'CALL gds.graph.degree.stats()' },
        { name: 'Degree Centrality (Mutate)', value: 'CALL gds.graph.degree.mutate()' },
        { name: 'Degree Centrality (Write)', value: 'CALL gds.graph.degree.write()' },
        { name: 'Louvain (Stream)', value: 'CALL gds.graph.louvain.stream()' },
        { name: 'Louvain (Stats)', value: 'CALL gds.graph.louvain.stats()' },
        { name: 'Louvain (Mutate)', value: 'CALL gds.graph.louvain.mutate()' },
        { name: 'Louvain (Write)', value: 'CALL gds.graph.louvain.write()' },
        { name: 'Label Propagation (Stream)', value: 'CALL gds.graph.labelPropagation.stream()' },
        { name: 'Label Propagation (Stats)', value: 'CALL gds.graph.labelPropagation.stats()' },
        { name: 'Label Propagation (Mutate)', value: 'CALL gds.graph.labelPropagation.mutate()' },
        { name: 'Label Propagation (Write)', value: 'CALL gds.graph.labelPropagation.write()' },
        { name: 'Weakly Connected Components (Stream)', value: 'CALL gds.graph.wcc.stream()' },
        { name: 'Weakly Connected Components (Stats)', value: 'CALL gds.graph.wcc.stats()' },
        { name: 'Weakly Connected Components (Mutate)', value: 'CALL gds.graph.wcc.mutate()' },
        { name: 'Weakly Connected Components (Write)', value: 'CALL gds.graph.wcc.write()' },
        { name: 'Triangle Count (Stream)', value: 'CALL gds.graph.triangleCount.stream()' },
        { name: 'Triangle Count (Stats)', value: 'CALL gds.graph.triangleCount.stats()' },
        { name: 'Triangle Count (Mutate)', value: 'CALL gds.graph.triangleCount.mutate()' },
        { name: 'Triangle Count (Write)', value: 'CALL gds.graph.triangleCount.write()' },
        { name: 'Local Clustering Coefficient (Stream)', value: 'CALL gds.graph.localClusteringCoefficient.stream()' },
        { name: 'Local Clustering Coefficient (Stats)', value: 'CALL gds.graph.localClusteringCoefficient.stats()' },
        { name: 'Local Clustering Coefficient (Mutate)', value: 'CALL gds.graph.localClusteringCoefficient.mutate()' },
        { name: 'Local Clustering Coefficient (Write)', value: 'CALL gds.graph.localClusteringCoefficient.write()' },
        { name: 'Node Similarity (Stream)', value: 'CALL gds.graph.nodeSimilarity.stream()' },
        { name: 'Node Similarity (Stats)', value: 'CALL gds.graph.nodeSimilarity.stats()' },
        { name: 'Node Similarity (Mutate)', value: 'CALL gds.graph.nodeSimilarity.mutate()' },
        { name: 'Node Similarity (Write)', value: 'CALL gds.graph.nodeSimilarity.write()' }

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
