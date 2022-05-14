require_relative './lib/std_input.rb';
require_relative './services/analytics/web_server_analyzer.rb'

web_logs = StdInput.read_file

analyzer = Analytics::WebServerAnalyzer.new(web_logs: web_logs)
analyzer.display_visits
print "\n \n"
analyzer.display_unique_views
