class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :tags
      t.boolean :censored
      t.attachment :thumbnail
      t.belongs_to :user

      t.timestamps
    end
  end
end
