require_relative '../kata'

P.size = 5
describe P do

  specify "size defined by the class" do
    expect(P.size).to eq(5)
  end

  let (:id) {P.new(->(x){x})}
  let (:rot){P.new(->(x) {x%P.size+1})}
  let (:other) {P.new(->(x) do 
    case x
    when 1 then 3
    when 2 then 4
    when 3 then 2
    when 4 then 1
    when 5 then 5
    end
  end)}

  specify "mapping given in the constructor" do
    expect(id).to_not be_nil
  end

  describe "array representation" do

    specify "for identity" do
      expect(id.to_a).to eq([1,2,3,4,5])
    end

    specify "for rotation" do
      expect(rot.to_a).to eq([2,3,4,5,1])
    end

    specify "for other" do
      expect(other.to_a).to eq([3,4,2,1,5])
    end

  end

  it "defines an == operator" do
    rot2 = P.new(->(x) {x%P.size+1})
    expect(rot).to eq(rot2)
  end

  it "operates on set elements" do
    expect(id[3]).to eq(3)
    expect(rot[3]).to eq(4)
    expect(rot[5]).to eq(1)
  end 

  specify "create from a cycle" do
    expect(P.from_cycle([1,5,2]).to_a).to \
      eq([5,1,3,4,2])
  end

  specify "create from array of cycles" do
    expect(P.from_cycles([1],[2,4],[3,5]).to_a).to \
      eq([1,4,5,2,3])
  end

  it "supports composition" do
    expect(rot.compose(rot).to_a).to \
      eq([3,4,5,1,2])
  end 

  it "supports composition with *" do
    expect(rot*rot).to eq(rot.compose(rot))
  end

  specify "f*g = g.compose(f)" do
    p13 = P.from_cycle([1,3])
    p35 = P.from_cycle([3,5])
    expect(p13*p35).to_not eq(p35*p13)
    expect(p13*p35).to eq(p35.compose(p13))
  end
 
  context "cycle decompositon" do

    it "returns an array" do
      expect(rot.cycles).to be_an_instance_of(Array)
    end

    it "handles rotation" do
      expect(rot.cycles).to eq([[1,2,3,4,5]])
    end

    it "handles multi-cycle permutation" do
      p = P.from_cycles([1,4],[2,5,3])
      expect(p.cycles).to eq([[1,4],[2,5,3]])
    end

    it "removed degenerate cycles" do
      p = P.from_cycles([1,3],[2],[4,5])
      expect(p.cycles).to eq([[1,3],[4,5]])
    end

    it "returns [[1]] for identity" do
      expect(id.cycles).to eq([[1]])
    end
  end

end