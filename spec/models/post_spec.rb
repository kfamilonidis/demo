require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  describe '#sorted_sections' do
    subject { create(:post, :with_sections) }

    it 'sorts important sections first' do
      expect(subject.reload.sorted_sections.first).to be_a Section::Important
    end
  end
end
