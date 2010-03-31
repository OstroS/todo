class AddRgbColorToPriority < ActiveRecord::Migration
  def self.up
    add_column :priorities, :color, :text
  end

  def self.down
    remove_column :priorities, :color
  end
end
