class Event

  def initialize(attributes)
    @attributes = attributes
  end

  def month
    months = attributes.map do |attr|
      date = attr[:created_at].split("-")
      y, m = date[0], date[1]
      Time.new(y, m).strftime("%B %Y")
    end.uniq
    months.count == 1 ? months.first : months
  end

  private
    attr_reader :attributes
end
