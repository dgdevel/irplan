
task default: %w[run]

task :run do
  sh "env RACK_ENV=production ~/.gem/ruby/2.4.0/bin/rackup"
end

task :deps do
  sh "exec bundler install --path ~/.gem"
end

task :dev do
  sh "exec ~/.gem/ruby/2.4.0/bin/rerun ~/.gem/ruby/2.4.0/bin/rackup"
end
