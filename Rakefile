require 'rake'
require 'rake/testtask'
require 'rbconfig'
include Config

namespace :gem do
  desc 'Build the memoize gem'
  task :build do
    spec = eval(IO.read('memoize.gemspec'))
    Gem::Builder.new(spec).build
  end

  desc 'Install the memoize library'
  task :install => [:build] do
    file = Dir['*.gem'].first
    sh 'gem install #{file}'
  end
end

namespace :example do
  desc 'Run the fibonacci example & benchmarks'
  task :fib do
    ruby '-Ilib examples/example_fibonacci.rb'
  end

desc 'Run the memoize example & benchmarks'
  task :memoize do
    ruby '-Ilib examples/example_memoize.rb'
  end
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.verbose = true
  t.warning = true
end
