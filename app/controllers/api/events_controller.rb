class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_access_control_headers

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    puts registered_application.inspect
    if registered_application == nil
      render json: "Unregistered application", status: :unprocessable_entity
    elsif registered_application
      event = registered_application.events.build
      event.name = params[:event_name]
      event.save
      render json: @event, status: :created
    end
  end


   def set_access_control_headers
 # #1
     headers['Access-Control-Allow-Origin'] = '*'
 # #2
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
 # #3
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end


  private

  def event_params
    params.permit(:event_name)
  end

end