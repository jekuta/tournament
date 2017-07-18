class AddStateAndUidToCompetition < ActiveRecord::Migration[5.1]
  def up
    add_column :competitions, :state, :integer
    change_column :competitions, :state, :integer, null: false

    add_column :competitions, :uid, :string
    change_column :competitions, :uid, :string, null: false
  end

  def down
    remove_column :competitions, :state
    remove_column :competitions, :uid
  end
end
