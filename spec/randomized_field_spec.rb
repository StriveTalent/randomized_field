require "spec_helper"

RSpec.describe RandomizedField, type: :model do
  let(:field1_length) { 5 }
  let(:field2_length) { 10 }
  let(:field3_length) { 10 }

  before(:all) do
    User.include(described_class)

    User.randomized_field :random_field1, length: 5
    User.randomized_field :random_field2, length: 10
    User.randomized_field(:random_field3, length: 10) { |s| "U" + s }
  end

  it "has a version number" do
    expect(RandomizedField::VERSION).not_to be_nil
  end

  describe "#create" do
    subject(:user) { User.new }

    it { is_expected.to validate_uniqueness_of(:random_field1) }
    it { is_expected.to validate_uniqueness_of(:random_field2) }

    it "sets random_field1 to a String of the correct length" do
      expect {
        user.save
      }.to change(user, :random_field1).from(nil).to(/^.{#{field1_length}}$/)
    end

    it "sets random_field2 to String of the correct length" do
      expect {
        user.save
      }.to change(user, :random_field2).from(nil).to(/^.{#{field2_length}}$/)
    end

    context "when the randomized field already has a value" do
      it "does not change the value" do
        user.random_field1 = "apples"

        expect {
          user.save
        }.not_to change(user, :random_field1).from("apples")
      end
    end

    context "when passed a block that adds a prefix" do
      it "adds the prefix to the generated string" do
        expect {
          user.save
        }.to change(user, :random_field3).from(nil).to(/^U.{#{field3_length}}$/)
      end
    end
  end
end
