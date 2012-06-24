require 'sinatra'
load 'application.rb'

application = Application.new

get '/hi' do
  application.hello
end

post '/wirb' do
  begin
    (eval params[:command]).to_s
  rescue Exception => e
    e.to_s
  end
end
