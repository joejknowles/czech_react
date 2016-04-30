require_relative 'capitalizer'
module MessageCreator
  def create_message
    if @correct
      make_suggestion
    end
  end

  def make_suggestion
    @suggestion = Capitalizer.capitalize(@correct_options.first)
  end
end