class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text :catch_copy
      t.string :concept
      t.timestamps
      t.integer :user_id
    end
  end
end
