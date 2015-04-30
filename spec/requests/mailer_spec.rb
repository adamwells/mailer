require 'rails_helper'

describe 'mailer api' do

  before(:all) do
    ActionMailer::Base.deliveries.clear
    post "/emails", {
      to: "markov@appacademy.io",
      body: "I hope you like testing",
      subject: "Test Email"
    }
  end

  it 'sends emails' do
    expect(ActionMailer::Base.deliveries.length).to eq(1)
  end

  it 'sets the recipient' do
    expect(ActionMailer::Base.deliveries.first.to.first).to eq("markov@appacademy.io")
  end

  it 'sets the body' do
    expect(ActionMailer::Base.deliveries.first.parts.first.body).to include("I hope you like testing")
  end

  it 'sets the subject' do
    expect(ActionMailer::Base.deliveries.first.subject).to eq("Test Email")
  end

  it 'sends both text and html versions' do
    expect(ActionMailer::Base.deliveries.first.parts.length).to eq(2)
  end
end
