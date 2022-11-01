require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build :user }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be too short' do
      subject.name = 'a'
      expect(subject).to_not be_valid
    end

    it 'name should not be too long' do
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'posts_counter should not be string' do
      subject.posts_counter = 'abc'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should not be negative value' do
      subject.posts_counter = -2
      expect(subject).to_not be_valid
    end
  end

  describe 'recent posts' do
    subject { FactoryBot.create :user_with_posts, posts_counter: 3 }

    it 'return 3 posts' do
      expect(subject.recent_posts.length).to eq(3)
    end
  end
end
