class AddPayloadToBounce < ActiveRecord::Migration[5.0]
  def change
    add_column :bounces, :payload, :json
  end
end
