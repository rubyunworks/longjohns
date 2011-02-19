puts "RDoc found Longfish template" #if $DEBUG

begin
  require "rubygems"
  gem "rdoc", ">= 2.4.2"
  require "rdoc/rdoc"
rescue Exception
  warn "Longfish requires RDoc v2.4.2 or greater."
end

require 'longfish/generator'

RDoc.generator_option('longfish') do
  Longfish
end

