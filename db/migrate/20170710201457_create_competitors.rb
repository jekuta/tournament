class CreateCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :competitors do |t|
      t.column :name, :string, null: false

      t.timestamps
    end
  end
end
