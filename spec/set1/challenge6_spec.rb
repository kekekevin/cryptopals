require "set1/challenge6"

describe Challenge6 do
  
  describe "hamming_distance" do
    
    it "should compute the hamming distance between two strings" do
      expect(Challenge6.new.hamming_distance("this is a test", "wokka wokka!!!")).to eq 37
    end
    
  end
  
end