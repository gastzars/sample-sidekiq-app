require 'spec_helper'

RSpec.describe ExampleWorker do
  it { is_expected.to be_processed_in :default }
  # for more rspec-sidekiq matcher check at https://github.com/philostler/rspec-sidekiq
  # gas.
end
