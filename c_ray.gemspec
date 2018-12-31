# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'c_ray/version'

Gem::Specification.new do |spec|
  spec.name          = 'c_ray'
  spec.version       = CRay::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ['Eduard Thamm']
  spec.email         = ['eduard.thamm@thammit.at']

  spec.summary       = 'Bridging the gap between cucumber and XRay'
  spec.description   = 'This gem helps practioners of BDD to manage their Scenarios in XRay. This comes at the cost of file structure but enables more businessy user to interact with scenarios in ticket style.'
  spec.homepage      = 'https://github.com/edthamm/c_ray'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'cucumber', '~> 3.1.2'

  spec.add_development_dependency 'aruba', '~> 0.14'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'guard', '~> 2.15'
  spec.add_development_dependency 'guard-bundler', '~> 2.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'guard-rubocop', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.61'
end
