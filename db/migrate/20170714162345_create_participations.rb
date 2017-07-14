class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.belongs_to :competitor, index: true
      t.belongs_to :competition, index: true

      t.timestamps
    end
  end
end
