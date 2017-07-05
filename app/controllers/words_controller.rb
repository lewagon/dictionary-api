class WordsController < ApplicationController
  def home
    render json: { message: 'welcome' }
  end

  def query
    word = words.bsearch { |w| params[:word] <=> w }
    if word
      response = { word: word, length: word.length }
      render json: response, status: 200
    else
      response = { error: 'not found' }
      render json: response, status: 404
    end
  end

  private

  def words
    File.read('words').split("\n")
  end
end
