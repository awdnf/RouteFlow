class Defs

  MONGO_ADDRESS = '127.0.0.1'
  MONGO_PORT = 27017
  MONGO_DB_NAME = 'db'

  RFCLIENT_RFSERVER_CHANNEL = 'rfclient<->rfserver'
  RFSERVER_RFPROXY_CHANNEL = 'rfserver<->rfproxy'

  RFTABLE_NAME = 'rftable'
  RFCONFIG_NAME = 'rfconfig'

  RFSERVER_ID = 'rfserver'
  RFPROXY_ID = 'rfproxy'

  DEFAULT_RFCLIENT_INTERFACE = 'eth0'

  RFVS_PREFIX = 0x72667673

  #@@RFVS_DPID = 8243406406160905843L

  # ----------- RF ethernet protocol -----------
  RF_ETH_PROTO = 0x0A0A

  MATCH_L2 = true

  # ----------- Drop all incoming packets -----------
  DC_DROP_ALL = 0

  # ----------- Clear flow table -----------
  DC_CLEAR_FLOW_TABLE = 1

  # ----------- Flow to communicate two linked VMs -----------
  DC_VM_INFO = 2

  # ----------- RIPv2 protocol -----------
  DC_RIPV2 = 3

  # ----------- OSPF protocol -----------
  DC_OSPF = 4

  # ----------- BGP protocol -----------
  DC_BGP_INBOUND = 5
  DC_BGP_OUTBOUND = 6

  # ----------- ARP protocol -----------
  DC_ARP = 7

  # ----------- ICMP protocol -----------
  DC_ICMP = 8

  # ----------- Send all traffic to the controller -----------
  DC_ALL = 9
  PC_MAP = 0
  PC_RESET = 1

  # ----------- Default Priority -----------
  DEFAULT_PRIORITY = 0x8000
  IPPROTO_OSPF = 0x59
  ETHERTYPE_ARP = 0x0806
  IPORT_BGP = 0x00B3

end
