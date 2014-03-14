class Cpanel::Setting < ActiveRecord::Base
  after_save :save_setting

  private

    def save_setting
      eval("App.#{self.key} = '#{self.value}'") unless App.reserved.include? self.key 
    end

end
