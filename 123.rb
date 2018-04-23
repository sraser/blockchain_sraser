# encoding: UTF-8

require 'sinatra'
require "sinatra/reloader"

get '/' do
	"block"
end

get '/mine' do
	'<h1>you mine a block</h1>'
end
