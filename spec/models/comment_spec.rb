# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'creation' do
    before(:each) do
      @comment = FactoryBot.build(:comment)
    end

    context 'with valid params' do
      it 'should not raise error' do
        expect { @comment.save! }.not_to raise_error
      end
    end

    context 'with invalid params' do
      it 'should raise error' do
        @comment.user_id = nil
        expect { @comment.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
