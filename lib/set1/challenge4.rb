require_relative "challenge3"

class Challenge4
  
  def initialize
    @challenge3 = Challenge3.new
    @cipher_texts = IO.readlines(File.dirname(__FILE__) +"/challenge4.txt")
  end
  
  def top_scores(buffer, top)
    scores = (0..200).collect do |char|
      @challenge3.score(buffer, char).merge :buffer => buffer
    end
    scores.sort { |x,y| x[:score] <=> y[:score] }.last(top)
  end
  
  def decode
    @cipher_texts.collect { |t| self.top_scores(t, 3) }.flatten.sort { |x,y| x[:score] <=> y[:score] }.last(10)
  end  
    
end