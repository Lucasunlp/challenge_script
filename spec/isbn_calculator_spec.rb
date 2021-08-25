require "isbn_calculator"
describe 'complete_isbn' do
    context "given correct isbn" do
      it "return 4" do
        expect(complete_isbn("978014300723")).to eq("4")
      end
    end
    context "given an empty string" do
      it "returns zero" do
        expect(complete_isbn("")).to eq("0")
      end
    end
    context "given a string without numbers" do
      it "returns zero" do
        expect(complete_isbn("aaa")).to eq("0")
      end
      it "returns zero" do
        expect(complete_isbn("aaa@!")).to eq("0")
      end
      it "returns zero" do
        expect(complete_isbn("a123")).to eq("0")
      end
    end
end
