class Date
  def initialize
    @date = DateTime.now().strftime("%d/%m/%Y")
  end

  def get_date
    @date
  end
end