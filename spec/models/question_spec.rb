require 'rails_helper'


RSpec.describe Question do

let(:question) {Question.new}

  it "should not valid with out body" do
    expect(question).not_to be_valid
  end

end
