module ArticlesHelper
  require 'nokogiri'
  require 'open-uri'
  require 'readability'
  require 'fastimage'

  # This method to get list hash of all newest article
  def collect_data_page(url)
    source = Readability::Document.new(open(url).read).prepare_candidates[:elem] 
    hash_list_article = source.css('a.storylink').each_with_object({}) { |n, h| h[n.text.strip] = n['href'] }
    list_information = source.css('td.subtext').map {|infor| infor.content}

    # This list hash has type: [{}, {}]
    hash_list_article.map.with_index do |value, index|
      link = if value[1].include?("item")
               "https://news.ycombinator.com/" + value[1]
             else
               value[1]
             end
      begin
        article = Readability::Document.new(open(link).read, :tags => %w[div p img a], :attributes => %w[src href])
        image = article.images
        
        { title: value[0],
          link: link,
          image: image == [] ? article.images_with_fqdn_uris(link) : image,
          domain: link.split("//")[1].split("/").first, # Sub string to get right type of domain
          content: article.content,
          infor: list_information[index].strip # Remove many spaces
        }
      rescue
        { title: "",
          link: "",
          image: "",
          domain: "",
          content: "",
          infor: "",
        }
      end      
    end
    
  end

  # This method to create record to save in Database
  def iniitialize_record(url)
    (1..7).each do |index|
      list_artical = collect_data_page(url + "?p="+ index.to_s)
      list_artical.each_with_index do |value, index|
        if value[:title] != ""
          Article.create!(title: value[:title],
                          link: value[:link],
                          image: value[:image].first,
                          domain: value[:domain],
                          content: value[:content],
                          author: value[:infor])
        end
      end
    end
  end
  
end
