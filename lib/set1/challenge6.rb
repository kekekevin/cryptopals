require "base64"

require_relative "challenge4"

class Challenge6
  
  def initialize
    @cipher_text = Base64.decode64(IO.readlines(File.dirname(__FILE__) +"/challenge6.txt").join)
  end
  
  def hamming_distance(string1, string2)
    
    byte_xor = string1.bytes.zip(string2.bytes).collect { |bytes| bytes[0] ^ bytes[1] }
    bits = byte_xor.pack("c*").unpack("b*")[0]
    bits.count "1"
    
  end
  
  def find_keysize()
    distances = []
    
    range = 2..40
    range.collect do |keysize|
      distance = hamming_distance(@cipher_text[0..keysize], @cipher_text[keysize..(keysize*2)])
      distances << { :distance => distance, :keysize => keysize }
    end
    
    distances.sort_by { |distance| distance[:distance] }.first(3)
  end
  
  def get_cipher_blocks(keysize)
    blocks = {}
    
    grouped_blocks = @cipher_text.bytes.each_with_index.group_by { |el, index| index % keysize }
    grouped_blocks.each_pair { |key, value| blocks[key] = value.collect { |b| b[0] } }
    
    blocks
  end
  
  def solve
    challenge4 = Challenge4.new
    find_keysize().collect { |size| get_cipher_blocks(size[:keysize]) }[0]
  end
  
end