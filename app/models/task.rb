class Task < ActiveRecord::Base
  belongs_to :priority
  validates_presence_of :title, :message => "Tytuł nie może być pusty!"
  validates_length_of :title, :minimum => 5, :message => "Długość tytułu musi być większa niż 5"
  #validates_presence_of :description
  
  accepts_nested_attributes_for :priority
end
