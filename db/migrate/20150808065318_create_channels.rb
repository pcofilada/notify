class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.attachment :logo
      t.string :status
      t.string :title
      t.string :description
      t.string :category
      t.references :owner, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
