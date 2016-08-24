class CalendarController < ApplicationController
  
  def home
    @meetings = Meeting.all    
  end
end
