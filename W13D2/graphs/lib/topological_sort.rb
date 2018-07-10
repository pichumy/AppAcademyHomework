require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  output = []
  # visited does not record leaf nodes unless there's a loop
  visited = []
  until vertices.empty?
    random_node = vertices[rand(vertices.length)]
    vertices.delete(random_node)
    dfs(random_node, output)
  end
  # if loop
  # if output.length == visited.length
  #   return []
  # end
  return [] if output.nil?
  # if not loop
  # visited.each do |node|
  #   p node.value
  # end
  output.reverse
end

def dfs(node, output = [], visited = [])
  return nil if visited.include?(node)
  return output if output.include?(node)
  return output.push(node) if node.out_edges.empty?
  # if i've already visited, i don't need to do this again.
  visited.push(node)
  node.out_edges.each do |edge|
    return nil if dfs(edge.to_vertex, output, visited).nil?
  end
  output.push(node)
end
