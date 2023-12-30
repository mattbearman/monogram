# frozen_string_literal: true

RSpec.describe Monogram::Config do
  let(:config) { described_class.new }

  describe 'uppercase' do
    context 'with the default value' do
      subject { config.uppercase }

      it { is_expected.to be_truthy }
    end
  end

  describe 'colours' do
    subject { config.colours }

    context 'with the default value' do
      it { is_expected.to match_array(%w[#B91C1C #B45309 #047857 #1D4ED8 #6D28D9]) }
    end

    context 'with the colors alias' do
      before do
        config.colors = %w[red green blue]
      end

      it { is_expected.to eq(%w[red green blue]) }
    end
  end

  describe 'shape' do
    context 'with the default value' do
      subject { config.shape }

      it { is_expected.to eq('circle') }
    end
  end
end
