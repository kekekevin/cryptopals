class Challenge5
  
  def repeating_key_xor(buffer, key)
    encoded = []
    
    buffer.bytes.each_with_index do |b, index|
      encoded << (b ^ key[index % key.size].ord)
    end
    
    encoded.pack("c*").unpack("H*")[0]
  end
    
end