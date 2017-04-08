class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.date :date
      t.string :photo

      t.timestamps null: false
    end
  end
end
