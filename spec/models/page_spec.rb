require 'rails_helper'

RSpec.describe Page, type: :model do

  subject {
    described_class.new()
  }

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'has a paragraph count of 1' do
    expect(subject.next_paragraph_number).to eq 1
  end

  it 'successfully counts paragraphs' do
    subject.paragraphs.new(body: "hello", num: 1)
    expect(subject.next_paragraph_number).to eq 2
  end

  it 'can add a title' do
    subject.set_title('bozo')
    expect(subject.title).to eq 'bozo'
  end

end
