# frozen_string_literal: true

require_relative 'monogram/avatar'
require_relative 'monogram/config'

class Monogram
  @@config = Config.new

  def initialize(initials: nil, name: nil, background: nil, shape: nil)
    @initials = initials
    @name = name
    @background = background
    @shape = shape

    validate_arguments
  end

  def to_s
    avatar.svg
  end

  def data_url
    avatar.data_url
  end

  def self.svg(**options)
    new(**options).to_s
  end

  def self.data_url(**options)
    new(**options).data_url
  end

  def self.config
    @@config
  end

  def self.configure
    yield @@config
  end

  private

  attr_accessor :name

  def avatar
    @avatar ||= Avatar.new(initials: initials, background: background, shape: shape)
  end

  def validate_arguments
    raise ArgumentError, 'either `initials:` or `name:` must be specified' unless @name || @initials
    raise ArgumentError, "`shape:` '#{shape}' is invallid, must be one of #{Avatar::SHAPES}" unless Avatar::SHAPES.include?(shape)
  end

  def config
    @@config
  end

  def initials
    @initials ||= initials_from_name

    return @initials.upcase if config.uppercase

    @initials
  end

  def initials_from_name
    name.split.map { |n| n[0] }.join
  end

  def background
    @background ||= background_for_initials
  end

  def background_for_initials
    Random.srand(initials_seed)
    index = (rand * config.colours.length).floor
    config.colours[index]
  end

  def initials_seed
    initials.downcase.chars.map(&:ord).sum
  end

  def shape
    @shape ||= config.shape
  end
end

def Object.const_missing(name)
  if name == :Supertramp
    warn '[DEPRECIATION WARNING] The Supertramp constant is deprecated and will be removed in version 1.0. Please use Monogram instead.'

    Monogram
  else
    super
  end
end
