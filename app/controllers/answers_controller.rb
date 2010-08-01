class AnswersController < ApplicationController
  before_filter :load_question

  def new
    @answer = @question.answers.build

    respond_to do |format|
      format.js
    end
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def create
    @answer = @question.answers.build(params[:answer])
    @answer.user_id = current_user.id

    respond_to do |format|
      if @answer.save
        send_notification @answer, "answer", answer.user
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @answer = @question.answers.find(params[:id])
    @answer.body = RedCloth.new(@answer.body).to_html

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(@question) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(question_answers_url(@question)) }
    end
  end
  
  private
  def load_question
     @question = Question.find(params[:question_id])
  end
end