require 'IPC/Tools/MessagesTypes'

class RouteInfo

  attr_reader :vm_id, :vm_port, :address, :netmask, :dst_port,
              :src_hwaddress, :dst_hwaddress, :is_removal, :type

  def initialize(vm_id, vm_port, address, netmask, dst_port, src_hwaddress, dst_hwaddress, is_removal)
    @vm_id = vm_id
    @vm_port = vm_port
    @address = address
    @netmask = netmask
    @dst_port = dst_port
    @src_hwaddress = src_hwaddress
    @dst_hwaddress = dst_hwaddress
    @is_removal = is_removal
    @type = MessagesTypes::ROUTE_INFO
  end

  def to_s
    "RouteInfo - [vm_id: #{@vm_id}, vm_port: #{@vm_port}, address: #{@address}, netmask: #{@netmask},
    dst_port: #{@dst_port}, src_hwaddress: #{@src_hwaddress}, dst_hwaddress: #{@dst_hwaddress},
    is_removal: #{@is_removal}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['vm_id'] = @vm_id
    doc['vm_port'] = @vm_port
    doc['address'] = @address
    doc['netmask'] = @netmask
    doc['dst_port'] = @dst_port
    doc['src_hwaddress'] = @src_hwaddress
    doc['dst_hwaddress'] = @dst_hwaddress
    doc['is_removal'] = @is_removal
    return doc
  end

  def from_mongo_doc(doc)
    @vm_id = doc['content']['vm_id']
    @vm_port = doc['content']['vm_port']
    @address = doc['content']['address']
    @netmask = doc['content']['netmask']
    @dst_port = doc['content']['dst_port']
    @src_hwaddress = doc['content']['src_hwaddress']
    @dst_hwaddress = doc['content']['dst_hwaddress']
    @is_removal = doc['content']['is_removal']
  end

end