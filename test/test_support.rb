require_relative 'helper'

module Saddler
  module Reporter
    module Support
      class TestSupport < Test::Unit::TestCase
        target = Class.new do
          include ::Saddler::Reporter::Support
        end.new('')

        sub_test_case '.file_relative_path_string' do
          test 'absolute' do
            path = "#{Dir.pwd}/foo"
            expected = 'foo'
            assert do
              target.file_relative_path_string(path) == expected
            end
          end

          test 'relative' do
            path = './bar'
            expected = 'bar'
            assert do
              target.file_relative_path_string(path) == expected
            end
          end
        end
      end
    end
  end
end
