class Task < ActiveRecord::Base
  validates_presence_of :title, :message => "Tytuł nie może być pusty!"
end
