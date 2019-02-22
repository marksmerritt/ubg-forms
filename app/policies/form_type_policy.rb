class FormTypePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end