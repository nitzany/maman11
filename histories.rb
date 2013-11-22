require 'yahoofinance'
require 'mysql2'

sql_client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => '123456')

YahooFinance::get_HistoricalQuotes_days( 'YHOO', 400) do |hq|
  sql_client.query("INSERT INTO stocks.stocks_history_price VALUES(null, '#{hq.date}', #{hq.close}, 1,#{hq.open})")
end