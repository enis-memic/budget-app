require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'Clothes', amount: 50) }

  before { subject.save }

  it 'name should be present' do
    expect(subject.name).to eq('Clothes')
  end

  it 'amound should be present' do
    expect(subject.amount).to eq(50)
  end
end
