class ActivityReportsController < ApplicationController
  def index
  end

  def show
    if params[:id] == 'booka'
      @activity_report = ActivityReport.all
    else
      Activity.find(-1)
    end
    if (params[:browser] != 'activities')
      
    end
  end
end
