class WordsController < ActionController::API
  def home
    render json: { message: 'welcome',
      endpoints: [
        'https://wagon-dictionary.herokuapp.com/:word',
        'https://wagon-dictionary.herokuapp.com/autocomplete/:stem'
      ]
    }
  end

  def query
    word = words.bsearch { |w| params[:word] <=> w }
    if word
      response = { found: true, word: word, length: word.length }
      render json: response, status: 200
    else
      response = { found: false, word: params[:word], error: 'word not found' }
      render json: response, status: 404
    end
  end

  MAX_AUTOCOMPLETE_RESULTS = 15

  def autocomplete
    matching_words = words.select { |w| w.starts_with?(params[:stem]) }
    render json: {
      words: matching_words[0, MAX_AUTOCOMPLETE_RESULTS],
      count: matching_words.size,
      truncated_result: matching_words.size > MAX_AUTOCOMPLETE_RESULTS
    }
  end

  def redirect
    redirect_to root_path
  end

  private

  def words
    File.read('words').split("\n")
  end
end
