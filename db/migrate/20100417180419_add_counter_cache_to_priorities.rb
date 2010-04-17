class AddCounterCacheToPriorities < ActiveRecord::Migration
  def self.up
    add_column :priorities, :counter, :integer, { :default => 0 }    

    tasks = Task.all.each {|t| t.priority.counter += 1}
    tasks.each {|t| t.save }   
  
  end

  def self.down
    remove_column :priorities, :counter
  end
end
