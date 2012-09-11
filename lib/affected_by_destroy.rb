require "affected_by_destroy/version"

module AffectedByDestroy
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    
  end
  
  
end

ActiveRecord::Base.send :include, AffectedByDestroy
