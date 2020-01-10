class DDR
    def initialize
        @tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
        @tiles_dts = {
           "up" => 0,
           "right-up" => 1,
           "right" => 2,
           "right-down" => 3,
           "down" => 4,
           "left-down" => 5,
           "left" => 6,
           "left-up" => 7
        }
    end

    def slow_dance(direction)
        @tiles_array.each_with_index { |step, idx| return idx if direction == step }
    end

    def fast_dance(direction)
        @tiles_dts[direction]
    end
end

ddr = DDR.new

p ddr.slow_dance("up")
p ddr.slow_dance("right-down")

p ddr.fast_dance("up")
p ddr.fast_dance("right-down")