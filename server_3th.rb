require 'sinatra'

require './blockchain_3th'

b= Blockchain.new


get '/' do
	message = ""


	b.current_chain.each do |c|
		message << "번호는 " + c['index'] + "입니다.<br>"
	end
	message << "<hr>"
	message
	#b.current_chain.to_s

#	"지금 전체 블록수는 : " + b.my_blocks.to_s


end

get '/mine' do
	b.mining
	"블록찾았다"
end
