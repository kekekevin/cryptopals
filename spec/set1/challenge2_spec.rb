require "set1/challenge2"

describe Challenge2 do
  
  describe "fixed_xor" do
    
    it "XOR two buffers" do
      expect(Challenge2.new.fixed_xor "1c0111001f010100061a024b53535009181c", "686974207468652062756c6c277320657965" ).to eq "746865206b696420646f6e277420706c6179"
    end
    
  end
  
end