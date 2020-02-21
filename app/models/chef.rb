class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    dishes.joins(:ingredients).distinct.pluck(:ingredients)
  end
end
