class ResponsesController < ApplicationController
  def index
    @response = Response.where(:phone=>params["phone"])  
  end
end
