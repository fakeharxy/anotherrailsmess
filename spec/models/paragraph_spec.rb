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

  it 'can set a paragraph as important' do
    subject.switch_paragraphs_importance
    expect(subject.important).to eq true
  end

  it 'can set a paragraph as a todo' do
    subject.set_paragraph_as_todo(Date.today)
    expect(subject.todo).to eq Date.today
  end

  it 'can be tagged' do
    tag = ['lol']
    subject.apply_tag_or_tags(tag)
    expect(subject.tag_list).to include "lol"
  end

  it 'can be tagged with multiple tags' do
    tag = ['lol', 'happy', 'bad_breath']
    subject.apply_tag_or_tags(tag)
    expect(subject.tag_list).to include("lol", "happy", "bad_breath")
  end
end
