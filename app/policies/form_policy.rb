class FormPolicy < ApplicationPolicy
  def index?
    user.present?
  end
  
  def create?
    index?
  end

  def update?
    user.admin? || (user.present? && record.user == user)
  end

  def destroy?
    update?
  end
end