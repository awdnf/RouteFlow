require 'IPC/Tools/MessagesTypes'

class DatapathDown

  attr_reader :dp_id, :type

  def initialize(dp_id)
    @dp_id = datapath_id
    @type = MessagesTypes::DATAPATH_DOWN
  end

  def to_s
    "DatapathDown - [datapathId: #{@datapathId}, type: #{@type}]"
  end

  def to_mongo_doc
    doc = {}
    doc['dp_id'] = @dp_id
    return doc
  end

  def from_mongo_doc(doc)
    @dp_id = doc['content']['dp_id']
  end

end