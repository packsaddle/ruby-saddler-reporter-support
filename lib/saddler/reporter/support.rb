require 'pathname'
require 'nori'
require 'saddler/reporter/support/version'

module Saddler
  module Reporter
    # Interface for saddler-reporter. And utilities for saddler-reporter
    module Support
      # Interface for saddler-reporter
      #
      # @param output [Object] output interface (defaults to: $stdout).
      #   Use StringIO for testing.
      def initialize(output)
        @output = output
      end

      # Interface for saddler-reporter
      #
      # @param messages [String] reporting message. checkstyle format.
      # @param options [Hash] options from saddler cli.
      #
      # @return [void]
      def report(messages, options) # rubocop:disable Style/UnusedMethodArgument
        @output.puts messages
      end

      # Parser from xml to Plain Old Ruby Object with Nori
      #
      # @example one file no error
      #   xml = <<-XML
      #   <?xml version='1.0' encoding='UTF-8'?>
      #   <checkstyle version='4.3'>
      #     <file name='/home/travis/build/jser/jser.github.io/_i18n/ja/_posts/2015/2015-09-16-react-0.14-eslint-1.4-es5.md'/>
      #   </checkstyle>
      #   XML
      #
      #   parse(xml)
      #   #=>
      #   {
      #     'checkstyle' => {
      #       'file' => {
      #         '@name' => '/home/travis/build/jser/jser.github.io/_i18n/ja/_posts/2015/2015-09-16-react-0.14-eslint-1.4-es5.md'
      #       },
      #       '@version' => '4.3'
      #     }
      #   }
      #
      # @example one foile one error
      #   xml = <<-XML
      #   <?xml version='1.0'?>
      #   <checkstyle>
      #     <file name='lib/example/travis_ci.rb'>
      #       <error column='120' line='7' message='Line is too long. [164/120]' severity='info' source='com.puppycrawl.tools.checkstyle.Metrics/LineLength'/>
      #     </file>
      #   </checkstyle>
      #   XML
      #
      #   parse(xml)
      #   #=>
      #   {
      #     'checkstyle' => {
      #       'file' => {
      #         'error' => {
      #           '@column' => '120',
      #           '@line' => '7',
      #           '@message' => 'Line is too long. [164/120]',
      #           '@severity' => 'info',
      #           '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/LineLength'
      #         },
      #         '@name' => 'lib/example/travis_ci.rb'
      #       }
      #     }
      #   }
      #
      # @example two files multi errors
      #   xml = <<-XML
      #   <?xml version='1.0'?>
      #   <checkstyle>
      #     <file name='example/invalid.rb'>
      #       <error line='3' column='100' severity='info' message='Line is too long. [187/100]' source='com.puppycrawl.tools.checkstyle.Metrics/LineLength'/>
      #     </file>
      #     <file name='lib/checkstyle_filter/git/cli.rb'>
      #       <error line='14' column='6' severity='info' message='Assignment Branch Condition size for diff is too high. [38.21/15]' source='com.puppycrawl.tools.checkstyle.Metrics/AbcSize'/>
      #       <error line='14' column='6' severity='info' message='Cyclomatic complexity for diff is too high. [9/6]' source='com.puppycrawl.tools.checkstyle.Metrics/CyclomaticComplexity'/>
      #       <error line='14' column='6' severity='info' message='Method has too many lines. [26/10]' source='com.puppycrawl.tools.checkstyle.Metrics/MethodLength'/>
      #       <error line='14' column='6' severity='info' message='Perceived complexity for diff is too high. [10/7]' source='com.puppycrawl.tools.checkstyle.Metrics/PerceivedComplexity'/>
      #       <error line='65' column='8' severity='info' message='Assignment Branch Condition size for file_element_error_line_no_in_modified? is too high. [16.16/15]' source='com.puppycrawl.tools.checkstyle.Metrics/AbcSize'/>
      #       <error line='65' column='8' severity='info' message='Method has too many lines. [14/10]' source='com.puppycrawl.tools.checkstyle.Metrics/MethodLength'/>
      #     </file>
      #   </checkstyle>
      #   XML
      #
      #   parse(xml)
      #   #=>
      #   {
      #     'checkstyle' => {
      #       'file' => [
      #         {
      #           'error' => {
      #             '@line' => '3',
      #             '@column' => '100',
      #             '@severity' => 'info',
      #             '@message' => 'Line is too long. [187/100]',
      #             '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/LineLength'
      #           },
      #           '@name' => 'example/invalid.rb'
      #         },
      #         {
      #           'error' => [
      #             {
      #               '@line' => '14',
      #               '@column' => '6',
      #               '@severity' => 'info',
      #               '@message' => 'Assignment Branch Condition size for diff is too high. [38.21/15]',
      #               '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/AbcSize'
      #             },
      #             {
      #               '@line' => '14',
      #               '@column' => '6',
      #               '@severity' => 'info',
      #               '@message' => 'Cyclomatic complexity for diff is too high. [9/6]',
      #               '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/CyclomaticComplexity'
      #             },
      #             {
      #               '@line' => '14',
      #               '@column' => '6',
      #               '@severity' => 'info',
      #               '@message' => 'Method has too many lines. [26/10]',
      #               '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/MethodLength'
      #             },
      #             {
      #               '@line' => '14',
      #               '@column' => '6',
      #               '@severity' => 'info',
      #               '@message' => 'Perceived complexity for diff is too high. [10/7]',
      #               '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/PerceivedComplexity'
      #             },
      #             {
      #               '@line' => '65',
      #               '@column' => '8',
      #               '@severity' => 'info',
      #               '@message' => 'Assignment Branch Condition size for file_element_error_line_no_in_modified? is too high. [16.16/15]',
      #               '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/AbcSize'
      #             },
      #             {
      #               '@line' => '65',
      #               '@column' => '8',
      #               '@severity' => 'info',
      #               '@message' => 'Method has too many lines. [14/10]',
      #               '@source' => 'com.puppycrawl.tools.checkstyle.Metrics/MethodLength'
      #             }
      #           ],
      #           '@name' => 'lib/checkstyle_filter/git/cli.rb'
      #         }
      #       ]
      #     }
      #   }
      #
      # @param xml [String] xml string
      #
      # @return [Object] parsed
      #
      # @see ::Nori#parse
      # @see https://github.com/savonrb/nori
      def parse(xml)
        Nori
          .new(parser: :rexml)
          .parse(xml)
      end

      # @example absolute path
      #   Dir.pwd #=> '/foo/bar'
      #   file_relative_path_string('/foo/bar/baz') #=> 'baz'
      #
      # @example relative path
      #   file_relative_path_string('./bar') #=> 'bar'
      #
      # @param file_name [String, #to_str] file path
      #
      # @return [String] file's relative path string from current
      def file_relative_path_string(file_name)
        if Pathname.new(file_name).absolute?
          Pathname.new(file_name).relative_path_from(Pathname.new(Dir.pwd)).to_s
        else
          Pathname.new(file_name).relative_path_from(Pathname.new('.')).to_s
        end
      end
    end
  end
end
