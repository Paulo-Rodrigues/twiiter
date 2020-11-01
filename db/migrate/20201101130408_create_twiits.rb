class CreateTwiits < ActiveRecord::Migration[6.0]
  def change
    create_table :twiits do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
