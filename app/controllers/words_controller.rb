class WordsController < ActionController::API
  def home
    counter = $store.transaction { $store[:counter] }
    render json: { message: 'welcome', endpoints: ['https://wagon-dictionary.herokuapp.com/{word}'], counter: counter }
  end

  def query
    word = words.bsearch { |w| params[:word] <=> w }
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

  def add_to_counter
    $store.transaction do
      $store[:counter] += 1
      $store.commit
    end
  end

  def words
    File.read('words').split("\n")
  end
end
