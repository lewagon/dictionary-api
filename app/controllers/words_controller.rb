class WordsController < ActionController::API
  before_action :set_counter, :increment_hits

  def home
    render json: {
      message: 'welcome',
      endpoints: ['https://wagon-dictionary.herokuapp.com/{word}'],
      api_hits: @counter.hits,
      words_found: @counter.found
    }
  end

  def query
    query_word = params[:word].downcase
    word = words.bsearch { |w| query_word <=> w }
    if word
      response = { found: true, word: word, length: word.length }
      add_to_counter
    else
      response = { found: false, error: 'word not found' }
    end
    render json: response
  end

  def redirect
    redirect_to root_path
  end

  private

  def set_counter
    @counter = Counter.find(1)
  end

  def increment_hits
    @counter.increment!(:hits)
  end

  def add_to_counter
    @counter.increment!(:found)
  end

  def words
    File.read('words').split("\n")
  end
end
