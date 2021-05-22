# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  description     :text
#  description     :text
#  discount        :decimal(, )
#  name            :string
#  package         :string
#  price           :integer          default(0)
#  sku             :string
#  unit            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :integer          not null
#
# Indexes
#
#  index_products_on_manufacturer_id  (manufacturer_id)
#
# Foreign Keys
#
#  manufacturer_id  (manufacturer_id => manufacturers.id)
#
class Product < ApplicationRecord
  belongs_to :manufacturer
  has_one_attached :image
  translates :description
  globalize_accessors locale: I18n.available_locales, attributes: [:description]

  def thumbnail
    if !image.nil? && image.attached? 
      return url_for(image)
    end
  end
end
