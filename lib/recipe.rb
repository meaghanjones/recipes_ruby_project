class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :ingredient
end
