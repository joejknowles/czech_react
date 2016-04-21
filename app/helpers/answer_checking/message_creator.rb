require_relative 'capitalizer'
module MessageCreator
  def create_message
    if @correct
      make_suggestion
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
    make_suggestion
    @user_message << " \"#{@suggestion}\"."
  end

  def make_suggestion
    puts @suggestion = Capitalizer.capitalize(@correct_options.first)
  end

  def second_attempt?
    @attempt > 1
  end
end