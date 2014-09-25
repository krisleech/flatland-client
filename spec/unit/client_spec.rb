require 'flatland/client'

module Flatland
  describe Client do

    # TODO: inject a noop HTTP client
    before { stub_request(:post, 'http://example.com/builds') }

    describe '#do' do
      it 'records duration of given command' do
        subject.do('sleep 1')
        expect(subject.duration).to eq(1)
      end

      it 'records exit code of given successful command' do
        subject.do('true')
        expect(subject.exit_code).to eq(0)
      end

      it 'records exit code of given failing command' do
        subject.do('false')
        expect(subject.exit_code).to eq(1)
      end

      it 'exits with given commands exit code'
    end
  end
end
