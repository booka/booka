class CreateBoks < ActiveRecord::Migration
  def self.up
    create_table :boks do |t|
      t.references :project
      t.references :user
      t.integer :position
      t.string :type
      t.string :ancestry

      t.string :title
      t.string :description
      #t.string :bok_type
      t.string :content_type
      t.string :properties, :length => 4096
      t.text :body

      t.timestamps
    end

    add_index :boks, :type
    add_index :boks, :title
    add_index :boks, :ancestry

  end

  def self.down
    drop_table :boks
  end
end
