require "#{Rails.root}/app/helpers/articles_helper"
include ArticlesHelper
desc "get statictis from a web site"
task pull_data: :environment do
  puts "Start..."
  Article.delete_all
  puts "Updating Article record..."
  iniitialize_record("https://news.ycombinator.com/best")
  puts "End"
end
