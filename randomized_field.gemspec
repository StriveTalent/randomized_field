lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "randomized_field/version"

Gem::Specification.new do |spec|
  spec.name          = "randomized_field"
  spec.version       = RandomizedField::VERSION
  spec.authors       = ["Jesse Farmer"]
  spec.email         = ["jesse@strive.co"]

  spec.summary       = "An ActiveRecord module to populate a database field with a unique, randomly-generated string."
  spec.description   = "RandomizedField is a simple ActiveRecord module that populates a field with a unique randomly-generated string.  This is useful for generating one-off tokens or creating a non-incrementing unique ID."
  spec.homepage      = "http://github.com/strivetalent/randomized_field"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.2.2"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.59"
  spec.add_development_dependency "rubocop-rspec", "~> 1.30"
  spec.add_development_dependency "shoulda-matchers", "~> 3.1"
  spec.add_development_dependency "sqlite3"
end
