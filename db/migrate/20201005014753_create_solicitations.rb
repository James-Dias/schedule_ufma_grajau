class CreateSolicitations < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitations do |t|
      t.references :schedule, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
