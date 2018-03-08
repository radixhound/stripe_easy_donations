# frozen_string_literal: true

##
# PageContent is a simple way of managing the content via
# yml file. The content is loaded from config/content.yml
#
# In your controller you can use it like this:
#
#   @page = PageContent.get_page(:index)
#
# In production the data is cached in the class but in development
# it will get reloaded each time so you can quickly edit and test
#
class PageContent < HashWithIndifferentAccess
  class << self
    attr_writer :source_data
  end

  ##
  # Default the file location to be 'config/content.yml'
  # but allow it to be overridden for testing
  def self.source_data
    @source_data || File.read(Rails.root.join('config', 'content.yml'))
  end

  ##
  # Retrieve the page from the instance
  #
  def self.get_page(attribute)
    instance.fetch(attribute, {}).reverse_merge(instance[:all])
  end

  def self.instance
    if Rails.env.production?
      @__instance__ ||= new(source_data)
    else
      new(source_data)
    end
  end

  ##
  # Get the content from the yml file and put it into
  # a class instance variable.
  #
  def initialize(source_data)
    super YAML.load(source_data)
  end
end
