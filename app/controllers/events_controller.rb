class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    @events = Event.all
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @event =  Event.create(params[:event])
    #@event = current_user.events.build(params[:event])
    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end

  def create
    @event = Event.create(params[:event])
    @event.save
  end

  def new
    @event = Event.create
  end

  def edit
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])

  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to root_path
    end
  end


end
