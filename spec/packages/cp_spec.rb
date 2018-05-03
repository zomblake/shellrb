require "packages/ls"

describe Cp do

  describe ".main" do
    context "given any parameter" do
      it "calls the right fileutil method" do

        # check whether a single file is copied with .cp
        expect(Cp.main("")).to eql(FileUtils.cp())

        # check whether a directory is copied with .cp_r
        expect(Cp.main("-r")).to eql(FileUtils.cp_r())

      end
    end
  end
  describe ".file_is_present" do
    context "given a source file/directory" do
      it "returns true if source is present"
        expect(Cp.file_is_present).to be_true
    end
  end

end
