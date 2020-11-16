class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  def initialize(head = nil)
    @head = head
  end

  #returns first node
  def head
    @head
  end

  #retrns last node
  def tail
    return nil if @head == nil

    current_node = @head

    until current_node.next == nil
      current_node = current_node.next
    end

    current_node
  end

  #returns total nimber of nodes
  def size
    return 0 if @head == nil

    current_node = @head
    index = 1

    until current_node.next == nil
      current_node = current_node.next
      index += 1
    end

    index
  end

  #adds node to end of list
  def append(node)
    if @head == nil
      @head = node
    else
      self.tail.next = node
    end
  end

  #adds node to beginning of list
  def prepend(node)
    if @head == nil
      @head = node
    else
      old_head = @head
      @head = node
      @head.next = old_head
    end
  end

  #returns node at given index
  def at(index)
    return "Out of Range" if index >= size

    current_node = @head
    current_index = 0

    until current_index == index
      current_node = current_node.next
      current_index += 1
    end
    current_node
  end

  #removes last node from list and returns it
  def pop
    popped = nil
    return nil if @head == nil

    if @head.next == nil
      popped = self.head
      @head = nil
      return popped
    end

    current_node = @head

    until current_node.next.next == nil
      current_node = current_node.next
    end
    popped = current_node.next
    current_node.next = nil
    popped
  end

  #returns true if value is present in any node in list
  def contains?(value)
    return false if @head == nil
    current_node = @head
    return true if current_node.value == value

    until current_node.next == nil
      current_node = current_node.next
      return true if current_node.value == value
    end
    false
  end

  #returns index of first instance of given value if present
  def find(value)
    return nil if @head == nil

    current_node = @head
    index = 0
    return index if current_node.value == value

    until current_node.next == nil
      current_node = current_node.next
      index += 1
      return index if current_node.value == value
    end
    return nil
  end

  #returns string representation of list
  def to_s
    return "nil" if @head == nil
    s = ""

    current_node = @head
    s += "( #{current_node.value} ) -> "

    until current_node.next == nil
      current_node = current_node.next
      s += "( #{current_node.value} ) -> "
    end
    s += "nil"
  end

  #inserts new node with given value at given index in list
  def insert_at(value, index)
    if index == 0
      prepend(Node.new(value))
    elsif self.size == 0 or index - 1 > self.size
      return "Out of Range"
    else
      current_node = @head
      current_index = 0

      until current_node == nil
        if current_index == index - 1
          old_next = current_node.next
          new_node = Node.new(value, old_next)
          current_node.next = new_node
          break
        end
        current_node = current_node.next
        current_index += 1
      end
    end
  end

  #removes node at given index in list
  def remove_at(index)
    if self.size == 0 or index >= self.size
      return "Out of Range"
    elsif index == 0
      @head = @head.next
    else
      current_node = @head
      current_index = 0

      until current_node == nil
        if current_index == index - 1
          current_node.next = current_node.next.next
          break
        end
        current_node = current_node.next
        current_index += 1
      end
    end
  end
end
