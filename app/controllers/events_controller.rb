class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :can_edit?, :only => [:edit, :delete]
  def index

    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    if user_signed_in? 
      @event = current_user.events.create(params[:event])
    end
    @shown_month = Date.civil(@year, @month)
    @event_strips = params[:user_id].present? ? Event.user_events(params[:user_id]).event_strips_for_month(@shown_month) : Event.event_strips_for_month(@shown_month)

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

  private
  def can_edit?
    unless user_signed_in? && ( @event.user_id == current_user.id || nil)
      redirect_to root_path
    end
  end
end
