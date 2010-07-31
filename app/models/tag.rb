class Tag < ActsAsTaggableOn::Tag
  def count
    Question.tagged_with(self).count
  end
end
