class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: "draft"
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false

      t.timestamps
    end
  end
end
