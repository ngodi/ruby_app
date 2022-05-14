module StdInput
  class << self
    # Reads the server logs file and return an array of each line as a string.
    def read_file
      File.readlines(ARGV.first)
    end
  end
end
