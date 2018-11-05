class Lady < ApplicationRecord
   validates :name, presence: true, length: { minimum: 2 }
   validates :face, :chest, :abs, :butt, :legs, presence: true 
   validates :face, :chest, :abs, :butt, :legs, numericality: true
   
   belongs_to :user
end
