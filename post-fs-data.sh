#!/system/bin/sh
MODDIR ${0%/*}

# @modulostk [telegram]
#####################################
resetprop -n sys.wifitracing.started 0
resetprop -n persist.vendor.wifienhancelog 0

#Data Speed Tweaks
resetprop -n ro.ril.enable.dtm 1
resetprop -n ro.ril.gprsclass 12
resetprop -n ro.ril.hsdpa.category 12
resetprop -n ro.ril.hsupa.category 7
resetprop -n ro.ril.lte.category 12
resetprop -n ro.ril.hspa.category 38
resetprop -n ro.ril.hspap.category 38
resetprop -n ro.ril.ehspa.category 38
resetprop -n ro.ril.hsxpa 3
resetprop -n ro.ril.enable.a52 1
resetprop -n ro.ril.enable.a53 1
resetprop -n ro.ril.enable.3g.prefix 1
resetprop -n ro.ril.hep 1
resetprop -n ro.ril.enable.sdr 1
resetprop -n ro.ril.enable.gea3 1
resetprop -n net.ipv4.tcp_rmem 4096 39000 187000
resetprop -n net.ipv4.tcp_wmem 4096 39000 187000
resetprop -n net.ipv4.tcp_mem 187000 187000 187000

#buffer tweaks
resetprop -n net.tcp.buffersize.default 4096,87380,256960,4096, 16384,256960
resetprop -n net.tcp.buffersize.wifi 4096,87380,256960,4096,163 84,256960
resetprop -n net.tcp.buffersize.lte 524288,1048576,2097152,5242 88,1048576,2097152
resetprop -n net.tcp.buffersize.hsdpa 6144,87380,1048576,6144,8 7380,1048576
resetprop -n net.tcp.buffersize.hspa 6144,87380,524288,6144,163 84,262144
resetprop -n net.tcp.buffersize.umts 4096,87380,256960,4096,163 84,256960
resetprop -n net.tcp.buffersize.edge 4096,87380,256960,4096,163 84,256960
resetprop -n net.tcp.buffersize.gprs 4096,87380,256960,4096,163 84,256960
resetprop -n net.tcp.buffersize.evdo_b 6144,87380,1048576,6144, 87380,1048576
resetprop -n wifi.supplicant_scan_interval 300
resetprop -n ro.gsm.2nd_data_retry_config max/_retries=3, 3000, 3000, 3000
