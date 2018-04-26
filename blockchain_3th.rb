class Blockchain

	def initialize
		@number_of_blocks=1
	end


	def mining
		@number_of_blocks = @number_of_blocks +1
	end

	def my_blocks
		@number_of_blocks
	end


end
