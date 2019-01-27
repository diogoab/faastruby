require 'spec_helper'
require 'handler'
require 'json'
 
describe '#handler' do
  let(:event) {SpecHelper::Event.new}
  let(:body) {handler(event).call.body}
  
  context 'when function is requested' do
    it 'returns a String' do
      expect(body).to be_a(String)
    end
    it 'returns 2 elements' do
      expect(JSON.parse(body).size).to eq(2)
    end
  end
end
