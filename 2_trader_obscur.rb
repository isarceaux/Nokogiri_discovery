require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_prices_now

	prices_hash = {}

	url1 = 'https://coinmarketcap.com/all/views/all/'
	page = Nokogiri::HTML(open(url1))

	xpath_currency = '//td[@class="no-wrap currency-name"]/a'
	currencies = page.xpath(xpath_currency)

	xpath_price = '//td/a[@class="price"]'
	prices = page.xpath(xpath_price)

	puts prices[1].text

	i = 0
	currencies.each do |currency|
		prices_hash[":#{currency.text}"]=prices[i].text
		i+=1
	end

	return prices_hash
end

puts get_prices_now()

