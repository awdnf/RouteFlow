require 'IPC/Tools/MessagesTypes'

class PortConfig

  attr_reader :vm_id, :vm_port, :operation_id, :type

  def initialize(vm_id, vm_port, operation_id)
    @vm_id = vm_id
    @vm_port = vm_port
    @operation_id = operation_id
    @type = MessagesTypes::PORT_CONFIG
  end

  def to_s
    "PortConfig - [vm_id: #{@vm_id}, vm_port: #{@vm_port}, operation_id: #{@operation_id}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['vm_id'] = @vm_id
    doc['vm_port'] = @vm_port
    doc['operation_id'] = @operation_id
    return doc
  end

  def from_mongo_doc(doc)
    @vm_id = doc['content']['vm_id']
    @vm_port = doc['content']['vm_port']
    @operation_id = doc['content']['operation_id']
  end

end