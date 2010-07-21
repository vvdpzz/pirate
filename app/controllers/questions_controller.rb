class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :load_user
  
  autocomplete :tag, :name
  
  def tagged
    @tagged_questions = Question.tagged_with(params[:tag])
    respond_to do |format|
      format.html
    end
  end
  
  # GET /questions
  # GET /questions.xml
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])
    @question.revert_to(params[:version].to_i) if params[:version]
    if session["question_viewed_#{@question.id}"] == nil
      session["question_viewed_#{@question.id}"] = 1
      @question.update_attributes(:views => @question.views+1)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = @user.questions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    authorize! :update, @question
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = @user.questions.build(params[:question])
    @question.body = RedCloth.new(@question.body).to_html

    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])
    @question.body = RedCloth.new(@question.body).to_html

    respond_to do |format|
      params[:question][:updated_by] = current_user
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = @user.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_user
    @user = current_user
  end
end
