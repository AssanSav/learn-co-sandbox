class  NYCCorp::Company 
    attr_accessor :name, :domaine, :rating, :summary, :link

    def self.all 
        @@all ||= self.create
    end
    
    
    def self.create
        NYCCorp::Scraper.scrape.collect do |doc|
        company = self.new
        company.name = doc.css("a.cmp-CompanyWidget-name").text.split(" ")[0..2].join(" ").gsub("JPMorgan", " ").strip
        company.domaine = doc.css("div.cmp-CompanyWidget-industry").text.scan(/[A-Z][a-z]+/)[0..1].join(" ").strip
        company.rating = doc.css("div.icl-Ratings-rating").text.split("").join(" ").delete(' ').strip
        company.summary = doc.css("div.cmp-CompanyWidget-description").text.strip.split(".")[0]
        company.link = doc.css("div.cmp-CompanyWidget-links a").attr('href').value.strip
        company
        end
    end 

end

