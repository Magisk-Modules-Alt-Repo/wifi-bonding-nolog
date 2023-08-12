#!/system/bin/sh
MODDIR ${0%/*}

# @modulostk [telegram]
#####################################
resetprop sys.wifitracing.started 0
resetprop persist.vendor.wifienhancelog 0

#Data Speed Tweaks
resetprop ro.ril.enable.dtm 1
resetprop ro.ril.gprsclass 12
resetprop ro.ril.hsdpa.category 12
resetprop ro.ril.hsupa.category 7
resetprop ro.ril.lte.category 12
resetprop ro.ril.hspa.category 38
resetprop ro.ril.hspap.category 38
resetprop ro.ril.ehspa.category 38
resetprop ro.ril.hsxpa 3
resetprop ro.ril.enable.a52 1
resetprop ro.ril.enable.a53 1
resetprop ro.ril.enable.3g.prefix 1
resetprop ro.ril.hep 1
resetprop ro.ril.enable.sdr 1
resetprop ro.ril.enable.gea3 1
resetprop net.ipv4.tcp_rmem 4096 39000 187000
resetprop net.ipv4.tcp_wmem 4096 39000 187000
resetprop net.ipv4.tcp_mem 187000 187000 187000

#buffer tweaks
resetprop net.tcp.buffersize.default 4096,87380,256960,4096, 16384,256960
resetprop net.tcp.buffersize.wifi 4096,87380,256960,4096,163 84,256960
resetprop net.tcp.buffersize.lte 524288,1048576,2097152,5242 88,1048576,2097152
resetprop net.tcp.buffersize.hsdpa 6144,87380,1048576,6144,8 7380,1048576
resetprop net.tcp.buffersize.hspa 6144,87380,524288,6144,163 84,262144
resetprop net.tcp.buffersize.umts 4096,87380,256960,4096,163 84,256960
resetprop net.tcp.buffersize.edge 4096,87380,256960,4096,163 84,256960
resetprop net.tcp.buffersize.gprs 4096,87380,256960,4096,163 84,256960
resetprop net.tcp.buffersize.evdo_b 6144,87380,1048576,6144, 87380,1048576
resetprop wifi.supplicant_scan_interval 300
resetprop ro.gsm.2nd_data_retry_config max/_retries=3, 3000, 3000, 3000
