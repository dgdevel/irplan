
task default: %w[run]

task :run do
  sh "env RACK_ENV=production rackup"
end

task :deps do
  sh "exec bundler install --path ~/.gem"
end

task :dev do
  sh "exec rerun rackup"
end
