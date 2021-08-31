class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :user
      t.boolean :is_private
      t.timestamps
    end
  end
end
