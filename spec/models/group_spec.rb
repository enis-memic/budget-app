require 'rails_helper'

RSpec.describe Group, type: :model do
    subject {Group.new(name:'Clothes', icon: 'shirt.png')}

    before {subject.save}

    it 'name should be present' do 
        expect(subject.name).to eq('Clothes')
    end

    it 'icon shold be present' do
        expect(subject.icon).to eq('shirt.png')
    end

end