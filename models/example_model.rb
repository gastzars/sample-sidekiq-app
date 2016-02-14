class ExampleModel
  include Mongoid::Document
  field :value,         :type => Fixnum

  def two_times
    self.value * 2
  end
end
