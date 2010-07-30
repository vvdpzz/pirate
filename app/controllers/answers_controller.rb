class AnswersController < ApplicationController
  before_filter :load_question
  
  # GET /answers
  # GET /answers.xml
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.xml
  def show
    @answer = @question.answers.find(params[:id])
    @answer.body = RedCloth.new(@answer.body).to_html

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.xml
  def new
    @answer = @question.answers.build

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.xml  { render :xml => @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = @question.answers.find(params[:id])
  end

  # POST /answers
  # POST /answers.xml
  def create
    @answer = @question.answers.build(params[:answer])
    @answer.user_id = current_user.id

    respond_to do |format|
      if @answer.save
        notification = "#{@answer.user.email}回答了你的问题"
        send_notification @answer, "answer", notification
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.xml
  def update
    @answer = @question.answers.find(params[:id])
    @answer.body = RedCloth.new(@answer.body).to_html

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(@question, :notice => 'Answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.xml
  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(question_answers_url(@question)) }
      format.xml  { head :ok }
    end
  end
  def load_question
     @question = Question.find(params[:question_id])
  end
end
