class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    #@event = Event.new(event_params)
    #@event.creator = current_user    #build_association alternatate method tried here
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  def rsvp
    @event = Event.find(params[:event_id])
    if @event.attendees.include?(current_user)
      redirect_to @event
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end
end
