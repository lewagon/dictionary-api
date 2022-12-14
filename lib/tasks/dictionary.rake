namespace :dictionary do
  task :dump do
    puts "Dumping dictionary..."
    `curl https://raw.githubusercontent.com/dwyl/english-words/master/words.txt > db/words.txt`
    puts "Done"
  end
end
