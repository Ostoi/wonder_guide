class Citytour < ApplicationRecord
  belongs_to :guide, class_name: "User"
end
