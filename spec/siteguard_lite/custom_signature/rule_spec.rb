RSpec.describe SiteguardLite::CustomSignature::Rule do
  describe '.valid?' do
    let(:rule) { SiteguardLite::CustomSignature::Rule.new(args) }
    let(:args) {
      {
        name: 'signature-name',
        comment: 'comment',
        exclusion_action: 'EXCLUDE_OFFICIAL',
        signature: '^.+$',
      }
    }

    subject { rule.valid? }

    describe 'name' do
      context 'when length is 29 characters' do
        before { args[:name] = 'a' * 29 }
        it { is_expected.to eq true }
      end

      context 'when length is 30 characters' do
        before { args[:name] = 'a' * 30 }
        it { is_expected.to eq false }
      end
    end

    describe 'signature' do
      context 'when length is 999 bytes' do
        before { args[:signature] = 'a' * 999 }
        it { is_expected.to eq true }
      end

      context 'when length is 1000 bytes' do
        before { args[:signature] = 'a' * 1000 }
        it { is_expected.to eq false }
      end
    end
  end
end