# spec/spec_helper.rb
# frozen_string_literal: true

RSpec.configure do |config|
  # RSpec configuration options go here
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/' # Ignora os arquivos de teste
  add_filter '/config/' # Ignora arquivos de configuração
  add_filter '/vendor/' # Ignora arquivos de dependências
  # Você pode adicionar mais filtros conforme necessário
end
