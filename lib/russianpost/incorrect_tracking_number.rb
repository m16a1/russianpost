class RussianPost::IncorrectTrackingNumber < Exception
  def initialize(tracking_number)
    @tracking_number = tracking_number
  end
  def to_s
    "Incorrect format of tracking number: #{@tracking_number}"
  end
end