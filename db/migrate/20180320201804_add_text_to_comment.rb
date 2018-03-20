class AddTextToComment < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.text :content
    end
  end
end
