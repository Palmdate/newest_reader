class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image
      t.string :author
      t.integer :point
      t.string :time
      t.integer :comments
      t.text :content
      t.string :domain
      t.string :link

      t.timestamps
    end
  end
end
