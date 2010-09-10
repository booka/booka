class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.references :user
      t.references :project
      t.references :bok
      t.string :action, :length => 16
      t.string :description, :length =>  512
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
