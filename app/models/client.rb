class Client < ApplicationRecord
  validates :tenant_name, uniqueness: true
  after_create :create_tenant

  def create_tenant
    Apartment::Tenant.create(tenant_name)
  end
end
