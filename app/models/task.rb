class Task < ActiveRecord::Base
  belongs_to :priority
  validates_presence_of :title, :message => "Tytuł nie może być pusty!"
  
  accepts_nested_attributes_for :priority
end
