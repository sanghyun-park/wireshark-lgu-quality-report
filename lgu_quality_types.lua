msg_version = {
    [0x04] = "NB-IoT Quality Report",
    [0x05] = "LTE Cat.M1 Quality Report",
    [0x06] = "LTE M2M Quality Report",
    [0x07] = "5G Quality Report (NSA LTE Pcell)",
    [0x08] = "5G Quality Report (NSA NR Cell)",
    [0x09] = "5G Quality Report (SA NR Cell)",
    [0x0A] = "5G Quality Report (SA LTE Cell)",
}

power_source = {
    [0x00] = "Battery (%)",
    [0x01] = "Battery (Voltage)",
    [0x02] = "Constant Power",
    [0x99] = "NOT Supported",
}

signed = {
    [0x00] = "Positive (+)",
    [0x01] = "Negative (-)",
    [0x02] = "NOT Supported",
}

location_use_value = {
    [0x00] = "Location info not support",
    [0x01] = "Include location info",
}

is_support = { "Supported", "NOT Supported" }

port_info_type = {
    [0x00] = "NO internal port",
    [0x01] = "Ethernet (10M)",
    [0x02] = "Ethernet (100M)",
    [0x03] = "GigaEthernet(1G)",
    [0x04] = "RS232",
    [0x05] = "RS485",
    [0x06] = "USB",
    [0x07] = "GPIO",
}
