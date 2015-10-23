class ChessItem
  def symbolize coords
    (coords[0].to_s + coords[1].to_s).to_sym
  end
end
