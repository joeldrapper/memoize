require 'rubygems'

# Build the gem with the 'rake gem:build' command.

Gem::Specification.new do |spec|
  spec.name      = 'memoize'
  spec.version   = '1.3.2'
  spec.author    = 'Daniel J. Berger'
  spec.license   = 'Artistic 2.0'
  spec.email     = 'djberg96@gmail.com'
  spec.homepage  = 'http://www.rubyforge.org/projects/shards'
  spec.platform  = Gem::Platform::RUBY
  spec.summary   = 'Speeds up methods at the cost of memory (or disk space)'
  spec.test_file = 'test/test_memoize.rb'
  spec.has_rdoc  = true
  spec.files     = Dir['**/*'].reject{ |f| f.include?('git') }

  spec.rubyforge_project = 'shards'
  spec.extra_rdoc_files  = ['MANIFEST', 'README', 'CHANGES']
   
  spec.add_development_dependency('test-unit', '>= 2.0.2')

  spec.description = <<-EOF
    The memoize library allows you to cache methods for faster lookup.
    Cached results can either be stored in memory (the default) or to
    a file.
  EOF
end
