class Blockchain

	def initialize       # 이건 알아서 자동으로 돌아감 스펠링 틀리면 안됨
		@number_of_blocks=1
	end

	def mining
		@number_of_blocks = @number_of_blocks +1

		history =[]

		begin        #반복문
			nonce = rand(100)  #랜덤숫자 1~100
			history << nonce   #history에 nonce를 밀어 넣는다
		end while nonce != 0   #10으로 나눴을때 나머지 가 0이랑 같은경우까지
		history
	end

	def my_blocks
		@number_of_blocks
	end


end
