require 'IPC/Tools/MessagesTypes'

class DatapathConfig

  attr_reader :dp_id, :operation_id, :type

  def initialize(dp_id, operation_id)
    @dp_id = dp_id
    @operation_id = operation_id
    @type = MessagesTypes::DATAPATH_CONFIG
  end

  def to_s
    "DatapathConfig - [dp_id: #{@dp_id}, operation_id: #{@operation_id}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['dp_id'] = @dp_id
    doc['operation_id'] = @operation_id
    return doc
  end

  def from_mongo_doc(doc)
    @dp_id = doc['content']['dp_id']
    @operation_id = doc['content']['operation_id']
  end

end