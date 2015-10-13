class CreateBioEvents < ActiveRecord::Migration
  def change
    create_table :bio_events do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
