require 'open-uri'
require 'json'

def call
  bit_hound = open('http://api.bitcoincharts.com/v1/markets.json')
  response_status = bit_hound.status
  response_body = bit_hound.read
  @parsed_body = JSON.parse(response_body)
end
  
def find
  @parsed_body.detect {|market| market["symbol"] == "okcoinCNY"}
end

call
@okcoinCNY = find

def display
  puts "okcoinCNY latest_trade = "+ @okcoinCNY.fetch("latest_trade").to_s
  puts "okcoinCNY close = " + @okcoinCNY.fetch("close").to_s
end

display



