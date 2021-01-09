class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :arrival_day

  belongs_to :user
end
