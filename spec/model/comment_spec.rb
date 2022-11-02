require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryBot.build :comment }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
