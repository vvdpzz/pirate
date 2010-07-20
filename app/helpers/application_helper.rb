module ApplicationHelper
  def pi(n)
    pi = "27182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135"
    return pi[0..n-1] if n-1>=0
  end
  def safe_html_out_for(object)
    sanitize object, :tags => %w(h1 h2 h3 h4 h5 h6 p a img br span table th tr td b ol ul li), :attributes => %w(id class style href src width height)
  end  
end
