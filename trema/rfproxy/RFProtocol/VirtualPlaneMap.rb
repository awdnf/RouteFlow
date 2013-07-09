require 'IPC/Tools/MessagesTypes'

class VirtualPlaneMap

  attr_reader :vm_id, :vm_port, :vs_id, :vs_port, :type

  def initialize(vm_id, vm_port, vs_id, vs_port)
    @vm_id = vm_id
    @vm_port = vm_port
    @vs_id = vs_id
    @vs_port = vs_port
    @type = MessagesTypes::VIRTUAL_PLANE_MAP
  end

  def to_s
    "VirtualPlaneMap - [vm_id: #{@vm_id}, vm_port: #{@vm_port}, vs_id: #{@vs_id}, vs_port: #{@vs_port}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['vm_id'] = @vm_id
    doc['vm_port'] = @vm_port
    doc['vs_id'] = @vs_id
    doc['vs_port'] = @vs_port
    return doc
  end

  def from_mongo_doc(doc)
    @vm_id = doc['content']['vm_id']
    @vm_port = doc['content']['vm_port']
    @vs_id = doc['content']['vs_id']
    @vs_port = doc['content']['vs_port']
  end

end