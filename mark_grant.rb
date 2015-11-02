require 'nokogiri'
require 'marky_markov'
require 'pry'

def train(start, markov)
  Dir.foreach(start) do |x|
    path = File.join(start, x)
    if x == "." or x == ".."
      next
    elsif File.directory?(path)
      ## puts path + "/" # remove this line if you want; just prints directories
      train(path, markov)
    else
      puts path
      file_name = path
      html = File.read(file_name)
      doc = Nokogiri::HTML(html)
      doc.css('script, link').each { |node| node.remove }
      text = doc.css('body').text.squeeze(" \n")
      markov.parse_string text
      markov.save_dictionary!
    end
  end
end


markov = MarkyMarkov::Dictionary.new('dictionary') # Saves/opens dictionary.mmd
train('../../grant/grantland.com/', markov)

puts markov.generate_n_words 10
puts markov.generate_n_sentences 2
markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.