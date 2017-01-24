require 'rails_helper'

RSpec.describe Paragraph, type: :model do
  page = Page.new
  subject {
    page.paragraphs.new(body: "hello", num: 1)
  }

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'is invalid without a body' do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid without a num' do
    subject.num = nil
    expect(subject).to_not be_valid
  end

end
