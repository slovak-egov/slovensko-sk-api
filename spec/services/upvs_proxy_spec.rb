require 'rails_helper'

# NOTE: requires any UPVS technical account

RSpec.describe UpvsProxy, :sts do
  let(:properties) { UpvsEnvironment.properties(sub: corporate_body_subject) }

  subject { described_class.new(properties) }

  describe '.new' do
    it 'creates UPVS proxy' do
      expect(subject).to be_an UpvsProxy
    end
  end

  describe '#eks' do
    it 'returns EKS service' do
      expect(subject.eks).to be_a sk.gov.schemas.edesk.eksservice._1.IEKSService
    end
  end

  describe '#ez' do
    it 'returns EZ service' do
      expect(subject.ez).to be_a sk.gov.schemas.servicebus.service._1_0.IServiceBus
    end
  end

  describe '#iam' do
    it 'returns IAM service' do
      expect(subject.iam).to be_a sk.gov.schemas.identity.service._1_7.IdentityServices
    end
  end

  describe '#sktalk' do
    it 'returns SKTalk service' do
      expect(subject.sktalk).to be_a sk.gov.egov.iservice.IService
    end
  end
end
