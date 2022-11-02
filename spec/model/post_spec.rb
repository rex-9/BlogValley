require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validation' do
    subject do
      FactoryBot.build :post
    end

    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should not be string' do
      subject.comments_counter = 'abc'
      expect(subject).to_not be_valid
    end

    it 'comments_counter should not be negative' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be present' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'likes_counter should not be string' do
      subject.likes_counter = 'abc'
      expect(subject).to_not be_valid
    end

    it 'likes_counter should not be negative' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent comments' do
    subject { FactoryBot.create :post_with_comments, comments_counter: 5 }

    it 'should return 5 comments' do
      expect(subject.recent_comments.length).to be 5
    end
  end
end
