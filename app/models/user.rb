class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  after_initialize :set_default_values



    def mood
      if (!self.nausea.nil? && !self.happiness.nil?)
        self.nausea > self.happiness ? "sad" : "happy"
      else
        return "Sorry unknown state!"
      end
    end

    protected
      def set_default_values
        self.admin ||= false
      end
end
