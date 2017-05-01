class CreateBounces < ActiveRecord::Migration[5.0]
  def change
    create_table :bounces do |t|
      t.integer :user_id
      t.string :cloudinary_id
      t.string :title
      t.timestamps
    end
  end
end
