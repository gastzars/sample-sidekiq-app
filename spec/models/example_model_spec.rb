require 'spec_helper'

RSpec.describe ExampleModel, type: :model do

  describe ".two_times" do
    it "when value is present" do
      example = create(:example_model, :with_value)
      expect(example.two_times).to be(example.value + example.value)
    end

    it "when value is null" do
      example = create(:example_model)
      expect{example.two_times}.to raise_error(NoMethodError)
    end
  end

end
