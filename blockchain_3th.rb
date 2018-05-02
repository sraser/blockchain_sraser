require 'digest'     #특정한 문자열을 소화해서 다른 문자열을 만든다 암호화 한다

class Blockchain

	def initialize       # 이건 알아서 자동으로 돌아감 스펠링 틀리면 안됨
		@chain = []
		@trans = []   
	end

	def make_a_trans(s, r, a)
		s + r + a

		trans = {
			"sender" => s,
			'receiver' => r,
			'amount' => a

		}
		@trans << trans  #계속 쌓아나감
		@trans #출력
	end


	def mining
		

		history =[]



		begin        #반복문
			nonce = rand(10000000)  #랜덤숫자 0~100
			hashed = Digest::SHA256.hexdigest(nonce.to_s)  # 암호화한걸 hashed 에 넣는다
				# Digest 대문자 주의 입력값은 문자

			#history << nonce   #history에 nonce를 밀어 넣는다
		end while hashed[0..3] != '0000' # 0~3자리 수를 뽑는다
		#end while nonce != 0   #%10 10으로 나눴을때 나머지 가 0이랑 같은경우까지
		#history

		block = {     #클라스랑 비슷하지만 해시라는 개념으로 좀더 가벼운 느낌
			# 뭐는 뭐 뭐는 뭐다 의 묶음
			'index' => @chain.length + 1, # 쉼표 주의, 띄어쓰기 주의
			'time' => Time.now.to_i,  # Time.now 해도됨
			'nonce' => nonce,
			'previous_block' => Digest::SHA256.hexdigest(last_block.to_s),
			# 메모리 값이 아닌 그 데이터를 가져오기 위해 JSON.dump 사용
			#last_block.to_s 가 될수도 있음

			"transactions" => @trans  #트렌젝션 박제

		}
		@trans = []   #트렌젝션 리셋
		@chain << block

	end

	def current_chain
		@chain
	end
	def last_block
	
		@chain[-1]   # irb 루비 문법 확인
		# 배열중 가장 마지막 거를 찾는거
	end


end
