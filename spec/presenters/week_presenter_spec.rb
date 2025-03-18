require 'rails_helper'

RSpec.describe WeeksPresenter do
  let(:date) { Date.new(2025, 03, 18) }

  describe '#days' do
    subject { described_class.new(date:) }

    it 'returns 7 days' do
      expect(subject.days.size).to eq 7
    end

    it 'returns last the next Saturday' do
      expect(subject.days.last.cwday).to eq(6)
    end

    it 'returns first the prev Sunday' do
      expect(subject.days.first.cwday).to eq(7)
    end
  end

  describe '#post_by_days' do
    subject { described_class.new(date:, posts:) }
    let(:posts) { Post.all }

    before do
      create(:post, created_at: Date.today - 3)
      create(:post, created_at: Date.today - 1)
      create(:post, created_at: Date.today)
    end

    it 'returns 2 keys' do
      expect(subject.post_by_days.keys.size).to eq(2)
    end

  end
end
