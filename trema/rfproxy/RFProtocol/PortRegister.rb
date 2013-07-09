require 'IPC/Tools/MessagesTypes'

class PortRegister

  attr_reader :vm_id, :vm_port, :type

  def initialize(vm_id, vm_port)
    @vm_id = vm_id
    @vm_port = vm_port
    @type = MessagesTypes::PORT_REGISTER
  end

  def to_s
    "PortRegister - [vm_id: #{@vm_id}, vm_port: #{@vm_port}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['vm_id'] = @vm_id
    doc['vm_port'] = @vm_port
    return doc
  end

  def from_mongo_doc(doc)
    @vm_id = doc['content']['vm_id']
    @vm_port = doc['content']['vm_port']
  end

end