
class Node 

    attr_accessor :next_node, :value

    def initialize(value="nil", next_node ="nil")

        @next_node = next_node 
        @value = value 

    end 

    # def value 
    #     puts @value 
    # end 

end 


class LinkedList

    attr_accessor :next_node, :value, :head, :tail, :new_node


    def initialize   
        @head = nil
        @tail = nil
        @length = 0
    end 

   

    def create_node(value, next_node)
        @length += 1 
        Node.new(value, next_node)
    end 

    def append(value)
        
        if @head == nil
            @head = create_node(value, @tail)
        else
                @current_node = @head
                puts @current_node
                until @current_node.next_node == nil
                    @current_node = @current_node.next_node
                end 
                @tail = create_node(value, nil)
                @current_node.next_node = @tail
        end
    end 

    def prepend(value)
        if @head == nil
            @head = create_node(value, @tail)
        else 
            @temp_node = create_node(@head.value, @head.next_node)
            @length -= 1 
            @head = create_node(value, @temp_node)
        end 
    end 

    def value_array
        @array = []

        @current_node = @head
        @array << @head.value
        until @current_node.next_node == nil
            @current_node = @current_node.next_node
            @array << @current_node.value
        end 
        @array
    end 

    def node_array
        @array = []

        @current_node = @head
        @array << @head
        until @current_node.next_node == nil
            @current_node = @current_node.next_node
            @array << @current_node
        end 
        @array
    end 

    def print_array

       value_array()
        @array << nil
        p @array 

    end 

    def size 
        puts @length
    end 

    def head 

        puts @head

    end 

    def tail 
        puts @tail
    end 

    def at(index)
        @index = index
       @array = value_array()
       puts "Index #{@index}: #{@array[index]}"
       
    end 

    def index(index, count=0, current_node=@head)
        # puts "Index:#{index} CN: #{current_node.value}"
        return current_node if index == count 
        index(index, count+1, current_node.next_node)
    end 

    def contains?(number)
        @array = value_array()
        puts @array.include?(number)
    end 

    def find(value)
        @value = value 
        @array = value_array()
        @array.each_with_index do |element, index| 
            if element == value 
                puts "Index #{index}: #{element}"
            end 
        end   
    end 

    def to_s
        @array = node_array()
        p @array
    end 

    def insert_at(value, index)
        @index = index
        @prev_node = index(@index - 1)
        @current_node = Node.new(value, @prev_node.next_node)
        @prev_node.next_node = @current_node
    end 

    def remove_at(index)
        @index = index 
        @current_node = index(@index)
        @prev_node = index(@index - 1)
        @next_node = index(@index + 1)
        @prev_node.next_node = @next_node
        
    end 

end 


linked_list = LinkedList.new()
linked_list.append(5)
linked_list.append(5)
linked_list.prepend(1)
linked_list.print_array
# linked_list.size 
# linked_list.tail
# linked_list.at(2)
# linked_list.contains?(7)
# linked_list.find(5)
# linked_list.to_s
# linked_list.index(1)
linked_list.insert_at(2,1)
linked_list.print_array

linked_list.remove_at(3)
linked_list.print_array

# linked_list.index(2)


