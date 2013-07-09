class DP

  attr_reader :datapath_id, :port

  def initialize(datapath_id, port)
    @datapath_id = datapath_id
    @port = port
  end

  def ==(dp)
    return self.datapath_id == dp.datapath_id && self.port == dp.port
  end

  def equal?(dp)
    return self.datapath_id == dp.datapath_id && self.port == dp.port
  end

  def eql?(dp)
    return self.datapath_id == dp.datapath_id && self.port == dp.port
  end

  def hash
    return [self.datapath_id, self.port].hash
  end

  def to_s
    return "DP[datapath_id: #{datapath_id}, port: #{port}]"
  end

end