require("lgu_quality_fields")
require("lgu_quality_types")

local lgu_quality_report = Proto ("lguquality", "LGU+ Quality Report")

lgu_quality_report.fields = { }
for _,v in ipairs(quality_report_fields) do 
    table.insert(lgu_quality_report.fields, v)
end

function lgu_quality_report.dissector(buf, pkt, tree)
    index = 0

    local subtree = tree:add(lgu_quality_report, buf(0,1))
    subtree:add(f_msgver, buf(index, 1))
    index = index + 1

    subtree:add(f_ctn, buf(index, 6))
    index = index + 6

    local power_tree = subtree:add(f_power, buf(index, 3))
    power_tree:add(f_power_src, buf(index, 1))
    index = index + 1
    power_tree:add(f_power_value, buf(index, 2))
    index = index + 2

    subtree:add(f_cgi, buf(index, 4))
    index = index + 4

    local rf_tree = subtree:add(f_rf, buf(index,4))
    rf_tree:add(f_rf_rsrp, buf(index, 2))
    index = index + 2
    rf_tree:add(f_rf_sinr, buf(index, 2))
    index = index + 2

    local model_length = buf(index,1):uint()
    local model_name = buf(index+1, model_length):string()
    local model_tree = subtree:add(f_model, buf(index, 1 + model_length), model_name)
    model_tree:add(f_model_length, buf(index, 1))
    model_tree:add(f_model_name, buf(index+1, model_length))
    index = index + 1 + model_length

    local fwver_length = buf(index,1):uint()
    local fwver_name = buf(index+1, fwver_length):string()
    local fwver_tree = subtree:add(f_fwver, buf(index, 1 + fwver_length), fwver_name)
    fwver_tree:add(f_fwver_length, buf(index, 1))
    fwver_tree:add(f_fwver_name, buf(index+1, fwver_length))
    index = index + 1 + fwver_length

    local tx_power_tree = subtree:add(f_tx_power, buf(index, 2))
    tx_power_tree:add(f_tx_power_sign, buf(index, 1))
    index = index + 1
    tx_power_tree:add(f_tx_power_value, buf(index, 1))
    index = index + 1

    local location_use = buf(index,1):uint()
    local location_tree = subtree:add(f_location, buf(index, 1))
    location_tree:add(f_location_use, buf(index, 1))
    index = index + 1
    if location_use == 1 then
        location_tree:add(f_location_latitude, buf(index, 5))
        index = index + 5
        location_tree:add(f_location_longitude, buf(index, 5))
        index = index + 5
    end

    local num_of_cells = buf(index,1):uint()
    local neighbor_cells_tree = subtree:add(f_neighbor_cells, buf(index, 1 + (num_of_cells * 4)))
    neighbor_cells_tree:add(f_neighbor_cells_num, buf(index, 1))
    index = index + 1
    if num_of_cells > 0 then
        for i=1, num_of_cells do
            neighbor_cells_tree:add(f_neighbor_cells_pci, buf(index, 4))
            index = index + 4
        end
    end

    local ueinfo_tree = subtree:add(f_ueinfo, buf(index, 1))
    ueinfo_tree:add(f_ueinfo_b1, buf(index,1))
    ueinfo_tree:add(f_ueinfo_b5, buf(index,1))
    ueinfo_tree:add(f_ueinfo_b7, buf(index,1))
    ueinfo_tree:add(f_ueinfo_n78, buf(index,1))
    ueinfo_tree:add(f_ueinfo_n275, buf(index,1))
    ueinfo_tree:add(f_ueinfo_reserved, buf(index,1))
    ueinfo_tree:add(f_ueinfo_op_type, buf(index,1))
    ueinfo_tree:add(f_ueinfo_report_type, buf(index,1))
    index = index + 1

    local port_type = buf(index, 1):uint()
    local port_info_tree = subtree:add(f_port_info, buf(index, 3))
    port_info_tree:add(f_port_info_type, buf(index, 1))
    index = index + 1
    port_info_tree:add(f_port_info_link_status, buf(index, 1))
    index = index + 1
    port_info_tree:add(f_port_info_traffic_status, buf(index, 1))
    index = index + 1

    subtree:add(f_reserved, buf(index, 3))
    index = index + 3

    local pkt_info = "LGU " .. msg_version[buf(0,1):uint()]
    if model_name ~= nil and fwver_name ~= nil then
        pkt_info = pkt_info .. " ".. model_name .. "/".. fwver_name
    end
    if num_of_cells > 0 then
        pkt_info = pkt_info .. " Cells=" .. num_of_cells
    end

    pkt.cols.info:set(pkt_info)
end
 
local udp_dissector_table = DissectorTable.get("udp.port")
udp_dissector_table:add(50000, lgu_quality_report)
