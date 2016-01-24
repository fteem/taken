require 'rubygems/taken/reporter'

class Gem::Commands::TakenCommand < Gem::Command
  def initialize
    super("taken", "Checks if the gem name is taken.")
  end

  def arguments # :nodoc:
    "GEMNAME       gem name to check"
  end

  def execute
    gem_name = get_one_gem_name
    fetcher = Gem::SpecFetcher.fetcher

    spec_tuples = fetcher.detect(:latest) { |name_tuple|
        gem_name === name_tuple.name
    }

    if name_taken?(spec_tuples)
      Taken::Reporter.name_taken(gem_name)
    else
      Taken::Reporter.name_not_taken(gem_name)
    end
  end

  private

  def name_taken?(spec)
    spec.flatten.length > 0
  end
end
