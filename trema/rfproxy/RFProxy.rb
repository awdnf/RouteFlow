require 'IPC/Tools/defs'
require 'IPC/MongoIPC'
require 'IPC/Tools/MessagesTypes'
require 'IPC/Tools/AssociationTable'
require 'IPC/Tools/dp'
require 'IPC/Tools/vs'
require 'RFProtocol/DatapathPortRegister'
require 'RFProtocol/DatapathDown'
require 'RFProtocol/DataPlaneMap'
require 'RFProtocol/RFProtocolFactory'

class RFProcessor

  def process(from, to, channel, msg)
    type = msg.type
    if type == MessagesTypes::DATAPATH_CONFIG
      #TODO: flowConfig
    elsif type == MessagesTypes::FLOW_MOD
      if msg.is_removal?
        #TODO: flowDelete
      else
        #TODO: flowAdd
      end
    elsif type == MessagesTypes::DATA_PLANE_MAP
      dp_in = DP.new(msg.dp_id, msg.dp_port)
      vs_in = VS.new(msg.vs_id, msg_vs_port)
      TABLE.update_dp_port(dp_in, vs_in)
    end
    return false
  end

end

class RFProxy < Controller

  IPC = MongoIPC.new()

  TABLE = AssociationTable.new

  PROCESSOR = RFProcessor.new

  FACTORY = RFProtocolFactory.new

  def run!
    puts "Trema RFProxy running"
    IPC.listen(Defs::RFSERVER_RFPROXY_CHANNEL, FACTORY, PROCESSOR, false)
    super
  end

  def switch_ready(datapath_id)
    #puts "switch ready - datapath_id: #{datapath_id}"
    #puts "requesting features - datapath_id: #{datapath_id}"
    send_message(datapath_id, FeaturesRequest.new)
  end

  def features_reply(datapath_id, message)
    #puts "features reply - datapath_id: #{datapath_id}"
    message.ports.each {
      |p|
      if p.number <= OFPP_MAX
        msg = DatapathPortRegister.new(datapath_id, p.number)
        IPC.sendMsg(Defs::RFSERVER_RFPROXY_CHANNEL, Defs::RFSERVER_ID, msg)
        #puts "Registering datapath port msg - #{msg}"
      end
    }
  end

  def switch_disconnected(datapath_id)
    #puts "switch disconnected - datapath_id: #{datapath_id}"
    TABLE.delete_dp(datapath_id)
    msg = DatapathDown.new(datapath_id)
    IPC.sendMsg(Defs::RFSERVER_RFPROXY_CHANNEL, Defs::RFSERVER_ID, msg)
    #puts "Registering switch disconnected msg - #{msg}"
  end

  def packet_in(packet)
    if packet.lldp?
      return
    end
    if packet.eth_type == Defs::RF_ETH_PROTO

    end
    #if packet.datapath_id ==

  end

end