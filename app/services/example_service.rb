# frozen_string_literal: true

class ExampleService
  def initialize(option = {})
    @a = option[:a]
    @b = option[:b]
  end

  def execute
    a + b
  end

  private

  def a
    @a ||= 1
  end

  def b
    @b ||= 1
  end
end
