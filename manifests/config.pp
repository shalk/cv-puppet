class cv::config (
  $cv_mgmt_vlan  ,
  $cv_biz_vlan   ,
  $cv_stor_vlan  ,
  $cv_mgmt_nic   ,
  $cv_biz_nic    ,
  $cv_stor_nic   ,

  $cv_collet_server_ip,
  $cv_zookeeper_cluster,

  $cv_cvm_mgmt_ip  ,
  $cv_cvm_mgmt_netmask = '255.255.255.0',
  $cv_cvm_default_gateway  ,
   
  $cv_cvm_biz_novlan_ip  ,
  $cv_cvm_biz_vlan_netmask  = '255.255.255.0',
  $cv_cvm_biz_vlan_ip   ,
  $cv_cvm_biz_novlan_netmask = '255.255.255.0' ,
  
  $cv_ntpip =  $cv_cvm_mgmt_ip ,
  
  $cv_cvmpath = '/root/vhd',
  $cv_vhd_for_install_dir = '/cvm/'

) {
   
    file { '/usr/local/etc/devagent/vlan-conf':
        ensure => file,
        content => template("cv/vlan-conf.erb"),
        owner => root,
        group => root,
        require => Class["cv::package"],
        notify => Service["devagentd"],
    }

    file { '/usr/local/etc/devagent/nic-conf':
        ensure => file,
        content => template("cv/nic-conf.erb"),
        owner => root,
        group => root,
        require => Class["cv::package"],
        notify => Service["devagentd"],
    }

    file { '/opt/collect-agent/etc/collector/conf/agent_prop.properties':
        ensure => file,
        content => template("cv/agent_prop.properties.erb"),
        owner => root,
        group => root,
        notify => Service["collect-agent"],
    }

    file { '/opt/collect-agent/etc/collector/conf/mq_prop.properties':
        ensure => file,
        content => template("cv/mq_prop.properties.erb"),
        owner => root,
        group => root,
        notify => Service["collect-agent"],
    }

    file { '/opt/zkclient/share/zkclient.xml':
        ensure => file,
        content => template("cv/zkclient.xml.erb"),
        owner => root,
        group => root,
        notify => Service["zkclient"],
    }
    file { '/opt/cv/vcell.cfg':
        ensure => file,
        content => template("cv/vcell.cfg.erb"),
        owner => root,
        group => root,
    }
}
