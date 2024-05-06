class Word
  include Singleton

  attr_reader :words

  def initialize
    @words = File.read(Rails.root.join("db/words.txt")).split("\n").map(&:downcase).uniq.freeze
  end
end
