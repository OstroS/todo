class Task < ActiveRecord::Base
  belongs_to :priority
  validates_presence_of :title, :message => "Tytuł nie może być pusty!"
end
