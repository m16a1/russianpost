require 'spec_helper'

describe RussianPost do
  describe '#get_history' do
    it 'returns array' do
      tracking = RussianPost.new 'EE004107342DE'
      factory = FactoryGirl.build(:good_response)
      Savon::Client.any_instance.stub(:call).and_return factory
      tracking.get_history.should be_a_kind_of Array
    end
    it 'raises exception if track number is incorrect' do
      expect {
        RussianPost.new '004107342D'
      }.to raise_error(RussianPost::IncorrectTrackingNumber,
          'Incorrect format of tracking number: 004107342D')
    end
  end
end