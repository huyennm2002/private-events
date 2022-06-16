class EventsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  
  def index
    @events = Event.all 
    @past_events = Event.where("date < ?", Date.today)
    @upcoming_events =  Event.where("date > ?", Date.today)
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
  end

  def update
    flash[:notice] = "Updated!"
    @event = Event.find(params[:id])
    if attendee_checked?
      add_attendees
    end
    redirect_to '/events/new'
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
	end

  private
    def event_params
      params.require(:events).permit(:name,:location,:date,:user_id)
    end

    def attendee_checked?
      params[:event][:attendees] == '1'
    end

    def add_attendees
      @event = Event.find(params[:id])
      if current_user.attended_event_ids.include?(@event.id)
        flash[:notice] = "You have already added this event."
      else 
        @event.attendees << current_user
      end
    end
    
  end

