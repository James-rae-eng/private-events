class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :title
      t.datetime :date
      t.text :location

      t.timestamps
    end
  end
end
