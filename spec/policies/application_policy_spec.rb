describe ApplicationPolicy do
  subject { described_class }

  let(:employee_user) { FactoryBot.build_stubbed(:employee_user) }

  permissions :index?, :create?, :update?, :destroy? do
    it "only grants access to admins by default" do
      expect(subject).to_not permit(employee_user)
    end
  end
end