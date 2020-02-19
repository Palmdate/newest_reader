class PullDataJob < ApplicationJob
  queue_as :default
  include ArticlesHelper
  include Sidekiq::Worker
  
  def perform(url)
    # Do something later
    Article.delete_all
    iniitialize_record(url)
  end
end
