require_relative '../../../services/analytics/web_server_analyzer';

describe Analytics::WebServerAnalyzer do
  let(:analyzer) do
    Analytics::WebServerAnalyzer.new(
      web_logs: sample_web_logs
    )
  end

  let(:sample_web_logs) do
    [
      '/help_page/1 126.318.035.038',
      '/help_page/1 126.318.035.038',
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/about/2 444.701.448.104',
      '/help_page/1 929.398.951.889',
      '/contact 444.701.448.104',
      '/help_page/1 722.247.931.582'
    ]
  end

  it "should exist with all attributes" do
    expect(analyzer).to be_instance_of(Analytics::WebServerAnalyzer)
    expect(analyzer).to respond_to(:display_visits)
    expect(analyzer).to respond_to(:display_unique_views)
    expect(analyzer).to have_attributes(
      web_logs: sample_web_logs,
   )
  end

  describe "#display_visits" do
    it "displays the visits count in descending order" do
      expect { analyzer.display_visits }.to output("/help_page/1 5 visits  /contact 3 visits  /about/2 1 visit  /home 1 visit  ").to_stdout
    end
  end

  describe "#display_unique_views" do
    it "displays unique view count in descending order" do
      expect { analyzer.display_unique_views }.to output("/help_page/1 3 unique views\n/contact 2 unique views\n/about/2 1 unique view\n/home 1 unique view\n").to_stdout
    end
  end

  context "when invalid input present" do
    let(:sample_web_logs) do
      [
        '/help_page/1 126.318.035.038',
        '/help_page/1 126.318.035.038',
        '/help_page/1 126.318.035.038',
        '/contact ',
        '/contact 184.123.665.067',
        '/contact 184.123.665.067',
        '/',
        '184.123.665.067',
        '/home 184.123.665.067',
        '/about/2 444.701.448.104',
        '/help_page/1 929.398.951.889',
        '/contact 444.701.448.104',
        '/help_page/1 722.247.931.582'
      ]
    end

    it "is ignored and processes others normally" do
      expect { analyzer.display_visits }.to output("/help_page/1 5 visits  /contact 3 visits  /about/2 1 visit  /home 1 visit  ").to_stdout
      expect { analyzer.display_unique_views }.to output("/help_page/1 3 unique views\n/contact 2 unique views\n/about/2 1 unique view\n/home 1 unique view\n").to_stdout
    end
  end
end
