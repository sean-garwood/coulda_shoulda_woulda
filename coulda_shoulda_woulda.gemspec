require_relative 'lib/coulda_shoulda_woulda/version'

Gem::Specification.new do |spec|
  spec.name = 'coulda_shoulda_woulda'
  spec.version = CouldaShouldaWoulda::VERSION
  spec.authors = ['sean-garwood']
  spec.email = ['seansgarwood@gmail.com']

  spec.summary = <<~SUMMARY
    So much to do, so little time. Prioritize projects based on your current mood.
  SUMMARY
  spec.description = <<~DESCRIPTION
    Store projects that you are working on in [csv].
    Each row in [csv] must have exactly four fields, separated by a comma:
    1. Name of the project
    2. `coulda`: your capacity to complete the project quickly.
    3. `shoulda`: the necessity of completing the project.
    4. `woulda`: your desire to work on the project.

    The last three fields must have values in the inclusive range (1..10).
  DESCRIPTION
  spec.homepage = 'https://github.com/sean-garwood/coulda_shoulda_woulda'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.4.0' # for `it` keyword support

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['souce_code_uri'] = 'https://github.com/sean-garwood/coulda_shoulda_woulda'
  spec.metadata['changelog_uri'] = 'https://github.com/sean-garwood/coulda_shoulda_woulda/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # TODO
  # Specify which files should be added to the gem when it is released.
  # `git ls-files -z` loads the files in the RubyGem that have been added into
  # git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__,
                                             err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .rubocop.yml])
    end
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Colors
  spec.add_dependency 'pastel', '~> 0.8'

  spec.add_development_dependency 'irb', '~> 1.17'
  spec.add_development_dependency 'minitest', '~> 6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.84'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.39'
end
