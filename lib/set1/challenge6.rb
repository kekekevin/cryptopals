class Challenge6
  
  def hamming_distance(string1, string2)
    
    byte_xor = string1.bytes.zip(string2.bytes).collect { |bytes| bytes[0] ^ bytes[1] }
    bits = byte_xor.pack("c*").unpack("b*")[0]
    bits.count "1"
    
  end
  
end