require 'rdazzle/generator'
require 'rdazzle/components/prettify'
#require 'rdazzle/components/subversion'
require 'rdazzle/components/github'

module Longfish

  # RDoc generator provided the context to generate
  # rdoc-based templates.
  class RDocGenerator < RDazzle::Generator

    #include RDazzle::Subversion
    include RDazzle::Prettify
    include RDazzle::GitHub

    #
    def self.template_name
      'longfish'
    end

    #
    def path
      @path ||= Pathname.new(__FILE__).parent
    end

    #
    def site_homepage
      metadata.homepage
    end

    #
    def site_community
      metadata.mailinglist || metadata.wiki
    end

    #
    def site_repository
      metadata.development
    end

    #
    def site_news
      metadata.blog
    end

    #

    def index_title
      @index_title ||= parse_index_header[0]
    end

    #

    def index_description
      @index_description ||= parse_index_header[1]
    end

    # TODO: Generalize for all generators (?)

    def parse_index_header
      if options.main_page && main_page = files_toplevel.find { |f| f.full_name == options.main_page }
        desc = main_page.description
        if md = /^\s*\<h1\>(.*?)\<\/h1\>/.match(desc)
          title = md[1]
          desc = md.post_match
        else
          title = options.main_page
        end
      else
        title = options.title
        desc = "This is the API documentation for '#{title}'."
      end
      return title, desc
    end

  end

end

