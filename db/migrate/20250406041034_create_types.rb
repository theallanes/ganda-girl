class CreateTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :types do |t|
      t.string :type_name

      t.timestamps
    end
  end
end
