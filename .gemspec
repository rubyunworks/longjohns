--- !ruby/object:Gem::Specification 
name: longfish
version: !ruby/object:Gem::Version 
  hash: 23
  prerelease: false
  segments: 
  - 0
  - 2
  - 0
  version: 0.2.0
platform: ruby
authors: 
- Thomas Sawyer
autorequire: 
bindir: bin
cert_chain: []

date: 2011-04-13 00:00:00 -04:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: clap
  prerelease: false
  requirement: &id001 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        hash: 3
        segments: 
        - 0
        version: "0"
  type: :runtime
  version_requirements: *id001
- !ruby/object:Gem::Dependency 
  name: rdazzle
  prerelease: false
  requirement: &id002 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        hash: 3
        segments: 
        - 0
        version: "0"
  type: :runtime
  version_requirements: *id002
- !ruby/object:Gem::Dependency 
  name: syckle
  prerelease: false
  requirement: &id003 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        hash: 3
        segments: 
        - 0
        version: "0"
  type: :development
  version_requirements: *id003
description: LongFish is RDoc template modeled after John Long's design the ruby-lang.org. It allows your Ruby application or library have a very Ruby look and feel.
email: ""
executables: 
- longfish
extensions: []

extra_rdoc_files: 
- README.rdoc
files: 
- .ruby
- bin/longfish
- lib/longfish/rdoc/generator.rb
- lib/longfish/rdoc/static/assets/favicon.ico
- lib/longfish/rdoc/static/assets/long/css/high.css
- lib/longfish/rdoc/static/assets/long/css/low.css
- lib/longfish/rdoc/static/assets/long/css/low_vision_high.css
- lib/longfish/rdoc/static/assets/long/css/low_vision_screen.css
- lib/longfish/rdoc/static/assets/long/css/low_vision_shared.css
- lib/longfish/rdoc/static/assets/long/css/print.css
- lib/longfish/rdoc/static/assets/long/css/screen.css
- lib/longfish/rdoc/static/assets/long/css/shared.css
- lib/longfish/rdoc/static/assets/long/img/blue-columns-bottom-home-page.jpg
- lib/longfish/rdoc/static/assets/long/img/blue-columns-home-page.jpg
- lib/longfish/rdoc/static/assets/long/img/blue-columns-top-home-page.jpg
- lib/longfish/rdoc/static/assets/long/img/blue-columns.jpg
- lib/longfish/rdoc/static/assets/long/img/bug.png
- lib/longfish/rdoc/static/assets/long/img/check.png
- lib/longfish/rdoc/static/assets/long/img/code-box-bottom-right.gif
- lib/longfish/rdoc/static/assets/long/img/code-box-top-left.gif
- lib/longfish/rdoc/static/assets/long/img/columns.jpg
- lib/longfish/rdoc/static/assets/long/img/download.gif
- lib/longfish/rdoc/static/assets/long/img/footer-background.jpg
- lib/longfish/rdoc/static/assets/long/img/header-background.jpg
- lib/longfish/rdoc/static/assets/long/img/logo-background.jpg
- lib/longfish/rdoc/static/assets/long/img/logo.gif
- lib/longfish/rdoc/static/assets/long/img/rb.png
- lib/longfish/rdoc/static/assets/long/img/shadow.jpg
- lib/longfish/rdoc/static/assets/long/img/site-links-background.gif
- lib/longfish/rdoc/static/assets/main.js
- lib/longfish/rdoc/static/assets/prettify.css
- lib/longfish/rdoc/static/assets/quicksearch.js
- lib/longfish/rdoc/template/class.rhtml
- lib/longfish/rdoc/template/class_context.rhtml
- lib/longfish/rdoc/template/file.rhtml
- lib/longfish/rdoc/template/file_context.rhtml
- lib/longfish/rdoc/template/index.rhtml
- lib/longfish/shomen/generator.rb
- lib/longfish/shomen/static/assets/favicon.ico
- lib/longfish/shomen/static/assets/jquery.js
- lib/longfish/shomen/static/assets/long/css/high.css
- lib/longfish/shomen/static/assets/long/css/low.css
- lib/longfish/shomen/static/assets/long/css/low_vision_high.css
- lib/longfish/shomen/static/assets/long/css/low_vision_screen.css
- lib/longfish/shomen/static/assets/long/css/low_vision_shared.css
- lib/longfish/shomen/static/assets/long/css/print.css
- lib/longfish/shomen/static/assets/long/css/screen.css
- lib/longfish/shomen/static/assets/long/css/shared.css
- lib/longfish/shomen/static/assets/long/img/blue-columns-bottom-home-page.jpg
- lib/longfish/shomen/static/assets/long/img/blue-columns-home-page.jpg
- lib/longfish/shomen/static/assets/long/img/blue-columns-top-home-page.jpg
- lib/longfish/shomen/static/assets/long/img/blue-columns.jpg
- lib/longfish/shomen/static/assets/long/img/bug.png
- lib/longfish/shomen/static/assets/long/img/check.png
- lib/longfish/shomen/static/assets/long/img/code-box-bottom-right.gif
- lib/longfish/shomen/static/assets/long/img/code-box-top-left.gif
- lib/longfish/shomen/static/assets/long/img/columns.jpg
- lib/longfish/shomen/static/assets/long/img/download.gif
- lib/longfish/shomen/static/assets/long/img/footer-background.jpg
- lib/longfish/shomen/static/assets/long/img/header-background.jpg
- lib/longfish/shomen/static/assets/long/img/logo-background.jpg
- lib/longfish/shomen/static/assets/long/img/logo.gif
- lib/longfish/shomen/static/assets/long/img/rb.png
- lib/longfish/shomen/static/assets/long/img/shadow.jpg
- lib/longfish/shomen/static/assets/long/img/site-links-background.gif
- lib/longfish/shomen/static/assets/main.js
- lib/longfish/shomen/static/assets/prettify.css
- lib/longfish/shomen/static/assets/prettify.js
- lib/longfish/shomen/static/assets/quicksearch.js
- lib/longfish/shomen/template/class.rhtml
- lib/longfish/shomen/template/class_context.rhtml
- lib/longfish/shomen/template/file.rhtml
- lib/longfish/shomen/template/file_context.rhtml
- lib/longfish/shomen/template/index.rhtml
- lib/longfish/shomen/template/method_context.rhtml
- lib/longfish/shomen.rb
- lib/longfish/version.rb
- lib/longfish.rb
- lib/rdoc/discover.rb
- Rakefile
- PROFILE
- README.rdoc
- NOTICE
- VERSION
has_rdoc: true
homepage: http://rubyworks.github.com/longfish
licenses: []

post_install_message: 
rdoc_options: 
- --title
- LongFish API
- --main
- README.rdoc
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      hash: 3
      segments: 
      - 0
      version: "0"
required_rubygems_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      hash: 3
      segments: 
      - 0
      version: "0"
requirements: []

rubyforge_project: longfish
rubygems_version: 1.3.7
signing_key: 
specification_version: 3
summary: Documentation format stylized after ruby-lang.org
test_files: []

