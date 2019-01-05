# frozen_string_literal: true

RSpec.shared_examples 'a repository' do |repository_class|
  subject { repository_class.new }
  it { is_expected.to respond_to(:save).with(1).argument }
  it { is_expected.to respond_to(:find_by_id).with(1).argument }
  it { is_expected.to respond_to(:find_all).with(0).argument }
  it { is_expected.to respond_to(:exists?).with(1).argument }
  it { is_expected.to respond_to(:delete).with(1).argument }
  it { is_expected.to respond_to(:count).with(0).argument }

  context '.initialize' do
    subject { repository_class }
    it { is_expected.to respond_to(:new).with(0..1).arguments }
  end
end
