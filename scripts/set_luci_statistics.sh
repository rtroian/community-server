#!/bin/bash

cat <<EOT >> /etc/config/luci_statistics
config statistics 'collectd'
	option BaseDir '/var/run/collectd'
	option Include '/etc/collectd/conf.d'
	option PIDFile '/var/run/collectd.pid'
	option PluginDir '/usr/lib/collectd'
	option TypesDB '/usr/share/collectd/types.db'
	option Interval '30'
	option ReadThreads '2'

config statistics 'rrdtool'
	option default_timespan '1hour'
	option image_width '600'
	option image_path '/tmp/rrdimg'

config statistics 'collectd_rrdtool'
	option enable '1'
	option DataDir '/tmp/rrd'
	option RRARows '100'
	option RRASingle '1'
	option RRATimespans '1hour 1day 1week 1month 1year'

config statistics 'collectd_csv'
	option enable '0'
	option StoreRates '0'
	option DataDir '/tmp'

config statistics 'collectd_email'
	option enable '0'
	option SocketFile '/var/run/collectd/email.sock'
	option SocketGroup 'nogroup'

config statistics 'collectd_logfile'
	option enable '0'
	option LogLevel 'notice'
	option File '/var/log/collectd.log'
	option Timestamp '1'

config statistics 'collectd_network'
	option enable '1'
	option Forward '1'

config statistics 'collectd_unixsock'
	option enable '0'
	option SocketFile '/var/run/collectd/query.sock'
	option SocketGroup 'nogroup'

config statistics 'collectd_apcups'
	option enable '0'
	option Host 'localhost'
	option Port '3551'

config statistics 'collectd_conntrack'
	option enable '1'

config statistics 'collectd_contextswitch'
	option enable '0'

config statistics 'collectd_cpu'
	option enable '1'

config statistics 'collectd_cpufreq'
	option enable '0'

config statistics 'collectd_df'
	option enable '0'
	option Devices '/dev/mtdblock/4'
	option MountPoints '/jffs'
	option FSTypes 'tmpfs'
	option IgnoreSelected '0'

config statistics 'collectd_disk'
	option Disks 'hda1 hdb'
	option IgnoreSelected '0'
	option enable '1'

config statistics 'collectd_dns'
	option Interfaces 'br-lan'
	option IgnoreSources '127.0.0.1'
	option enable '1'

config statistics 'collectd_entropy'
	option enable '0'

config statistics 'collectd_exec'
	option enable '0'

config statistics 'collectd_interface'
	option enable '1'
	option Interfaces 'br-lan'
	option IgnoreSelected '0'

config statistics 'collectd_iptables'
	option enable '0'

config collectd_iptables_match
	option table 'nat'
	option chain 'luci_fw_postrouting'
	option target 'MASQUERADE'
	option source '192.168.1.0/24'
	option outputif 'br-ff'
	option name 'LAN-Clients traffic'

config collectd_iptables_match
	option chain 'luci_fw_postrouting'
	option table 'nat'
	option target 'MASQUERADE'
	option source '10.61.230.0/24'
	option outputif 'br-ff'
	option name 'WLAN-Clients traffic'

config statistics 'collectd_irq'
	option enable '0'
	option Irqs '2 3 4 7'

config statistics 'collectd_iwinfo'
	option enable '1'
	option Interfaces 'wlan1-mesh'
	option IgnoreSelected '0'

config statistics 'collectd_load'
	option enable '1'

config statistics 'collectd_memory'
	option enable '1'

config statistics 'collectd_netlink'
	option enable '0'
	option IgnoreSelected '0'
	option VerboseInterfaces 'br-lan'
	option QDiscs 'br-lan'

config statistics 'collectd_nut'
	option enable '0'
	option UPS 'myupsname'

config statistics 'collectd_olsrd'
	option enable '0'
	option Port '2006'
	option Host '127.0.0.1'

config statistics 'collectd_ping'
	option TTL '127'
	option Interval '30'
	option enable '1'
	option Hosts '10.147.42.194 8.8.8.8'

config statistics 'collectd_processes'
	option Processes 'uhttpd dnsmasq dropbear'
	option enable '1'

config statistics 'collectd_sensors'
	option enable '0'

config statistics 'collectd_splash_leases'
	option enable '0'

config statistics 'collectd_tcpconns'
	option ListeningPorts '0'
	option LocalPorts '22 80'
	option enable '1'

config statistics 'collectd_thermal'
	option enable '0'
	option IgnoreSelected '0'

config statistics 'collectd_uptime'
	option enable '0'

config collectd_network_server
	option host '10.147.249.54'
	option port '25826'

config collectd_network_listen
	option host '0.0.0.0'
	option port '25826'
EOT
/etc/init.d/luci_statistics restart