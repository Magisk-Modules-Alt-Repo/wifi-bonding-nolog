ui_print "▒█░░▒█ ░▀░ ░░ ▒█▀▀▀ ░▀░ "
ui_print "▒█▒█▒█ ▀█▀ ▀▀ ▒█▀▀▀ ▀█▀ "
ui_print "▒█▄▀▄█ ▀▀▀ ░░ ▒█░░░ ▀▀▀ "
ui_print " "
ui_print "▒█▀▀█ █▀▀█ █▀▀▄ █▀▀▄ ░▀░ █▀▀▄ █▀▀▀ "
ui_print "▒█▀▀▄ █░░█ █░░█ █░░█ ▀█▀ █░░█ █░▀█ "
ui_print "▒█▄▄█ ▀▀▀▀ ▀░░▀ ▀▀▀░ ▀▀▀ ▀░░▀ ▀▀▀▀ "
ui_print " "
ui_print "▒█▄░▒█ █▀▀█ ▒█░░░ █▀▀█ █▀▀▀ "
ui_print "▒█▒█▒█ █░░█ ▒█░░░ █░░█ █░▀█ "
ui_print "▒█░░▀█ ▀▀▀▀ ▒█▄▄█ ▀▀▀▀ ▀▀▀▀"

[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
array=$(find /system /vendor /product /system_ext -name WCNSS_qcom_cfg.ini)
for CFG in $array
do
[[ -f $CFG ]] && [[ ! -L $CFG ]] && {
SELECTPATH=$CFG
mkdir -p `dirname $MODPATH$CFG`
ui_print "- Migrating $MIRRORPATH$SELECTPATH"
cp -af $MIRRORPATH$SELECTPATH $MODPATH$SELECTPATH
ui_print "- Starting modifiy"
sed -i '/gChannelBondingMode24GHz=/d;/gChannelBondingMode5GHz=/d;/gForce1x1Exception=/d;/sae_enabled=/d;/gEnablefwlog=/d;/gEnablePacketLog=/d;/gEnableSNRMonitoring=/d;/gEnableNUDTracking=/d;/gEnableLogp=/d;/nrx_wakelock_timeout=/d;/gFwDebugLogLevel=/d;/gFwDebugModuleLoglevel=/d;s/^END$/gChannelBondingMode24GHz=1\ngChannelBondingMode5GHz=1\ngForce1x1Exception=0\nsae_enabled=1\ngEnablefwlog=0\ngEnablePacketLog=0\ngEnableSNRMonitoring=0\ngEnableNUDTracking=0\ngEnableLogp=0\nnrx_wakelock_timeout=0\nEND/g' $MODPATH$SELECTPATH
}
done
[[ -z $SELECTPATH ]] && abort "- Installation FAILED. Your device didn't support WCNSS_qcom_cfg.ini." || { mkdir -p $MODPATH/system; mv -f $MODPATH/vendor $MODPATH/system/vendor; mv -f $MODPATH/product $MODPATH/system/product; mv -f $MODPATH/system_ext $MODPATH/system/system_ext;}
