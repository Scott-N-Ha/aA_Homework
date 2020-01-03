class Queue
    def initialize
        @queue = []
    end

    def push(el)
        @queue.push(el)
    end

    def <<(el)
        @queue.push(el)
    end

    def pop(el)
        @queue.shift
    end

    def peek
        @queue[0]
    end
end