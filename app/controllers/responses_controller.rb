class ResponsesController < ApplicationController
  def index
    @response = Response.find(number=params["phone"])  
  end
end
