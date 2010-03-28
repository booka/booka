

if RAILS_ENV == 'development'
  puts "DEBUG IN TRANSLATION (only development)"
  
  require 'yaml'

  module I18n
    class << self
      alias :old_translate :translate

      def translate(key, options = {})
        begin
          scope = options[:scope] ? (options[:scope].respond_to?(:join) ? options[:scope].join('.') : options[:scope].to_s) : ''
          ActiveRecord::Base.logger.debug "TRANSLATE: #{key} - scope: #{scope}"
        rescue Exception => e
          ActiveRecord::Base.logger.debug "TRANSLATE: #{e.message}"
        end
        old_translate(key, options)
      end

      def t(key, options = {})
        translate(key, options)
      end
    end
  end
  
end