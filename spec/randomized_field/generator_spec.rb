require "spec_helper"

RSpec.describe RandomizedField::Generator do
  describe "#generate" do
    let(:options) { {} }
    let(:generator) { described_class.new(options) }

    context "when using the default arguments" do
      it "returns a string of the default length" do
        expect(generator.generate.length).to eq(described_class::DEFAULTS[:length])
      end

      it "returns a string containing the default valid characters" do
        chars = described_class::DEFAULTS[:valid_characters].join
        length = described_class::DEFAULTS[:length]

        expect(generator.generate).to match(/^[#{chars}]{#{length}}$/)
      end
    end

    context "when length is 4" do
      let(:options) { { length: 4 } }

      it "returns a string of length 4" do
        expect(generator.generate.length).to eq(4)
      end
    end

    context "when a block is supplied" do
      let(:generator) { described_class.new { "apples" } }

      it "passes the generated string through the block before returning" do
        expect(generator.generate).to eq("apples")
      end
    end

    context "when valid_characters is supplied" do
      let(:options) { { length: 13, valid_characters: %w[a b] } }

      it "returns a string containing only those characters" do
        expect(generator.generate).to match(/^[ab]{13}$/)
      end
    end
  end
end
