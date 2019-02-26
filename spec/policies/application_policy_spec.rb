describe ApplicationPolicy do
  subject { described_class }
  
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:employee_user) { FactoryBot.create(:employee_user) }

  permissions :index?, :create?, :update?, :destroy? do
    it "defaults to unauthorized" do
      expect(subject).to_not permit(admin_user)
      expect(subject).to_not permit(employee_user)
    end
  end
end