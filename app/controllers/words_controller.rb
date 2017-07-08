class WordsController < ActionController::API
  def home
    render json: { message: 'welcome', endpoints: ['https://wagon-dictionary.herokuapp.com/{word}'] }
  end

  def query
    word = words.bsearch { |w| params[:word] <=> w }
    if word
      response = { found: true, word: word, length: word.length }
    else
      response = { found: false, error: 'word not found' }
    end
    render json: response
  end

  def redirect
    redirect_to root_path
  end

  private

  def words
    File.read('words').split("\n")
  end
end
