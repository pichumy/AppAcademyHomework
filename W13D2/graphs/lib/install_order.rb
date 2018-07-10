# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'

def install_order(arr)
  # keeps track of vertexes
  vertexes = []
  # keeps track of package numbers that have been turned into vertexes already
  values = []
  # create vertexes and edges for each package
  max_id = 0
  arr.each do |package|
    max_id = package[0] if package[0] > max_id
    max_id = package[1] if package[1] > max_id
    if values.include?(package[0])
      vertex = vertexes[values.find_index(package[0])]
    else
      vertex = Vertex.new(package[0])
      values.push(package[0])
      vertexes.push(vertex)
    end
    if values.include?(package[1])
      dependency = vertexes[values.find_index(package[1])]
    else
      dependency = Vertex.new(package[1])
      values.push(package[1])
      vertexes.push(dependency)
    end
    Edge.new(dependency, vertex)
  end
  # including package numbers that have no dependencies, are not a dependency for others
  idx = 1
  while idx < max_id
    unless values.include?(idx)
      vertex = Vertex.new(idx)
      vertexes.push(vertex)
    end
    idx += 1
  end
  queue = []
  # populate queue with packages with no dependencies
  vertexes.each do |vert|
    if vert.in_edges.empty?
      queue.push(vert)
    end
  end
  order = []
  until queue.empty?
    # remove from queue
    removed_vertex = queue.shift
    # track order in list
    order.push(removed_vertex.value)
    # remove from vertexes
    vertexes.delete(removed_vertex)
    # remove out edges from graph
    to_destroy = []
    removed_vertex.out_edges.each do |edge|
      neighbor = edge.to_vertex
      to_destroy.push(edge)
      queue.push(neighbor) if neighbor.in_edges.length == 1
    end
    to_destroy.each do |edge|
      edge.destroy!
    end
  end
  if vertexes.empty?
    return order
  else
    return []
  end
end
