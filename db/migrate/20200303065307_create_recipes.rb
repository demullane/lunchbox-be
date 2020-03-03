class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.belongs_to :user
      t.string :title
      t.string :website
      t.string :source
      t.string :ingredients, array: true
      t.text :directions, array: true
      t.text :notes
      t.integer :servings
      t.integer :prep_time
      t.integer :cook_time
      t.string :tags, array: true
      t.datetime :published_at
  
      t.timestamps
    end
  end
end
