class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new 
  end
  
  def show 
    @event = Event.find(params[:id])
  end

  def create 
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event was saved!"
    else
      render 'new'
  end

  

  private
    def event_params
      params.require(:events).permit(:name,:location,:date,:user_id)
    end
    # def attendee_checked?
    #   params[:event][:attendees] == '1'
    # end
  end
end
