class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :game, index: true
      t.string :word
      t.integer :owner
      t.boolean :revealed
 
      t.timestamps
    end
  end
end
