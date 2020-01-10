class Octopus
    def initialize(arr = [])
        @arr = arr
    end

    def set_fish
        @arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    end

    def [](pos)
        @arr[pos]
    end

    def []=(pos, value)
        @arr[pos] = value
    end

    def back
        @arr.last
    end

    # def length
    #     @arr.length
    # end

    # def take(n)
    #     @arr.take(n)
    # end

    # def drop(n)
    #     @arr.drop(n)
    # end

    def sluggish
        sorted = false

        until sorted
            sorted = true
            for first in (0...@arr.length-1)
                for second in (first+1...@arr.length)
                    if self[first].length > self[second].length
                        sorted = false
                        self[first], self[second] = self[second], self[first]
                    end
                end
            end
        end

        back
    end

    def dominant(arr=@arr)
        return arr if arr.length <= 1

        middle = arr.length / 2
        left = arr.take(middle)
        right = arr.drop(middle)

        merge(dominant(left), dominant(right))
    end

    def clever
        longest = ""

        @arr.each do |word|
            longest = word if word.length > longest.length
        end

        back
    end

    private
    def merge(left, right)
        sorted = []

        until left.empty? || right.empty?
            if left.first.length < right.first.length
                sorted << left.shift
            else
                sorted << right.shift
            end
        end

        sorted + left + right
    end
end

o = Octopus.new

o.set_fish
p o.sluggish

o.set_fish
p o.dominant.last

o.set_fish
p o.clever