require "#{Dir.pwd}/lib/client"
require 'rspec'

Given("I have a new instance of client") do
  @vc = Client.new()
end

When("I execute the connection") do
   @response = @vc.execute_connection
end

Then("I get a response back") do
  expect(@response.code).to eq 200
  expect(@response.body).to be_a String
end

When("I configure the connection session") do
  @sample1_session = { url: 'https://www.google.com', header: {}, method: :get }

  @vc.session.url = @sample1_session.dig :url
  @vc.session.header = @sample1_session.dig :header
  @vc.session.method = @sample1_session.dig :method
end

Then("the session is configured") do
  expect(@vc.session.url).to eq @sample1_session.dig :url
  expect(@vc.session.header).to eq @sample1_session.dig :header
  expect(@vc.session.method).to eq @sample1_session.dig :method
end
