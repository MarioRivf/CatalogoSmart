# app/models/producto.rb
class Producto < ApplicationRecord
    has_one_attached :foto
end
