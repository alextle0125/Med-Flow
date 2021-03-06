class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body

      t.belongs_to :user
      t.belongs_to :topic

      t.timestamps
    end
  end
end
