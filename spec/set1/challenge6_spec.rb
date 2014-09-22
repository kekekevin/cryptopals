require "set1/challenge6"

describe Challenge6 do
  
  describe "hamming_distance" do
    
    it "should compute the hamming distance between two strings" do
      expect(Challenge6.new.hamming_distance("this is a test", "wokka wokka!!!")).to eq 37
    end
    
  end
  
  describe "solve for blocks" do
    let(:hex) { "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736" }
    let(:bytes) { hex.each_char.each_slice(2).collect {|x| x.join.hex} }
    
    it "should solve for the message" do
      expect(Challenge6.new.solve_for_blocks({ 0 => bytes })[0][:message]).to eq "Cooking MC's like a pound of bacon"
    end
    
    it "should solve for the character XOR" do
      expect(Challenge6.new.solve_for_blocks({ 0 => bytes })[0][:char]).to eq "X"
    end
    
  end
    
end