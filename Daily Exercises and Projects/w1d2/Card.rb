class Card

  attr_reader :value, :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end

  def ==(card2)
    @value == card2.value ? true : false
  end

  def to_s
    if face_up
      return value.to_s + " "
    else
      return "X "
    end
  end
end
