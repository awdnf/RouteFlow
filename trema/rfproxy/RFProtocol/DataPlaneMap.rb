require 'IPC/Tools/MessagesTypes'

class DataPlaneMap

  attr_reader :dp_id, :dp_port, :vs_id, :vs_port, :type

  def initialize(dp_id, dp_port, vs_id, vs_port)
    @dp_id = dp_id
    @dp_port = dp_port
    @vs_id = vs_id
    @vs_port = vs_port
    @type = MessagesTypes::DATA_PLANE_MAP
  end

  def to_s
    "DataPlaneMap - [dp_id: #{@dp_id}, dp_port: #{@dp_port}, vs_id: #{@vs_id}, vs_port: #{@vs_port}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['dp_id'] = @dp_id
    doc['dp_port'] = @dp_port
    doc['vs_id'] = @vs_id
    doc['vs_port'] = @vs_port
    return doc
  end

  def from_mongo_doc(doc)
    @dp_id = doc['content']['dp_id']
    @dp_port = doc['content']['dp_port']
    @vs_id = doc['content']['vs_id']
    @vs_port = doc['content']['vs_port']
  end

end