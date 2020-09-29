class QuoteController < ApplicationController
  def new
  end

  def new_quote
    @category = params[:category]

    require 'open-uri'

    document = Nokogiri::HTML.parse(open("https://www.goodreads.com/quotes/tag/#{@category}"))

    document.css('script').remove

    last_page_num = document.xpath('//div/div/div/div/div/div/div/a')[-2].text.to_i

    rand_page = Nokogiri::HTML.parse(open("https://www.goodreads.com/quotes/tag/#{@category}?page=#{rand(last_page_num)}"))

    rand_page.css('script').remove

    quotes = rand_page.css("div[class=quoteText]")

    @one_quote = quotes[rand(quotes.length)]

  end
end

# def new_quote
#   @category = params[:category]
#   require 'open-uri'
#   document = Nokogiri::HTML.parse(open("https://www.goodreads.com/quotes/tag/#{@category}?page=#{rand(1)}"))

#   document.css('script').remove


#   quotes = document.css("div[class=quoteText]")

#   @one_quote = quotes[rand(quotes.length)]
#   puts @category
# end