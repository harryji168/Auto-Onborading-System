class CreateGeos < ActiveRecord::Migration[6.1]
  def change
    create_table :geos do |t|
      t.string :place
      t.string :latlng

      t.timestamps
    end
  end
end
