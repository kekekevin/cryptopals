require "base64"

class Challenge1
  
  def hex_to_base64(hex_string)
    binary = hex_string.each_char.collect { |c| c.hex.to_s(2).rjust( 4, "0") }
    ascii = binary.each_slice(2).collect { |x| x.join.to_i(2) }.pack("c*")
    Base64.strict_encode64(ascii)
  end
    
end