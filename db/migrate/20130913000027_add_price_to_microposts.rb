class AddPriceToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :price, :string
    add_column :microposts, :contact, :string
  end
end
