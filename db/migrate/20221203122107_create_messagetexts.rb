class CreateMessagetexts < ActiveRecord::Migration[5.0]
  def change
    create_table :messagetexts do |t|
      t.text :body
      t.integer :user_id
      t.text :send_date
      t.timestamps
    end
  end
end
