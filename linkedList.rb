class Node
  attr_accessor :data, :next
  
  def initialize(string)
    @data = string
  end
end

class LinkedList
  attr_accessor :head

  def initialize(string)
    @head = Node.new(string)
  end


  def insert(string, currentNode = @head)
    if currentNode.next
      insert(string, currentNode.next)
    else
      currentNode.next = Node.new(string)
    end
  end
  
  def count(currentNode = @head)
#    if currentNode.next
#      1 + count(currentNode.next)
#    else
#      1
#    end

    currentNode.next ? 1 + count(currentNode.next) : 1
  end

  def update(node_data, new_node_data)
    find(node_data).data = new_node_data
  end

  def delete(node_data)
    if find(node_data).next
     find_parent(node_data).next = find(node_data).next 
    else
      find_parent(node_data).next = nil
    end
  end

  def find_parent(string, currentNode = @head)
    if @head.data == string
      nil
    else
      if currentNode.next
        if currentNode.next.data == string
          currentNode
        else
          find_parent(string, currentNode.next)
        end
      end
    end
  end

  def find(string, currentNode = @head)
    if currentNode.data == string
      currentNode
    else
      find(string, currentNode.next) if currentNode.next
    end
  end
end




if __FILE__ == $0
  list = LinkedList.new("head node")
  puts "The head node is: #{list.head.data}"

  list.insert("first node")
  puts "The first node is: #{list.head.next.data}"

  puts "The total amount of nodes is: #{list.count}"

  node = list.find("first node")
  puts "trying to find 'first node'"
  puts "the node we found was: #{node.data}"

  puts "head node is this: #{list.head.data}"
  list.update("head node", "new head node")
  puts "head node is now: #{list.head.data}"

  puts "trying to find the parent of the first node"
  node = list.find_parent("first node")
  puts "the parent is: #{node.data}"

  puts "adding second node"
  list.insert("second node")
  puts "the first node is: #{list.head.next.data}"
  list.delete('first node')
  puts "the first node after deleting 'first node' is: #{list.head.next.data}"
end
