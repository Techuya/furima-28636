class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :product_condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :arrival_day
  has_one_attached :image

  belongs_to :user
  # has_one :purchases

  with_options presence: true do
    validates :image
    validates :name,
              length: { maximum: 40 }
    validates :description,
              length: { maximum: 1000 }
    validates :category_id
    validates :product_condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :arrival_day_id
    validates :price,
              format: { with: /\A[0-9]+\z/ },
              numericality: {only_integer: true, greater_than: 300, less_than: 9999999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :arrival_day_id
  end
end
