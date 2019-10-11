class CategoryPolicy < ApplicationPolicy
  def show?
    is_admin?
  end

  def index?
    is_admin?
  end

  def new?
    is_admin?
  end

  def create?
    is_admin?
  end


end
