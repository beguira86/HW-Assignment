class Coffee

def initialize(coffee)
	@coffee = coffee
	@amount = 3
end


def full?
    @amount == 3

end

def slurp
	@amount -= 1
end

def empty?
	@amount == 0
end



end