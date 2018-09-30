class Pedido < ApplicationRecord
  belongs_to :comprador, class_name: "Comprador"
  belongs_to :ingresso, class_name: "Ingresso"  
end
