class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :replieable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
