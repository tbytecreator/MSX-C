# OpenMSX Start Script
# The emulator will be started only if it's not already active

xopenmsx=`pgrep "openmsx"`
	
if [ "${xopenmsx}" = "" ]; then
	echo "...Now Starting OpenMSX "
	openmsx -script ./openMSX/emul_start_config.txt
else
	echo "...openMSX already running "
fi