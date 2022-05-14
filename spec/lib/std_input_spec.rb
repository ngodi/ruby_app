require_relative '../../lib/std_input';

describe StdInput do
  before do
    allow(File).to receive(:readlines).and_return(
      ['/home 184.123.665.067', '/about/2 444.701.448.104', '/help_page/1 929.398.951.889']
    )
  end

  describe '.read_file' do
    it "should return an array of the logs from STDIN" do
      expect(StdInput.read_file).to eq(['/home 184.123.665.067', '/about/2 444.701.448.104', '/help_page/1 929.398.951.889'])
    end
  end
end
