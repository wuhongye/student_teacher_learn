class CreateAddUsersMolds < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mold, :string
  end
end