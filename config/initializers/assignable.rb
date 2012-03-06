ActiveRecord::Base.class_eval do
  def self.has_assignments
    has_many :assignments, :as => :assignable, :dependent => :delete_all
    has_many :tasks, :through => :assignments

    Assignment.class_eval <<-EVAL
      scope :#{self.to_s.pluralize.underscore}, where(:assignable_type => '#{self.to_s}')
    EVAL

    Task.class_eval <<-EVAL
      def #{self.to_s.pluralize.underscore}
        assignments.#{self.to_s.pluralize.underscore}.map(&:assignable)
      end
    EVAL
  end
end
