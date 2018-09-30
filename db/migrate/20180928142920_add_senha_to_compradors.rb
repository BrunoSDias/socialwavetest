class AddSenhaToCompradors < ActiveRecord::Migration[5.1]
  def change
    add_column :compradors, :senha, :string
  end
end
