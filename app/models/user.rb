# frozen_string_literal: true

class User < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :set_default_role, if: :new_record?
  enum role: %i[user admin]

  def set_default_role
    self.role ||= :user
  end
end
