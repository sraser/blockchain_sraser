require 'sinatra'
require 'sinatra/reloader'
require './blockchain_3th'

b= Blockchain.new


get '/' do
	b.mining
end
