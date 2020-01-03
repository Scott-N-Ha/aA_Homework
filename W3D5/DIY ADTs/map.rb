class Map
    def initialize
        @map = []
    end

    def set(key, value)
        found = false

        @map.each do |tuple|
            if tuple[0] == key
                tuple[1] = value
                found = true
            end
        end

        if !found
            @map.push([key, value])
        end

        true
    end
    
    def get(key)
        @map.each do |tuple|
            if tuple[0] == key
                return tuple[1]
            end
        end

        nil
    end

    def delete(key)
        found = false
        index = nil

        @map.each_with_index do |tuple, idx|
            if tuple[0] == key
                index = idx
                found = true
                break
            end
        end

        if found
            @map.delete_at(index)
            return true
        else
            return false
        end
    end

    # show
    def show
        @map.each do |tuple|
            puts "[#{tuple[0]},#{tuple[1]}]"
        end
    end
end