require 'sinatra'

require './blockchain_3th'

b= Blockchain.new


get '/' do
	message = ""


	b.current_chain.each do |c|
		message << "블록의 번호는 " + c['index'].to_s + "입니다.<br>"
		message << "Nonce " + c['nonce'].to_s + "입니다.<br>"
		message << "시간은 " + c['time'].to_s + "입니다.<br>"
		message << "앞 주소는 " + c['previous_block'].to_s + "입니다.<br>"
		message << "내 주소는 " + Digest::SHA256.hexdigest(c.to_s) + "입니다.<br>"
		message << "거래내역은 " + c["transactions"].to_s + "입니다.<br>"
		message << "<hr>"
	end
	
	message
	#b.current_chain.to_s

#	"지금 전체 블록수는 : " + b.my_blocks.to_s


end

get '/mine' do
	b.mining
	"블록찾았다"
end

get '/trans' do
	b.make_a_trans(params["sender"], params["recv"], params["amount"]).to_s
	#params["sender"] + params["recv"] + params["amount"]
	# http://localhost:4567/trans?sender=a&recv=b&amount=1.1
end

get '/new_wallet' do
	b.make_a_new_wallet.to_s
end

get '/all_wallet' do
	b.show_all_wallet
end