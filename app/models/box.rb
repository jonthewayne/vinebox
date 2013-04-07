class Box < ActiveRecord::Base
  attr_accessible :background, :bigad, :description, :query, :smallad, :title
  
  #belongs_to  :user
end
