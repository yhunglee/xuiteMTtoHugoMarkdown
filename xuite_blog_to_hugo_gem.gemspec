Gem::Specification.new do |s|
  s.name = %q{xuite_blog_to_hugo_gem}
  s.authors = ["Howard Lee"]
  s.licenses = ["MIT"]
  s.email = 'contact-me@howardlee.cloud'
  s.version = "0.0.1"
  s.date = %q{2020-01-04}
  s.summary = %q{xuite_blog_to_hugo_gem is the converter from xuite blog .mt file to hugo .md }
  s.files = Dir['lib/**/*.rb']
  
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/yhunglee/xuiteMTtoHugoMarkdown'
  s.executables = ["xuite_blog_to_hugo_gem"]

  # specify any dependencies here;
  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'reverse_markdown'
end