require 'IPC/Tools/defs'
require 'mongo'
#require 'orderedhash'
include Mongo

class MongoIPC

  FROM_FIELD = "from"
  TO_FIELD = "to"
  TYPE_FIELD = "type"
  READ_FIELD = "read"
  CONTENT_FIELD = "content"

  ID = 0

  MongoClient = MongoClient.new(Defs::MONGO_ADDRESS, Defs::MONGO_PORT)
  DB = MongoClient.db(Defs::MONGO_DB_NAME)

  def put_in_envelope(from, to, msg)
    envelope = Hash.new
    #using symbols to preserve keys' order in the hash
    envelope[:"#{FROM_FIELD}"] = from
    envelope[:"#{TO_FIELD}"] = to
    envelope[:"#{READ_FIELD}"] = false
    envelope[:"#{TYPE_FIELD}"] = msg.type
    envelope[:"#{CONTENT_FIELD}"] = msg.to_mongo_doc
    return envelope
  end

  def take_from_envelope(envelope, factory)
    msg = factory.build_for_type(envelope[TYPE_FIELD])
    msg.from_mongo_doc(envelope)
    return msg
  end

  # ----- Creates a new channel of communication (basically a collection in MongoDB) -----
  def create_channel(channel)
    #puts "IPC - creating channel: #{channel}"
    coll = DB.collection(channel)
    coll.create_index([["_id", Mongo::ASCENDING]])
    coll.create_index([[TO_FIELD, Mongo::ASCENDING]])
    return coll
  end

  def sendMsg(channel, to, msg)
    #puts "sendMsg - #{channel} - #{to} - #{msg}"
    coll = self.create_channel(channel)
    coll.insert(put_in_envelope(ID, to, msg))
    return true
  end

  def listen_worker(channel, factory, processor)
    coll = self.create_channel(channel)
    cursor = coll.find({TO_FIELD => ID, READ_FIELD => false}).sort({"_id" => Mongo::ASCENDING})
    puts "fez a query"
    puts cursor.inspect
    while true
      cursor.each { |envelope|
        msg = self.take_from_envelope(envelope, factory)
        processor.process(envelope[FROM_FIELD], envelope[TO_FIELD], channel, msg)
        coll.update({'_id' => envelope['_id']}, {'$set' => {READ_FIELD => true}})
      }
      self.sleep(0.05)
      cursor = coll.find({TO_FIELD => ID, READ_FIELD => false}).sort({"_id" => Mongo::ASCENDING})
    end
  end

  def listen(channel, factory, processor, block)
    thread = Thread.new do
      self.listen_worker(channel, factory, processor)
    end
    thread.run
    if block
      thread.join
    end
  end

end
