require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  output = []
  visited = []
  until vertices.empty?
    random_node = vertices[rand(vertices.length)]
    vertices.delete(random_node)
    dfs(random_node, output, visited)
  end
  if output.length == visited.length
    return []
  end 
  output.reverse
end

def dfs(node, output = [], visited = [])
  return output if visited.include?(node)
  return output if output.include?(node)
  return output.push(node) if node.out_edges.empty?
  # if i've already visited, i don't need to do this again.
  visited.push(node)
  node.out_edges.each do |edge|
    dfs(edge.to_vertex, output, visited)
  end
  output.push(node)
end
