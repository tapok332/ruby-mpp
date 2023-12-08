class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left, @right = nil, nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_into(@root, value)
  end

  def insert_into(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_into(node.left, value)
    elsif value > node.value
      node.right = insert_into(node.right, value)
    end

    node
  end

  def inorder_traversal(node = @root, &block)
    return if node.nil?

    inorder_traversal(node.left, &block)
    yield node
    inorder_traversal(node.right, &block)
  end
end

# Приклад використання
tree = BinaryTree.new
tree.insert(10)
tree.insert(5)
tree.insert(15)
tree.insert(2)
tree.insert(7)
tree.insert(12)
tree.insert(17)

tree.inorder_traversal do |node|
  puts node.value
end

