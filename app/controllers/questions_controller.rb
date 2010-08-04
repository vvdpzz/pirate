class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :load_user
  autocomplete :tag, :name, :full => true
    
  def tagged
    @tagged_questions = Question.tagged_with(params[:tag])
    respond_to do |format|
      format.html
    end
  end
  
  def correct
    @answer = Answer.find(params[:correct_id])
    if @answer.created_at <= 1.day.ago
      @question = Question.find(params[:question_id])
      @question.skip_version do
        @question.answer_id = params[:correct_id]
        @answer.correct = 1
        @answer.save
        @question.save
        correct_reputation @answer

      end
      respond_to do |format|
        format.js
      end
    end
  end

  def index
    if params[:sort].nil? or params[:sort] == "active"
      @questions = Question.paginate :page => params[:page], :order => 'updated_at DESC'
      set_tab :active
    elsif params[:sort] == "newest"
      @questions = Question.paginate :page => params[:page], :order => 'created_at DESC'
      set_tab :newest
    elsif params[:sort] == "vote"
      @questions = Question.paginate :page => params[:page], :order => 'vote DESC'
      set_tab :vote
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def unanswered
    @questions = Question.paginate :page => params[:page], :order => 'updated_at DESC', 
                                                           :conditions => ["answer_id = 0"]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.body = RedCloth.new(@question.body).to_html
    @question.revert_to(params[:version].to_i) if params[:version]
    @question.skip_version do
      if session["question_viewed_#{@question.id}"] == nil
        session["question_viewed_#{@question.id}"] = 1
        @question.update_attributes(:views => @question.views+1)
      end
    end

    respond_to do |format|
      format.html
    end
  end

  def new
    @question = @user.questions.build

    respond_to do |format|
      format.html
    end
  end

  def edit
    @question = Question.find(params[:id])
    authorize! :update, @question
  end

  def create
    @question = @user.questions.build(params[:question])
    
    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      params[:question][:updated_by] = current_user
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

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
