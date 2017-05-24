class TextAnalyzer

  def initialize
    @input
  end

  def choose_file
    print "Hi there, I'm your text analyzer!\n"
    print "Which file do you want me to analyze? : "
    @input = gets.chomp
  end

  def play
    choose_file
    analyze
  end

  def analyze
    if @input[-4..-1] == ".txt"
      valid_analyze
    else
      invalid_operation
      analyze
    end
  end

  private

  def valid_analyze
    lines = File.readlines(@input)
    text = lines.join
    puts "\n----- Analysis of the text file -----\n"
    paragraph_count = text.split(/\n\n/).length
    puts "#{paragraph_count} paragraphs"
    sentence_count = text.split(/\.|\?|\!/).length
    puts "#{sentence_count} sentence"
    line_count = lines.size
    puts "#{line_count} lines"
    word_count = text.split.length
    puts "#{word_count} words"
    total_characters_nospaces = text.gsub(/\s+/, "").length
    puts "#{total_characters_nospaces} characeters (excluding spaces)"
    puts "#{sentence_count / paragraph_count} sentences per pharagrph (average)"
    puts "#{word_count / sentence_count} words per sentence (average)"

    puts "\n----- Summary of the text file -----"
    sentences = text.gsub(/\s+/, " ").strip.split(/\.|\!|\?/)
    sentences.map!(&:strip)
    sentences_sorted = sentences.sort_by(&:length)
    one_third = sentences_sorted.length / 3
    ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
    summary = ideal_sentences.select { |el| el =~ /is|are/ }
    puts summary.join(".\n") + ".\n\n"
  end

  def invalid_operation
    print "Invalid file name!\n"
    print "It should be ending with '.txt'\n"
    print "Which file do you want me to analyze? : "
    @input = gets.chomp
  end

end

if __FILE__ == $PROGRAM_NAME
  a = TextAnalyzer.new
  a.play
end
