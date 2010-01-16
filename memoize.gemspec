require 'rubygems'

spec = Gem::Specification.new do |gem|
   gem.name      = 'memoize'
   gem.version   = '1.3.1'
   gem.author    = 'Daniel J. Berger'
   gem.license   = 'Artistic 2.0'
   gem.email     = 'djberg96@gmail.com'
   gem.homepage  = 'http://www.rubyforge.org/projects/shards'
   gem.platform  = Gem::Platform::RUBY
   gem.summary   = 'Speeds up methods at the cost of memory (or disk space)'
   gem.test_file = 'test/test_memoize.rb'
   gem.has_rdoc  = true
   gem.files     = Dir['**/*'].reject{ |f| f.include?('CVS') }

   gem.rubyforge_project = 'shards'
   gem.extra_rdoc_files  = ['MANIFEST', 'README', 'CHANGES']
   
   gem.add_development_dependency('test-unit', '>= 2.0.2')

   gem.description = <<-EOF
      The memoize library allows you to cache methods for faster lookup.
      Cached results can either be stored in memory (the default) or to
      a file.
   EOF
end

Gem::Builder.new(spec).build
