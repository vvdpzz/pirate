module ApplicationHelper
  
  # for version control
  def euler(n)
    euler = "27182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135"
    return euler[0..n-1] if n-1>=0
  end
  
  # output safe html code
  # options: only the mentioned tags and attributes are allowed, nothing else
  def safe_html_out_for(object)
    sanitize object, :tags => %w(h1 h2 h3 h4 h5 h6 p a img br span table th tr td b ol ul li), :attributes => %w(id class style href src width height)
  end
  
  # Pretty prints (formats and approximates) a number in a way it is more readable by humans.
  # This is useful for numbers that can get very large (and too hard to read).
  def to_k(number)
    # number_to_human algorithm based on log(a,b), which b must > 0 
    if number > 0
      return number_to_human number, { :format => "%n%u", :units => {:unit => "", :thousand => "k"} }
    else
      return number
    end
  end
  
  def vote_block(question)
    content_tag(:div, :class => "vote-block") do
      content_tag(:div, :class => "vote") do
        [content_tag(:strong, to_k(question.votes_trend), :class => "vote-count"),"投票"].join
      end
    end
  end
  
  def answer_block(question)
    if question.answer_id != 0
      answer_status = "selected"
    elsif question.answers.count > 0
      answer_status = "answered"
    else
      answer_status = "unanswered"
    end
    content_tag(:div, :class => "answer-block #{answer_status}") do
       [content_tag(:strong, to_k(question.answers.count)),"答案"].join
    end
  end
  
  def view_block(question)
    content_tag(:div, :class => "view-block") do
      [to_k(question.views)," 浏览"].join
    end
  end

end