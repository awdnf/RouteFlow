require 'IPC/Tools/MessagesTypes'

class FlowMod

  attr_reader :dp_id, :address, :netmask, :dst_port, :src_hwaddress,
              :dst_hwaddress, :is_removal, :type

  def initialize(dp_id, address, netmask, dst_port, src_hwaddress, dst_hwaddress, is_removal)
    @dp_id = dp_id
    @address = address
    @netmask = netmask
    @dst_port = dst_port
    @src_hwaddress = src_hwaddress
    @dst_hwaddress = dst_hwaddress
    @is_removal = is_removal
    @type = MessagesTypes::FLOW_MOD
  end

  def to_s
    "FlowMod - [dp_id: #{@dp_id}, address: #{@address}, netmask: #{@netmask},
      dst_port: #{@dst_port}, src_hwaddress: #{@src_hwaddress}, is_removal: #{@is_removal},
      type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['dp_id'] = @dp_id
    doc['address'] = @address
    doc['netmask'] = @netmask
    doc['dst_port'] = @dst_port
    doc['src_hwaddress'] = @src_hwaddress
    doc['dst_hwaddress'] = @dst_hwaddress
    doc['is_removal'] = @is_removal
    return doc
  end

  def from_mongo_doc(doc)
    @dp_id = doc['content']['dp_id']
    @address = doc['content']['address']
    @netmask = doc['content']['netmask']
    @dst_port = doc['content']['dst_port']
    @src_hwaddress = doc['content']['src_hwaddress']
    @dst_hwaddress = doc['content']['dst_hwaddress']
    @is_removal = doc['content']['is_removal']
  end

end