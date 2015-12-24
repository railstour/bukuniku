class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  before_save :capitalize_name

  def capitalize_name
    self.name = name.split.map do |name_part|
      name_part.capitalize
    end.join(" ")
  end
end
