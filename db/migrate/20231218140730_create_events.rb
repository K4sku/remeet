class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :status
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
