class AddMediaTypeToBounce < ActiveRecord::Migration[5.0]
  def change
    add_column :bounces, :media_type, :string
  end
end
