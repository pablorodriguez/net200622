# frozen_string_literal: true

# authorization policy for Home
class HomePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def admin?
    user.has_role? :admin
  end
end
