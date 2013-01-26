#encoding: utf-8

class QuizzesController < ApplicationController
  def new
  end

  def create
    @quiz = Quiz.new params[:quiz]

    if @quiz.save
      flash[:notice] = "Creación exitosa"
      puts params
      redirect_to :root
    else
      render :new
    end
  end
end