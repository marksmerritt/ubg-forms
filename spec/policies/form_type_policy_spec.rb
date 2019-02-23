describe FormTypePolicy do
  subject { described_class }
  
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:employee_user) { FactoryBot.create(:employee_user) }

  permissions :index?, :create?, :destroy? do
    it "grants access if admin is present" do
      expect(subject).to permit(admin_user, FormType.new)
    end

    it "denies access if admin is not present" do
      expect(subject).to_not permit(employee_user, FormType.new)
    end
  end
end