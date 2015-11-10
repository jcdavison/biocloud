class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :bio_event_id

      t.timestamps null: false
    end
  end
end
