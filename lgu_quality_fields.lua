require("lgu_quality_types")

f_msgver = ProtoField.uint8("lguquality.msgver", "Message Version", base.HEX, msg_version)
f_ctn = ProtoField.bytes("lguquality.ctn", "CTN", base.NONE)
f_power = ProtoField.none("lguquality.power", "Power", base.NONE)
f_power_src = ProtoField.uint8("lguquality.power.source", "Power Source", base.HEX, power_source)
f_power_value = ProtoField.uint8("lguquality.power_.ource_value", "Power Value", base.HEX)
f_cgi = ProtoField.uint32("lguquality.cgi", "Cell Global Identity", base.DEC_HEX)
f_rf = ProtoField.none("lguquality.rf", "RF", base.NONE)
f_rf_rsrp = ProtoField.bytes("lguquality.rf.rsrp", "RSRP", base.NONE)
f_rf_sinr = ProtoField.bytes("lguquality.rf.sinr", "SINR", base.NONE)
f_model = ProtoField.string("lguquality.model", "Model", base.ASCII)
f_model_length = ProtoField.uint8("lguquality.model.length", "Model name length", base.DEC)
f_model_name = ProtoField.string("lguquality.model.name", "Model name", base.ASCII)
f_fwver = ProtoField.string("lguquality.fwver", "Firmware version", base.ASCII)
f_fwver_length = ProtoField.uint8("lguquality.fwver.length", "Friwmare version length", base.DEC)
f_fwver_name = ProtoField.string("lguquality.fwver.name", "Friwmare version name", base.ASCII)
f_tx_power = ProtoField.none("lguquality.tx_power", "TX Power", base.NONE)
f_tx_power_sign = ProtoField.uint8("lguquality.tx_power.sign", "TX Power Sign", base.HEX, signed)
f_tx_power_value = ProtoField.uint8("lguquality.tx_power.value", "TX Power Value", base.HEX)
f_location = ProtoField.none("lguquality.location", "Location", base.NONE)
f_location_use = ProtoField.uint8("lguquality.location.use", "Location use", base.HEX, location_use_value)
f_location_latitude = ProtoField.bytes("lguquality.location.latitude", "Latitude", base.NONE)
f_location_longitude = ProtoField.bytes("lguquality.location.longitude", "Longitude", base.NONE)
f_neighbor_cells = ProtoField.none("lguquality.neighbor_cells", "Neighbor cells", base.NONE)
f_neighbor_cells_num = ProtoField.uint8("lguquality.neighbor_cells.num", "Number of neighbor cells", base.DEC)
f_neighbor_cells_pci = ProtoField.uint32("lguquality.neighbor_cells.pci", "PCI", base.DEC)
f_ueinfo = ProtoField.none("lguquality.ueinfo", "UE Info", base.NONE)
f_ueinfo_b1 = ProtoField.bool("lguquality.ueinfo.b1", "LTE band 1", 8, is_support, 0x80)
f_ueinfo_b5 = ProtoField.bool("lguquality.ueinfo.b5", "LTE band 5", 8, is_support, 0x40)
f_ueinfo_b7 = ProtoField.bool("lguquality.ueinfo.b7", "LTE band 7", 8, is_support, 0x20)
f_ueinfo_n78 = ProtoField.bool("lguquality.ueinfo.n78", "NR band 78", 8, is_support, 0x10)
f_ueinfo_n275 = ProtoField.bool("lguquality.ueinfo.n275", "NR band 275", 8, is_support, 0x08)
f_ueinfo_reserved = ProtoField.bool("lguquality.ueinfo.reserved", "Reserved", 8, { "","" }, 0x04)
f_ueinfo_op_type = ProtoField.bool("lguquality.ueinfo.op_type", "Operation type", 8, { "Stationary", "Mobile" }, 0x02)
f_ueinfo_report_type = ProtoField.bool("lguquality.ueinfo.report_type", "Report type", 8, { "Bootup", "Periodic" }, 0x01)
f_port_info = ProtoField.none("lguquality.port_info", "Port info", base.NONE)
f_port_info_type = ProtoField.uint8("lguquality.port_info.type", "Type", base.HEX, port_info_type)
f_port_info_link_status = ProtoField.uint8("lguquality.port_info.link_status", "Link status", base.HEX)
f_port_info_traffic_status = ProtoField.uint8("lguquality.port_info.traffic_status", "Traffic status", base.HEX)
f_reserved = ProtoField.bytes("lguquality.reserved", "Reserved", base.NONE)

quality_report_fields = {
    f_msgver,
    f_ctn,
    f_power,
    f_power_src,
    f_power_value,
    f_cgi,
    f_rf,
    f_rf_rsrp,
    f_rf_sinr,
    f_model,
    f_model_length,
    f_model_name,
    f_fwver,
    f_fwver_length,
    f_fwver_name,
    f_tx_power,
    f_tx_power_sign,
    f_tx_power_value,
    f_location,
    f_location_use,
    f_location_latitude,
    f_location_longitude,
    f_neighbor_cells,
    f_neighbor_cells_num,
    f_neighbor_cells_pci,
    f_ueinfo,
    f_ueinfo_b1,
    f_ueinfo_b5,
    f_ueinfo_b7,
    f_ueinfo_n78,
    f_ueinfo_n275,
    f_ueinfo_reserved,
    f_ueinfo_op_type,
    f_ueinfo_report_type,
    f_port_info,
    f_port_info_type,
    f_port_info_link_status,
    f_port_info_traffic_status,
    f_reserved,
}