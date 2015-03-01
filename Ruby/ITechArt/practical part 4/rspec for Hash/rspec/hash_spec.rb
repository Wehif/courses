require_relative 'hash.rb'

describe MyHash do
  before(:all) do
    @test_hash = MyHash.new
    (1..100).each { |i| @test_hash["#{i}"] = i }
  end
  
  describe "#[]" do
    it "for hash key = 30, return a value '30'" do
      expect(@test_hash["30"].value).to eq(30)    
    end
    it "for hash key = 1, return a value '1'" do
      expect(@test_hash["1"].value).to eq(1)    
    end
    it "for hash key = 100, return a value '100'" do
      expect(@test_hash["100"].value).to eq(100)    
    end
    it "for hash key = 101, return a value 'nil'" do
      expect(@test_hash["101"]).to eq(nil)    
    end
    it "for hash key = 0, return a value 'nil'" do
      expect(@test_hash["0"]).to eq(nil)    
    end
    it "for hash key = -20, return a value 'nil'" do
      expect(@test_hash["-20"]).to eq(nil)    
    end
    it "for hash key = 'lala', return a value 'nil'" do
      expect(@test_hash["lala"]).to eq(nil)    
    end
  end

  describe "#[]=" do
    it "create a key 'mama' with value 'child'" do
      @test_hash["mama"]="child"
      expect(@test_hash["mama"].value).to eq("child")
    end
  end
end


