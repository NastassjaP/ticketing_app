class AdminPolicy < ApplicationPolicy
  
  def show?
    is_admin?
  end

end
