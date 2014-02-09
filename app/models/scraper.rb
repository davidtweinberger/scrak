class Scraper
	def self.scrape
		data = HTTParty.get('http://www.brainyquote.com/quotes/authors/w/winston_churchill.html')
		
		response_body = data.response.body

		doc = Nokogiri::HTML(
			response_body
		)

		quotes = [] #empty list
		doc.css('.bqQuoteLink a').each do |link| #doc.css is an array
			quotes << link.content
		end		

		# element = rand(quotes.count - 1)
		# quotes[element]
		##ghetto ^

		quotes.sample

	end

end