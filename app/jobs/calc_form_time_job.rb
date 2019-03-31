class CalcFormTimeJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @form_time_tracker = FormTimeTracker.new

    @form_time_tracker.new_impression_at = get_impression(user_id, "new")
    @form_time_tracker.create_impression_at = get_impression(user_id, "create")

    @form_time_tracker.save
  end


  private

  def get_impression(user_id, action_name)
    Impression.where(user_id: user_id, controller_name: "forms", action_name: action_name).last.created_at
  end
end