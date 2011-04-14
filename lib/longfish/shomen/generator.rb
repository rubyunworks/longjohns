require 'longfish/version'

require 'yaml'
require 'erb'
require 'fileutils'

#$NOWRITE = true

#
module Longfish
module Shomen

  #
  # TODO: Section support
  class Generator

    # 
    DIRECTORY = File.dirname(__FILE__)

    # Documentation table
    attr :table

    # Output directory (defaults to "doc")
    attr :output

    # File to render on index page.
    attr :readme

    # Initialize new ShomenGenerator.
    #
    # shomen_document - String or IO object to pass to YAML.load.
    #
    def initialize(shomen_document, options={})
      @table     = YAML.load(shomen_document)
      @output    = options[:output] || 'doc'
      @readme    = options[:readme]
      @templates = {}
    end

    #
    def template(name)
      @templates[name] ||= ERB.new(File.read(File.join(DIRECTORY, "template/#{name}.rhtml")))
    end

    # Generate documentation.
    def generate
      parse_readme
      generate_index
      @table.each do |name, entry|
        type = entry['!']
        case type
        when 'file'
          context = RenderingContext.new(self, name, entry)
          result  = template('file').result(context._binding)
          save(name, result)
        when 'class', 'module'
          context = RenderingContext.new(self, name, entry)
          result  = template('class').result(context._binding)
          save(name, result)
        when 'script'
          context = RenderingContext.new(self, name, entry)
          result  = template('script').result(context._binding)
          save(name, result)
        end
      end
      generate_static
    end

    #
    def generate_index
      context = RenderingContext.new(self, 'index', {})
      result  = template('index').result(context._binding)
      save('index', result)
    end

    #
    def generate_static
      static_files = Dir.glob(File.join(DIRECTORY, "static", "*"))
      static_files.each do |entry|
        fileutils.cp_r(entry, output)
      end
    end

    # Convert entry name into acceptable URL.
    def url(name)
      file = name.to_s
      file = file.gsub('::', '~')
      file = file.gsub('/' , '~')
      file + '.html'
    end

    # DEPRECATE
    alias :path :url

    #
    def save(name, result)
      file = File.join(output, url(name))
      fileutils.mkdir_p(File.dirname(file))
      if $NOWRITE
        puts "[noop] write #{file}"
      else
        File.open(file, 'w'){ |f| f << result }
      end
    end

    #
    def fileutils
      if $NOWRITE
        FileUtils::NoWrite
      else
        FileUtils
      end
    end

    # Parse README file, if present.
    def parse_readme
      @table['(metadata)'] ||= {}
      @table['(metadata)']['readme'] = @table['(metadata)']['description']

      #if @readme && File.exist?(@readme)
      readme = table[@readme]
      if readme  && readme['!'] == 'file'
        require 'malt'
        text = Malt.render(:text=>readme['text'], :file=>readme['name'])
        if md = /^\s*(.*?)\<h2\>/m.match(text)
          @table['(metadata)']['readme_title']  = md[1]  # TODO: use diffenrt field ?
          @table['(metadata)']['readme'] = "<h2>" + md.post_match
        end
      end
      #@readme_title ||= @table['(metadata)']['title']
    end

    # ERB Rendering context.
    class RenderingContext
      # Master source document.
      attr :table

      # Entry key (fully qualified name).
      attr :key

      #
      def initialize(engine, key, entry, options={})
        @engine = engine
        @table  = engine.table
        @key    = key
        @entry  = entry

        @prefix = options[:prefix].to_s
#p key, entry
      end

      # Return table entry type (i.e. the "!" setting).
      def type
        @entry['!']
      end

      #
      def name
        @entry['name']
      end

      # Metadata table entry.
      def metadata
        @table['(metadata)'] || {}
      end

      # README markup (using Malt).
      def readme
        metadata['readme']
      end

      # Returns URL for source object.
      def url(entry_name)
        @engine.path(entry_name)
      end

      # TODO: Rename to `relative_prefix`.
      def rel_prefix
        ary = ['..'] * @engine.path(@key).count('/')
        dir = ary.join("/")
        dir = "." if dir.empty?
        dir
      end

      #
      def include_template(file, key=nil, entry=nil, options={})
        erb = ERB.new(File.read(File.join(DIRECTORY, "template/#{file}")))
        if key
          context = RenderingContext.new(@engine, key, entry, options)
          erb.result(context._binding)
        else
          erb.result(_binding)
        end
      end

      # Override built-in #methods method.
      def methods
        @entry['methods']
      end

      # Missing method fallsback to table entry lookup.
      def method_missing(s, *a, &b)
        @entry[s.to_s]
      end

      # Process comments thru markup format (using Malt library).
      def markup(text)
        if fmt = metadata['markup']
          require 'malt'
          Malt.render(:text=>text.to_s, :type=>fmt)
        else
          text.to_s
        end
      end

      # TODO
      def highlight(source_code)
        source_code
      end

      # Returns Binding.
      def _binding
        binding
      end

      # HTML escape.
      def h(string)
        string.gsub(/&/, "&amp;").gsub(/\"/, "&quot;").gsub(/>/, "&gt;").gsub(/</, "&lt;")
      end
    end

  end

end
end

