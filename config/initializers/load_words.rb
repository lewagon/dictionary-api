$words = File.read(Rails.root.join("db/words.txt")).split("\n").map(&:downcase).uniq.freeze
