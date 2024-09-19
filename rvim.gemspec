require_relative "lib/ruvim/version"

Gem::Specification.new do |spec|
  spec.name = "ruvim"
  spec.version = Ruvim::VERSION
  spec.authors = ["bugloper"]
  spec.email = ["bugloper@gmail.com"]

  spec.summary = "A Ruby-based NeoVim clone for seamless text editing."
  spec.description = "RVim is a NeoVim clone written in Ruby, offering similar features and configurations. It aims to provide a powerful and customizable text editing experience with the flexibility of Ruby scripting." # rubocop:disable Layout/LineLength
  spec.homepage = "https://github.com/bugloper/ruvim"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bugloper/ruvim"
  spec.metadata["changelog_uri"] = "https://github.com/bugloper/ruvim/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.metadata["rubygems_mfa_required"] = "true"
end
