require "set1/challenge5"

describe Challenge5 do
  
  describe "repeating_key_xor" do
    
    it "XOR a buffer with a repeating key" do
      expect(Challenge5.new.repeating_key_xor("Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal", "ICE")).to eq "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f"
    end
    
  end
  
end