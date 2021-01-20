require_relative "piece"
require "singleton"

class NullPiece
    include Singleton
    def initialize
    end
end