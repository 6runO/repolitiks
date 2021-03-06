class MarcadoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    is_owner?
  end

  private

  def is_owner?
    record.user == user
  end
end
