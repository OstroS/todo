class AddCounterCacheToPriorities < ActiveRecord::Migration
  def self.up
    add_column :priorities, :counter, :integer, { :default => 0 }    

    Priority.all.each{|p| p.counter = p.tasks.count; p.save}
    #nie będę iterował dwa razy po jednej kolekcji, nie będe iterował dwa razy.... 
  
  end

  def self.down
    remove_column :priorities, :counter
  end
end
