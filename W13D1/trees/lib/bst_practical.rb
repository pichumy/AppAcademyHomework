def kth_largest(tree_node, k)
  array = in_order_traversal(tree_node)
  index = k * - 1
  array[index]
end

def in_order_traversal(tree_node = @root, arr = [])
  return arr if tree_node.nil?
  in_order_traversal(tree_node.left, arr)
  arr.push(tree_node)
  in_order_traversal(tree_node.right, arr)
  arr
end
