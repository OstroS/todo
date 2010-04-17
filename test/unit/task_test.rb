require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def test_should_respond_to_required_signals
    task = Task.new  
    assert task.respond_to?(:id)
    assert task.respond_to?(:title)
    assert task.respond_to?(:description)
    assert task.respond_to?(:priority)
  end
  
  def test_should_not_save_task_without_title_shorter_than_5_characters
    assert_raise ActiveRecord::RecordInvalid do
      Task.new(:title => "urwi").save!
    end
  end
  
  def test_should_save_task_without_priority
    assert_nothing_raised do
      Task.new (:title => "urwij", :description => "ale urwał!").save!
    end
  end
  
  def test_should_save_task_without_description
    assert_nothing_raised do
      pri = Priority.first
      Task.new(:title => "urwij", :priority => pri).save!
    end
  end
  
  def test_should_increment_priority_counter_before_saving_new_task
    priority = Priority.first
    counter_before_save = priority.counter
    task = Task.new :title => "Urywaj!", :description => "Ale urwał!", :priority => priority
    task.save!
    assert_equal counter_before_save + 1, task.priority.counter
  end
  
  def test_should_decrement_priority_counter_before_destroing_new_task
    task = Task.first
    priority = task.priority
    counter_before_save = priority.counter
    task.destroy
    assert_equal counter_before_save - 1, priority.counter
  end
  
  
end
