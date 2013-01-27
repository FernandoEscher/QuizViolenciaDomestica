class ResponsesController < ApplicationController
  def index
    @response = Response.all  
  end
end
