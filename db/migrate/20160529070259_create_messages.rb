class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
