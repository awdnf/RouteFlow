class VS

  attr_reader :vs_id, :vs_port

  def initialize(vs_id, vs_port)
    @vs_id = vs_id
    @vs_port = vs_port
  end

  def ==(vs)
    return self.vs_id == vs.vs_id && self.vs_port == vs.vs_port
  end

  def equal?(vs)
    return self.vs_id == vs.vs_id && self.vs_port == vs.vs_port
  end

  def eql?(vs)
    return self.vs_id == vs.vs_id && self.vs_port == vs.vs_port
  end

  def hash
    return [self.vs_id, self.vs_port].hash
  end

  def to_s
    return "VS[vs_id: #{vs_id}, vs_port: #{vs_port}]"
  end

end