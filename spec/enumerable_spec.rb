require 'enumerable'

describe 'Enumerable' do
  let(:empty_arr) {[]}
  let(:num_arr) {[1,2,3]}
  let(:mixed_arr) {["A", 2, "t", "boo", 5, 2]}

  describe '#my_count' do
    context 'given no arguments' do
      it "returns zero for any empty array" do
        expect(empty_arr.my_count).to eql(0)
      end
      it "matches count with no arguments" do
        expect(num_arr.my_count).to eql(num_arr.count)
        expect(mixed_arr.my_count).to eql(mixed_arr.count)
      end
    end

    context 'given an argument' do
      it "returns zero for any empty array" do
        expect(empty_arr.my_count(2)).to eql(0)
      end
      it "matches count with arguments" do
        expect(num_arr.my_count(2)).to eql(num_arr.count(2))
        expect(mixed_arr.my_count(2)).to eql(mixed_arr.count(2))
      end
    end

    context 'given a block' do
      it "returns zero for any empty array" do
        expect(empty_arr.my_count{|num| num % 2 == 0}).to eql(0)
      end
      it "matches count with a block" do
        expect(num_arr.my_count{|num| num % 2 == 0}).to eql(num_arr.count{|num| num % 2 == 0})
        expect(mixed_arr.my_count{|num| num % 2 == 0}).to eql(mixed_arr.count{|num| num % 2 == 0})
      end
    end
  end

  describe '#my_map' do

  end

  describe '#my_inject' do

  end

  describe '#my_all?' do
    context 'given no block' do
      it "returns true for any empty array" do
        expect(empty_arr.my_all?).to be true
      end
      it "matches #all? with no arguments" do
        expect(num_arr.my_all?).to be true
        expect(mixed_arr.my_all?).to be true
      end
    end

    context 'given block' do
      it "returns true for any empty array" do
        expect(empty_arr.my_all?{|num| num > 0}).to be true
      end
      it "matches #all? with no arguments" do
        expect(num_arr.my_all?{|num| num > 0}).to be true
        expect(mixed_arr.my_all?{|num| num > 0}).to raise_exception
        # to raise_error NoMethodError
      end
    end
  end

  describe '#my_any?' do

  end

  describe '#my_select' do

  end

end
