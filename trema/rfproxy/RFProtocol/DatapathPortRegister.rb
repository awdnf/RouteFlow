require 'IPC/Tools/MessagesTypes'

class DatapathPortRegister

  attr_reader :dp_id, :dp_port, :type

  def initialize(datapath_id, port_id)
    @dp_id = datapath_id
    @dp_port = port_id
    @type = MessagesTypes::DATAPATH_PORT_REGISTER
  end

  def to_s
    "DatapathPortRegister - [datapath_id: #{@dp_id}, port_id: #{@dp_port}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['dp_id'] = @dp_id
    doc['dp_port'] = @dp_port
    return doc
  end

  def from_mongo_doc(doc)
    @dp_id = doc['content']['dp_id']
    @dp_port = doc['content']['dp_port']
  end

end