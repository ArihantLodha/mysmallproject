class CreateArihants < ActiveRecord::Migration
  def change
    create_table :arihants do |t|
      t.string :Name
      t.string :Division
      t.date :Created

      t.timestamps null: false
    end
  end
end
