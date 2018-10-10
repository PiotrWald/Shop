# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'creation' do
    before(:each) do
      @tag = FactoryBot.build(:tag)
    end

    context 'with valid params' do
      it 'should not raise error' do
        expect { @tag.save! }.not_to raise_error
      end
    end
  end
end
