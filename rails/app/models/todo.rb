class Todo < ActiveRecord::Base
  def pending?
    !done?
  end

  def done!
    update_attribute(:done, true)
  end
end
