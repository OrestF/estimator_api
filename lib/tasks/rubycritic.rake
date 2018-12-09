require 'rubycritic/rake_task'

RubyCritic::RakeTask.new do |task|
  # Name of RubyCritic task.
  task.name = 'find_sins'

  excluded_files = %w[
    app/jobs/file1.rb
    app/jobs/file2.rb
  ]

  task.paths = FileList['app/**/*.rb', 'lib/**/*.rb'] - excluded_files

  # You can pass all the options here in that are shown by "rubycritic -h" except for
  # "-p / --path" since that is set separately. Defaults to ''.
  task.options = ''

  # Defaults to false
  task.verbose = true
end
