class EventsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
    @events = Event.all

    @internal_events = @events.where(registered_application_id: 7)

    # Conversion
    @conversions = {}

    # Conversion for New App Registration
    @attempt_new_app = @internal_events.where(name: "Attempted New App Registration").count
    @total_reg_app = @registered_applications.count

    @calc_reg_app = (@total_reg_app.to_f / @attempt_new_app).round(4)

    @conversions["Registered Apps"] = @calc_reg_app

  end

end
