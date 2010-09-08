class PusherController < ApplicationController

  # Pusher params: channel_name, event
  def trigger
    Pusher[params[:channel_name]].trigger(params[:event_name], params[:event])
    head :ok
  end
end
