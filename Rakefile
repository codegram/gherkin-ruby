# encoding: utf-8
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['./test/**/*_test.rb']
end

desc "Regenerate Gherkin-ruby lexer and parser."
task :regenerate do
  has_rex  = `which rex`
  has_racc = `which racc`

  if has_rex && has_racc
    `rex lib/gherkin_ruby/parser/gherkin.rex -o lib/gherkin_ruby/parser/lexer.rb`
    `racc #{'--debug' if ENV['DEBUG_RACC']} lib/gherkin_ruby/parser/gherkin.y -o lib/gherkin_ruby/parser/parser.rb`
  else
    puts "You need both Rexical and Racc to do that. Install them by doing:"
    puts
    puts "\t\tgem install rexical"
    puts "\t\tgem install racc"
    puts
    puts "Or just type `bundle install`."
  end
end

task :default => [:regenerate, :test]
