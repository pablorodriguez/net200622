# frozen_string_literal: true

require 'rails_helper'

describe ExampleService do
  context 'when no options' do
    it { expect(ExampleService.new.execute).to eq(2) }
  end
  context 'when options :a and :b' do
    let(:option) { { a: 2, b: 4 } }
    it 'sums :a and :b' do
      expect(ExampleService.new(option).execute)
        .to eq(6)
    end
  end
end
