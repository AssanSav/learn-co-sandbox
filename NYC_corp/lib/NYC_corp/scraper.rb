class NYCCorp::Scraper 

    def self.scrape 
        website = "https://www.indeed.com/cmp?l=New+York%2C+NY"
        page = Nokogiri::HTML(open(website))
        doc = page.css("div.clearfix.cmp-CompanyWidget")
    end

end

