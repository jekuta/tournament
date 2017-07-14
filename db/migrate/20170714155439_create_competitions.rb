class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|

      t.timestamps
    end
  end
end
