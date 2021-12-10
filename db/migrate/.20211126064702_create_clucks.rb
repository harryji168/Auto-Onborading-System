class CreateClucks < ActiveRecord::Migration[6.1]
  def change
    create_table :clucks do |t|

      t.timestamps
    end
  end
end
