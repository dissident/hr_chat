class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :room, index: true
      t.belongs_to :owner, index: true

      t.timestamps
    end
  end
end
