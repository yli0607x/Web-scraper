require 'open-uri'
require 'pry'
require 'mail'

class Scraper

    options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => '********',
            :password             => '********',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

    def get_html
        source = open('https://www.hermes.com/us/en/bags-and-small-leather-goods/womens-bags-and-clutches').read
    end 
   
    scraper = Scraper.new
    html = scraper.get_html

    if html.include?("Picotin")
        Mail.defaults do
            delivery_method :smtp, options
          end
          
          Mail.deliver do
                 to '********@gmail.com'
               from '********@gmail.com'
            subject "There is a Picotin!"
               body 'https://www.hermes.com/us/en/bags-and-small-leather-goods/womens-bags-and-clutches'
          end
    else 
        puts "no bag"
    end

end
# require 'httparty'
# require 'nokogiri'
# require 'pry'

# class Scraper

#   attr_accessor :parse_page

#   def initialize
#     doc = HTTParty.get("https://www.hermes.com/us/en/bags-and-small-leather-goods/womens-bags-and-clutches/")
#     @parse_page ||= Nokogiri::HTML(doc) #memoized @parse_page so it only gets assigned once.
#   end

#   def get_total
#     total = parse_page.css(".header-title-current").css(".total").text
#     # binding.pry
#   end

#   def get_names
#     names = item_container.css(".filter-item-infos").map { |name| name.text.split(",")[0] }.compact
#     # binding.pry
#   end

#   private
#   def item_container
#     parse_page.css("#filter-options-line")
#   end

#   scraper = Scraper.new
#   sleep(2)
# #   names = scraper.get_names
#   totals = scraper.get_total
#   puts totals
# #   puts names
# end