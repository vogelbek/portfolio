class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :tldr
      t.text :comment
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
