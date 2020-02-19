require 'test_helper'

class ArticlesHelperTest < ActionView::TestCase
  include ArticlesHelper

  test 'total record of database' do
    size = 0
    (1..7).each do |index|     
      article = collect_data_page('https://news.ycombinator.com/best?p=' + index.to_s)
      size += article.size
      
    end
    assert_equal( 210, size, 'Total record unexpected' )
  end
  
  test 'list all link can not get the image' do
    (1..7).each do |index|     
      article = collect_data_page('https://news.ycombinator.com/best?p=' + index.to_s)
      article.each do |infor|
        assert_not_equal( [], infor[:image], 'No failure in link get image' )
        
      end
    end
  end

  test 'check link get by use gem ruby-readability success' do
    (1..7).each do |index|     
      article = collect_data_page('https://news.ycombinator.com/best?p=' + index.to_s)
      article.each do |infor|
        link_class = Readability::Document == Readability::Document.new(open(infor[:link]).read, :tags => %w[div p img a], :attributes => %w[src href]).class
        assert_equal( Readability::Document, link_class, 'All link worked' )
        
      end
    end
  end

end
