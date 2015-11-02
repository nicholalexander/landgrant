require 'nokogiri'
require 'marky_markov'


def train(path, markov)
  puts path
  file_name = path
  html = File.read(file_name)
  doc = Nokogiri::HTML(html)
  doc.css('script, link').each { |node| node.remove }
  text = doc.css('body').text.squeeze(" \n")
  markov.parse_string text
  markov.save_dictionary!
end


def walk(start, markov)
  Dir.foreach(start) do |sub_directory|
    path = File.join(start, sub_directory)
    if sub_directory == "." or sub_directory == ".."
      next
    elsif File.directory?(path)
      walk(path, markov)
    else
      train(path, markov)
    end
  end
end


markov = MarkyMarkov::Dictionary.new('dictionary') # Saves/opens dictionary.mmd
walk('../../grant/grantland.com/', markov)
puts markov.generate_n_words 10
puts markov.generate_n_sentences 2
markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.