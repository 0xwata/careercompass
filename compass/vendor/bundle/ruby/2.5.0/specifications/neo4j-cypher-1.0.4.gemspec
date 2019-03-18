# -*- encoding: utf-8 -*-
# stub: neo4j-cypher 1.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "neo4j-cypher".freeze
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andreas Ronge".freeze]
  s.date = "2014-05-12"
  s.description = "This gem is used in the JRuby neo4j gem but should work on any Ruby implementation since it simply\ntranslate a Ruby block (the dsl) to a cypher string.\n".freeze
  s.email = "andreas.ronge@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "http://github.com/andreasronge/neo4j-cypher/tree".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--quiet".freeze, "--title".freeze, "Neo4j::Cypher".freeze, "--line-numbers".freeze, "--main".freeze, "README.rdoc".freeze, "--inline-source".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubyforge_project = "neo4j-cypher".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A Ruby DSL for Cypher - the Neo4j Graph Query Language".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version
end
