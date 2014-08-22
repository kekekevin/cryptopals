class Challenge3
  
  def xor(buffer, char)
    xor = buffer.each_char.each_slice(2).collect { |x| x.join.hex ^ char.ord }
  end
  
  def score(buffer, char)
    message = xor(buffer, char)
    score = message.select { |x| x.between?( "A".ord, "Z".ord) || x.between?( "a".ord, "z".ord) || x == " ".ord}.count
    { :score => score, :message => message.pack("c*") , :char => char.chr }
  end
  
  def decode
    scores = (0..200).collect do |char|
      self.score("1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736", char)
    end
    
    puts scores.sort { |x,y| x[:score] <=> y[:score] }.last(5) 
  end  
    
end