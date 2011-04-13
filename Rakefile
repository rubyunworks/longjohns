name    = "longfish"
version = File.read('VERSION').strip

desc "generate and install gem"
task :gem do
  sh "pom gemspec --force"
  sh "gem build .gemspec"
  sh "mv #{name}-#{version}.gem pkg/"
  sh "gem install pkg/#{name}-#{version}.gem"
end

