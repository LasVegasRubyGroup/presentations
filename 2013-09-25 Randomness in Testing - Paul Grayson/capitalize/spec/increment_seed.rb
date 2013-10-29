seed = File.read(".rspec-seed").to_i rescue 0
RSpec.configuration.seed = seed
srand seed+1 # eliminate interdependence between rspec seed and srand values

RSpec.configuration.after(:suite) do
  examples = RSpec.world.filtered_examples.values.flatten
  break if examples.any?(&:exception)
  File.write(".rspec-seed","#{seed+1}\n")
end
