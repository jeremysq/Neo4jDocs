# Graph algorithms

  Graph algorithms are used to compute metrics for graphs, nodes, and relationships. They are iterative approaches that frequently traverse the graph for computation using a variety of different approaches, such as:

  1. Random walks
  2. Breadth-first searches
  3. Depth-first searches
  4. Pattern matching
  
  Though, as the dataset grows in complexity, the distance to retrieve all data points given by a query increase, resulting in higher computation times. Neo4j provides optimized approaches to executing these algorithms by caching previously explored portions of the tree, and parallezing identifiable areas within queries to optimize execution time. Other graphing databases, such as the upcoming TigerGraph, does a similar approach as this.

  From the records gained during queries, relevancy can be identified between entities through clustering and centralities. Centrality is measured by the number of times a node lies on the shortest path between other nodes.

  ## Centrality Algorithms

  Centrality algorithms are used to determine the importance of distinct nodes in a network.

  ### PageRank

  The PageRank algorithm measures the importance of each node within the graph based on the number of incoming realtionships and the importance of the corresponding source nodes. Introduced in the Google Paper, the function solves the following equation:

  ![PageRank](https://neo4j.com/docs/graph-data-science/current/_images/page-rank-formula.svg)

  where it is assumed that A has pages T<sub>1</sub> to T<sub>n</sub> which point to it, d is the dampening factor usually set to a value of 0.85, and C(A) being the number of links going to page A.
  
  ### Article Rank

  A variant of the PageRank algorithm which lowers the inluence of low-degree nodes by lowering the scores being sent to their neighbors in each iteration. The ArticleRank of a node v at iteration i is defined as:
  
  ![ArticleRank](https://neo4j.com/docs/graph-data-science/current/_images/equations/articleRank.svg)

  where N<sub>in</sub>(v) denotes incoming neighbors and N<sub>out</sub>(v) is outgoing neighors of node v. d, again, is the dampening factor on the interval `[0,1]`, and N<sub>out</sub> is the average out-degree.


  ### Eigenvector Centrality

  Relationships that originate from high scoring nodes contributew more to the score of a node than connections from low scoring nodes. With this in mind, a high eigenvector score means that a node is connected to many nodes who have a high score. This algorithm computes the eigenvector associate with the largest absolute eigenvalue by using the power iteration approach, which states:

  ![EigenvectorCentrality](https://wikimedia.org/api/rest_v1/media/math/render/svg/7ab761758aad089bd615f356e66d7b28c71b677e)
  where at every iteration, the centrality score for each node, b<sub>k</sub> is derived from the scores of its incoming neighbors represented by the matrix A and the previous node in the sequence. In doing so, the transitive influence of the nodes can be measured.

  ### Betweenness Centrality
  
  This algorithm provides a way to the detect the amount of influence a node has over the flow of information within a graph. It is used to find nodes that serve as a bridge from one part of a graph to another by calculating the unweighted shortest paths that pass through the node. This implementation requires O(n+m) space and runs in O(n*m) time, where n is the number of nodes and m is the number of relationships in the graph. Nodes are selected randomly based on their probabiility proportional to their degree, with the idea that nodes of this kind are likely to lie on many short paths in the graphs. Because of this, this algorithm can be very resource-intensive, so deploying this remotely should be supported by a system with high memory.

  ### Degree Centrality

  This algorithm measures the number of relationships from a node depending on the orientation of the projection. 

  ## Community Detection Algorithms

  Community detection algorithms are used to evaluate how groups of nodes are clustered or partitioned, as well as their tendency to strengthen or break apart.

  ### Louvain Algorithm

  This is a hierarchical clustering algorithm that recursively merges communities into a single node. It attempts to detect communities in large networks by maxmizing a modularity score for each community.

  ### Label Propagation Algorithm

  This is a fast algorithm for finding communities in a graph by  propagating labels throughout the network and forming communities based on this process of label propagation. A single label can quickly become dominant in a densely connected group of nodes, and those nodes that end up with the same label when the algorithms finish can be considered part of the same community.

  ### Weakly Connected Components Algorithm

  The WCC algorithm finds sets of connected nodes in an undirected graph, where all nodes in the same set form a connected component, and is used to given an analysis to understand the structure of a graph. It is expected that this algorithm is used at an early phase during graph development, as memory usage scales exponentially as the graph gains complexity. 

  ### Triangle Count Algorithm

  A triangle is a set of three nodes where each node has a relationship to the other two. By counting the number of triangles for each node in the graph, communities can be detected and a measure of the cohesiveness of those communities can be determined.

  ### Local Clustering Coefficient Algorithm

  This computes the local clustering coefficient of each node in the graph. The local clustering coefficient C<sub>n</sub> of a node n describes the likelihood that the neighbours of n are also connected, where we compute C<sub>n</sub> by:

  ![LCC](https://neo4j.com/docs/graph-data-science/current/_images/lcc_formula.svg)
  where d<sub>n</sub> is the degree of the node, and T<sub>n</sub> is the number of triangles of a node yielded by the previous Triangle Count algorithm.

  ## Similarity Algorithms

  Similarity algorithms compute the similarity of pairs of nodes using different vector-based metrics.

  ### Node Similarity

  This algorthim compares each node that has outgoing relationships with each other node by computing the pair-wise similarities baed on the Jaccard metric:

  ![Jaccard](https://neo4j.com/docs/graph-data-science/current/_images/jaccard.png)
  The input of this algorithm is a connected graph containing two disjoint node sets, where each relationship starts from a node in the first node set and ends at a node in the second node set.

  ## Path finding algorithms

  Path finding algorithms find the shortest path between two or more nodes or evaluate the availability and quality of paths.

  ## Link prediction algorithms

  Link prediction algorithms help determine the closeness of a pair of nodes. The computed scores can then be used to predict new relationships between them.