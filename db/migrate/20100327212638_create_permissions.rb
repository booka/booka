class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.references :bok
      t.references :user
      t.string :level, :lenght => 8
      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
