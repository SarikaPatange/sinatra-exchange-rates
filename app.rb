require "sinatra"
require "sinatra/reloader"
require "json"
require 'http'
symbols_url = "https://api.exchangerate.host/symbols"
response_symbols = HTTP.get(symbols_url)
response_symbols_hash = JSON.parse(response_symbols)
@all_symbols = response_symbols_hash.fetch("symbols")
@all_symbols.delete("BOB")

get("/") do
  @all_symbols = response_symbols_hash.fetch("symbols")
  erb(:home)
end

get("/:symbol") do
  @all_symbols = response_symbols_hash.fetch("symbols")
  erb(:currencytoconvert)
end

get("/:symbol/:symbol2") do
  @all_symbols = response_symbols_hash.fetch("symbols")
  erb(:convert)
end
