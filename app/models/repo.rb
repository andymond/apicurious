class Repo

  def initialize(attributes)
    @attributes = attributes
  end

  def name
    attributes[:name]
  end

  private
    attr_reader :attributes

end
