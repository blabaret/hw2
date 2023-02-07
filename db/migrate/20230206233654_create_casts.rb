class CreateCasts < ActiveRecord::Migration[7.0]
  def change
    create_table :casts do |t|

      t.integer "role_id"
      t.integer "movie_id"
      t.string "actor"

      t.timestamps
    end
  end
end