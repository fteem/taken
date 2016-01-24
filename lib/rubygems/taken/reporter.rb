module Taken
  module Reporter
    def self.name_taken(name)
      $stdout.puts "The gem name '#{name}' is taken."
    end

    def self.name_not_taken(name)
      $stdout.puts "It will be yours. Oh yes. It will be yours. The gem name '#{name}' is available."
    end
  end
end
