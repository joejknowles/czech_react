module MessageCreator
  def create_message
    if @correct
      positive_response
    else
      negative_response
      add_suggestion if second_attempt?
    end
  end

  private

  def positive_response
    @user_message = 'nice!'
  end

  def negative_response
    @user_message = 'Not quite!'
  end

  def add_suggestion
    @user_message << " Try \"#{@correct_options.first}\"."
  end

  def second_attempt?
    @attempt > 1
  end
end