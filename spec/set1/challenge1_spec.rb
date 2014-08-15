require "set1/challenge1"

describe Challenge1 do
  
  describe "hex_to_base_64" do
    
    it "should convert hex" do
      expect(Challenge1.new.hex_to_base64 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d" ).to eq "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
    end
    
  end
  
end
      