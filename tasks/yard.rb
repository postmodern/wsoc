require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  t.options = [
    '--protected',
    '--files', 'History.rdoc',
    '--title', 'Web Spider Obstacle Course (WSOC)'
  ]
end

task :docs => :yard
