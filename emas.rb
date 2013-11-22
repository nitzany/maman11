require 'mysql2'
require 'signal_tools'

sql_client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => '123456')

# get yhaoo latest 90 days data
stock = SignalTools::Stock.new('YHOO','2013-01-01')

(1..100).each do | index |
	curr_ema = stock.ema(index)
	curr_ema.reverse.each do |ema_val| 
		sql_client.query("INSERT INTO stocks.emas VALUES(null, 1, '2013-01-01', #{index}, #{ema_val})")		
	end
	puts "#{index}, "
end

# symbol_to_id_hash = {
# 	'YHOO' => 1,
# }


# # Set the type of quote we want to retrieve.
# # Available type are:
# #  - YahooFinance::StandardQuote
# #  - YahooFinance::ExtendedQuote
# #  - YahooFinance::RealTimeQuote
# quote_type = YahooFinance::ExtendedQuote

# # Set the symbols for which we want to retrieve quotes.
# # You can include more than one symbol by separating
# # them with a ',' (comma).
# quote_symbols = "yhoo,goog"

# Get the quotes from Yahoo! Finance.  The get_quotes method call
# returns a Hash containing one quote object of type "quote_type" for
# each symbol in "quote_symbols".  If a block is given, it will be
# called with the quote object (as in the example below).
# YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
#     puts "QUOTING: #{qt.symbol}"
#     puts qt.to_s
# end



# YahooFinance::get_HistoricalQuotes_days( 'YHOO', 100) do |hq|
#   #puts "INSERT INTO stocks.stock_history_price VALUES(null, '#{hq.date}', #{hq.close}, #{symbol_to_id_hash[hq.symbol]},#{hq.open})"
#   sql_client.query("INSERT INTO stocks.stocks_history_price VALUES(null, '#{hq.date}', #{hq.close}, #{symbol_to_id_hash[hq.symbol]},#{hq.open})")
#   #puts "YHOO,#{row.join(',')}"
# end



