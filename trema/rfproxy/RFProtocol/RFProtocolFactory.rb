require 'IPC/Tools/MessagesTypes'
require 'RFProtocol/DatapathPortRegister'
require 'RFProtocol/DatapathDown'
require 'RFProtocol/DatapathConfig'
require 'RFProtocol/DataPlaneMap'
require 'RFProtocol/FlowMod'
require 'RFProtocol/PortConfig'
require 'RFProtocol/PortRegister'
require 'RFProtocol/RouteInfo'
require 'RFProtocol/VirtualPlaneMap'

class RFProtocolFactory

  def build_for_type(type)
    if (type == MessagesTypes::DATAPATH_CONFIG)
      return DatapathConfig.new(nil, nil)
    elsif (type == MessagesTypes::DATAPATH_DOWN)
      return DatapathDown.new(nil)
    elsif (type == MessagesTypes::DATAPATH_PORT_REGISTER)
      return DatapathPortRegister.new(nil, nil)
    elsif (type == MessagesTypes::DATA_PLANE_MAP)
      return DataPlaneMap.new(nil, nil, nil, nil)
    elsif (type == MessagesTypes::FLOW_MOD)
      return FlowMod.new(nil,nil,nil,nil,nil,nil,nil)
    elsif (type == MessagesTypes::PORT_CONFIG)
      return PortConfig.new(nil,nil,nil)
    elsif (type == MessagesTypes::ROUTE_INFO)
      return RouteInfo.new(nil,nil,nil,nil,nil,nil,nil,nil)
    elsif (type == MessagesTypes::VIRTUAL_PLANE_MAP)
      return VirtualPlaneMap.new(nil,nil,nil,nil)
    end
    return nil
  end

end