class AddUserToEvents < ActiveRecord::Migration[7.0]
  def change
    #add_reference :events, :user, null: false, foreign_key: true
    add_reference :events, :creator, index: true
    add_foreign_key :events, :users, column: :creator_id
  end
end
