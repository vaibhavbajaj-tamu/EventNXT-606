# frozen_string_literal: true

module Doorkeeper
  module VERSION
    # Semantic versioning
    MAJOR = 5
    MINOR = 5
    TINY = 4
    PRE = nil

    # Full version number
    STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
  end
end
