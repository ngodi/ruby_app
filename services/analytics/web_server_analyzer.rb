module Analytics
  class WebServerAnalyzer
    attr_reader :web_logs, :analyzed_data

    # Initializes a new Analytics::WebServerAnalyzer.
    #
    # web_logs - The Array of strings per visit recorded. Consists of:
    #            The web page visited and the ip address of the visitor.
    # analyzed_data - The analyzed Hash of pages visited and the visitors' ip addresses.
    #                 :key - The String representing the URL of the visited page.
    #                 :value - The Array representing the ip addresses of the URL visitors.
    #
    def initialize(web_logs:)
      @web_logs = web_logs
      @analyzed_data = analyze
    end

    # Computes and displays the total visits count per page from most visited to least.
    def display_visits
      analyzed_data.sort_by { |k, v| [-v.count, k] }
        .each do |page, visitors|
          visitors = pluralize(visitors.count, 'visit')
          print "#{page} #{visitors}  "
      end
    end

    # Computes and displays the total unique(by visitor/ip address) count per page from most viewed to least.
    def display_unique_views
      analyzed_data.sort_by { |k, v| [-v.uniq.count, k] }
        .each do |page, visitors|
          unique_views = pluralize(visitors.uniq.count, 'unique view')
          puts "#{page} #{unique_views}"
        end
    end

    def pluralize(count, name)
      count == 1 ? "#{count} #{name}" : "#{count} #{name}s"
    end


    private

    def analyze
      analyzed_data = {}

      web_logs.each do |line|
        line = line.split(" ");

        next if !line || line.length < 2

        page = line[0]
        visitor = line[1]

        if !analyzed_data[page]
          analyzed_data[page] = [visitor]
        else
          analyzed_data[page] << visitor
        end
      end

      analyzed_data
    end
  end
end
