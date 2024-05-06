class WordsController < ActionController::API
  before_action :increment_counter, only: [:query, :autocomplete]

  def home
    render json: {
      message: "welcome",
      endpoints: [
        "#{ENV["BASE_URL"]}/:word",
        "#{ENV["BASE_URL"]}/autocomplete/:stem"
      ],
      total_api_hits: Counter.instance.read(:hits),
      words_found: Counter.instance.read(:found),
      autocomplete_hits: Counter.instance.read(:autocomplete)
    }
  end

  def query
    word = params[:word].downcase
    if Word.instance.words.include?(word)
      response = {found: true, word: word, length: word.length}
      Counter.instance.increment(:found)
    else
      response = {found: false, word: word, error: "word not found"}
    end
    render json: response
  end

  MAX_AUTOCOMPLETE_RESULTS = 15

  def autocomplete
    stem = params[:stem].downcase
    matching_words = Word.instance.words.select { |w| w.starts_with?(stem) }
    Counter.instance.increment(:autocomplete)
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

  def increment_counter
    Counter.instance.increment(:hits)
  end
end
