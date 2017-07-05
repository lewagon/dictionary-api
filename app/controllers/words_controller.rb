class WordsController < ApplicationController
  def home
    render json: { message: 'welcome' }
  end

  def query
    @word = words.bsearch { |w| params[:word] <=> w }
    response = @word ? { word: @word, length: @word.length } : { error: 'not found' }
    render json: response
  end

  private

  def words
    File.read('words').split("\n")
  end
end
