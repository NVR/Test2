class EventsController < ApplicationController
  
  def index
    @events = Event.all
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @event = params[:id].present? ? Event.find(params[:id]) : Event.create(params[:event])
    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end

  def create
    @event = Event.create(params[:event])
    @event.save
    #if params[:repeat].present?
      #params[:repeat_frequiency].times do
        #kakaya-to funciya dlya vremeni=)
      #end
    #end
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
