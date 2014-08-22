class Challenge2
   
  def fixed_xor(buffer1, buffer2)
    xor = buffer1.hex ^ buffer2.hex
    xor.to_s(16)
  end
    
end