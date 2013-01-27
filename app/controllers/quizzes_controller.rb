#encoding: utf-8

class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

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

  def show
    @quiz = Quiz.find params[:id]
  end

  def edit
    @quiz = Quiz.find params[:id]
    render :new
  end

  def update
    @quiz = Quiz.find params[:id]
    @quiz.update_attributes(params[:quiz])
    redirect_to quiz_path(@quiz)
  end

  def end
    @quiz = Quiz.find params[:id]
    params[:answers].each do |k, v|
      Response.create(:phone=>session[:session_id], :answer=>v, :question_id=>k)
    end
    render :end
  end
end