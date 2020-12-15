Rails.logger.info "Loading dictionary..."
$words = HTTP.get('https://raw.githubusercontent.com/dwyl/english-words/master/words.txt').to_s.split("\n").map(&:downcase).uniq.freeze
Rails.logger.info "Loaded #{$words.size} words from github.com/dwyl/english-words"
