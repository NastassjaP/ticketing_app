class EventPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def new?
    is_admin?
  end

  def create?
    is_admin?
  end


end
