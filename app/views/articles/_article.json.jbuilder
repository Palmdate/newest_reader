json.extract! article, :id, :title, :image, :author, :point, :time, :comments, :content, :domain, :link, :created_at, :updated_at
json.url article_url(article, format: :json)
