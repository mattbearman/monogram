# frozen_string_literal: true

class Monogram
  class Config
    COLOURS = %w[#B91C1C #B45309 #047857 #1D4ED8 #6D28D9].freeze
    UPPERCASE = true
    SHAPE = Avatar::CIRCLE

    attr_accessor :colours, :uppercase, :shape
    alias colors= colours=

    def initialize
      reset!
    end

    def reset!
      @colours = COLOURS
      @uppercase = UPPERCASE
      @shape = SHAPE
    end
  end
end
