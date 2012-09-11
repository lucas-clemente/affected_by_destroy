require "affected_by_destroy/version"

module AffectedByDestroy
  def affected_by_destroy(already_affected = [])
    affected = [self] + already_affected
    self.class.reflect_on_all_associations.select {|a| a.options[:dependent] == :destroy}.each do |assoc|
      assoc_result = self.send(assoc.name)
      next if assoc_result.blank?
      if assoc.macro == :has_many
        assoc_result.each do |assoc_object|
          affected += assoc_object.affected_by_destroy(affected) unless affected.include?(assoc_object)
        end
      elsif assoc.macro == :belongs_to
        affected += assoc_result.affected_by_destroy(affected) unless affected.include?(assoc_result)
      else
        raise 'Association Type is not supported'
      end
    end
    affected.uniq
  end
end

ActiveRecord::Base.send :include, AffectedByDestroy
