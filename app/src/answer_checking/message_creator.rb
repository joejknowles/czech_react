require_relative 'capitalizer'
module MessageCreator
  def create_message
    if @correct
      make_suggestion
    end
  end

  def make_suggestion
    suggest = @correct_options.first
    @suggestion = {
      display: Capitalizer.capitalize(suggest.display),
      id: suggest.id
    }
  end
end