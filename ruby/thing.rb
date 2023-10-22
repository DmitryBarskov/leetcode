# frozen_string_literal: true

# https://www.codewars.com/kata/5571d9fc11526780a000011a

# imported to handle any plural/singular conversions
require 'active_support/core_ext/string'

# can define boolean methods on an instance
module BooleanMethods
  # stores boolean methods' calls
  class BooleanBuilder
    def initialize(boolean_attributes, value)
      @boolean_attributes = boolean_attributes
      @value = value
    end

    def method_missing(method, *_args)
      @boolean_attributes[method] = @value
    end

    def respond_to_missing?(_name, _include_all = false)
      true
    end
  end

  def is_a # rubocop:disable Naming/PredicateName
    BooleanBuilder.new(boolean_attributes, true)
  end

  def is_not_a # rubocop:disable Naming/PredicateName
    BooleanBuilder.new(boolean_attributes, false)
  end

  def method_missing(name, *args)
    return super unless respond_to_missing?(name)

    boolean_attributes[name.to_s.delete_suffix('?').to_sym]
  end

  def respond_to_missing?(name, include_all = false)
    attr_name = name.to_s.delete_suffix('?').to_sym
    (name.ends_with?('?') && boolean_attributes.key?(attr_name)) || super
  end

  private

  def boolean_attributes
    @boolean_attributes ||= {}
  end
end

# can define number of child things
# when more than 1, an array is created
module ChildThings
  class ChildArray < Array
    def each(&)
      super do |item|
        item.instance_eval(&)
      end
    end
  end

  class ChildrenBuilder
    def initialize(children, count)
      @children = children
      @count = count
    end

    def method_missing(method, *_args)
      @children[method] = if @count == 1
                            build_single_child(method)
                          else
                            ChildArray.new(@count) do
                              build_single_child(method)
                            end
                          end
    end

    def respond_to_missing?(_name, _include_all = false)
      true
    end

    private

    def build_single_child(type)
      name = type.to_s.singularize
      Thing.new(name).tap do |child|
        child.is_a.public_send(name)
      end
    end
  end

  def has(number)
    ChildrenBuilder.new(children, number)
  end

  alias having has

  def method_missing(name, *args)
    return super unless children.key?(name)

    children[name]
  end

  def respond_to_missing?(name, include_all = false)
    children.key?(name) || super
  end

  private

  def children
    @children ||= {}
  end
end

# can define properties on a per instance level
# jane.is_the.parent_of.joe
# jane.parent_of # => 'joe'
module Properties
  class PropertyBuilder
    class ValueBuilder
      def initialize(thing, properties, key)
        @thing = thing
        @properties = properties
        @key = key
      end

      def method_missing(method, *_args)
        @properties[@key] = method.to_s
        @thing
      end

      def respond_to_missing?(_name, _include_all = false)
        true
      end
    end

    def initialize(thing, properties)
      @thing = thing
      @properties = properties
    end

    def method_missing(method, *_args)
      ValueBuilder.new(@thing, @properties, method)
    end

    def respond_to_missing?(_name, _include_all = false)
      true
    end
  end

  def is_the # rubocop:disable Naming/PredicateName
    PropertyBuilder.new(self, properties)
  end

  alias being_the is_the
  alias and_the is_the

  def method_missing(method, *args)
    return super unless properties.key?(method)

    properties[method]
  end

  def respond_to_missing?(name, include_all = false)
    properties.key?(name) || super
  end

  private

  def properties
    @properties ||= {}
  end
end

# can define methods
# jane.can.speak('spoke') do |phrase|
#   "#{name} says: #{phrase}"
# end
module Methods
  # stores definitions
  class MethodDefinition
    def initialize(thing, method_calls)
      @thing = thing
      @method_calls = method_calls
    end

    def method_missing(method, *args, &)
      history_key = args.first
      method_calls = @method_calls
      method_calls[history_key.to_sym] ||= [] unless history_key.nil?

      # @thing.define_singleton_method(method, &block)
      @thing.define_singleton_method(method) do |*m_args|
        instance_exec(*m_args, &).tap do |result|
          method_calls[history_key.to_sym] << result unless history_key.nil?
        end
      end
    end

    def respond_to_missing?(_name, _include_all = false)
      true
    end
  end

  def can
    MethodDefinition.new(self, method_calls)
  end

  def method_missing(method, *args, &)
    return super unless method_calls.key?(method)

    method_calls[method]
  end

  def respond_to_missing?(name, include_all = false)
    method_calls.key?(name) || super
  end

  private

  def method_calls
    @method_calls ||= {}
  end
end

# solution
class Thing
  include BooleanMethods
  include ChildThings
  include Properties
  include Methods

  attr_reader :name

  def initialize(name)
    @name = name
  end
end
