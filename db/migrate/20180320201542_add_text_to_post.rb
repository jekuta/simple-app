class AddTextToPost < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.string :title
      t.text :content
    end
  end
end
