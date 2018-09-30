class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.references :comprador, foreign_key: {to_table: :compradors}
      t.references :ingresso, foreign_key: {to_table: :ingressos}
      t.boolean :pago

      t.timestamps

    end
  end
end
