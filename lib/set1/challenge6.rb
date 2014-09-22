require "base64"

require_relative "challenge4"

class Challenge6
  
  attr_accessor :cipher_text
  
  def initialize
    @cipher_text = Base64.decode64(IO.readlines(File.dirname(__FILE__) +"/challenge6.txt").join).bytes
  end
  
  def hamming_distance(string1, string2)
    hamming_distance_for_bytes(string1.bytes, string2.bytes)
  end
  
  def hamming_distance_for_bytes(bytes1, bytes2)
    byte_xor = bytes1.zip(bytes2).collect { |bytes| bytes[0] ^ bytes[1] }
    bits = byte_xor.pack("c*").unpack("b*")[0]
    bits.count "1"
  end
  
  def find_keysize()
    distances = []
    
    range = 2..40
    range.collect do |keysize|
      distance1 = hamming_distance_for_bytes(@cipher_text[0..keysize-1], @cipher_text[keysize..(keysize*2-1)])
      distance2 = hamming_distance_for_bytes(@cipher_text[keysize*2..keysize*3-1], @cipher_text[keysize*3..(keysize*4-1)])
      distances << { :distance => (distance1 + distance2) / (keysize * 2.0), :keysize => keysize }
    end
    
    distances.sort_by { |distance| distance[:distance] }.first(5)
  end
  
  def get_cipher_blocks(keysize)
    blocks = {}

    grouped_blocks = @cipher_text.each_with_index.group_by { |el, index| index % keysize }
    grouped_blocks.each_pair { |key, value| blocks[key] = value.collect { |b| b[0] } }
    
    blocks
  end
  
  def solve
    blocks = find_keysize().collect { |size| {:keysize => size[:keysize], :block => get_cipher_blocks(size[:keysize])} }
    
    blocks.each do |b| 
      puts "solving for block of size #{b[:keysize]}"
      puts solve_for_block (b[:block]) 
    end
    
  end

  def solve_for_keysize(keysize)
    puts "solving for keysize #{keysize}"
    scores = solve_for_blocks(get_cipher_blocks(keysize))
    puts scores
#     scores.collect { |score| score[:char] }
#     scores.collect { |score| score[:message].each_char.collect { |c| c } }.transpose.flatten.join
#     scores.collect { |score| score[:message].each_char.collect { |c| c } }
#     x.collect { |a| a.each_char.collect { |c| c} }.transpose.flatten.join  
  end
  
  def solve_for_blocks(blocks)
    challenge4 = Challenge4.new
    blocks.each_value.collect do |b|
      challenge4.top_scores(b.pack("c*").unpack("H*")[0], 3).last
    end
  end
    
end