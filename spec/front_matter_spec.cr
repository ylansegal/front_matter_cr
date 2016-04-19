require "./spec_helper"
require "spec2"

include Spec2::GlobalDSL

describe FrontMatter do
  let(expected_front_matter) { {"date" => "2016-03-06T23:08:07+09:00", "title" => "this is title"} }
  let(expected_content) { "this is content" }
  subject(extract) { FrontMatter.extract(MemoryIO.new(text)) }

  context "yaml" do
    let(text) do
      <<-EOS
      ---
      date: 2016-03-06T23:08:07+09:00
      title: this is title
      ---
      this is content
      EOS
    end

    it "extract yaml front_matter" do
      expect(extract[0]).to eq(expected_front_matter)
      expect(extract[1]).to eq(expected_content)
    end
  end

  describe "toml" do
    let(text) do
      <<-EOS
      +++
      date = "2016-03-06T23:08:07+09:00"
      title = "this is title"
      +++
      this is content
      EOS
    end

    it "extract toml front_matter" do
      expect(extract[0]).to eq(expected_front_matter)
      expect(extract[1]).to eq(expected_content)
    end
  end
end
