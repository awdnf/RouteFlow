class AssociationTable

  attr_reader :dp_to_vs, :vs_to_dp

  def initialize
    @dp_to_vs = Hash.new
    @vs_to_dp = Hash.new
  end

  def update_dp_port(dp, vs)
    puts "updating dp port"
    if self.dp_to_vs.has_key?(dp)
      puts "chave encontrada!"
      old_vs = self.dp_to_vs[dp]
      self.vs_to_dp.delete(old_vs)
    end
    self.dp_to_vs[dp] = vs
    self.vs_to_dp[vs] = dp
  end

  def dp_port_to_vs_port(dp)
    if self.dp_to_vs.has_key?(dp)
      return self.dp_to_vs[dp]
    else
      return nil
    end
  end

  def vs_port_to_dp_port(vs)
    if self.vs_to_dp.has_key?(vs)
      return self.vs_to_dp[vs]
    else
      return nil
    end
  end

  def delete_dp(datapath_id)
    self.dp_to_vs.each { |dp, vs|
      if dp.datapath_id == datapath_id
        self.dp_to_vs.remove(dp)
      end
    }
  end

end