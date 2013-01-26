#encoding: utf-8

class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    5.times { @quiz.questions.build }
  end

  def create
    @quiz = Quiz.new params[:quiz]

    if @quiz.save
      flash[:notice] = "Creación exitosa"
      redirect_to :root
    else
      render :new
    end
  end
end