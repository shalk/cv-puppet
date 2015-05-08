


class cv::config (
  $cv_mgmt_vlan  ,
  $cv_biz_vlan   ,
  $cv_stor_vlan  ,
  $cv_mgmt_nic   ,
  $cv_biz_nic    ,
  $cv_stor_nic   ,
  $cv_collet_server_ip,
  $cv_zookeeper_cluster,
) {
   
    file { '/usr/local/etc/devagent/vlan-conf':
        path => '/home/vlan-conf',
        ensure => file,
        content => template("cv/vlan-conf.erb"),
        owner => root,
        group => root,
        #notify => Service["devagentd"],
    }

    file { '/usr/local/etc/devagent/nic-conf':
        path => '/usr/local/etc/devagent/nic-conf',
        ensure => file,
        content => template("cv/nic-conf.erb"),
        owner => root,
        group => root,
    }

    file { '/opt/collect-agent/etc/collector/conf/agent_prop.properties':
        path => '/opt/collect-agent/etc/collector/conf/agent_prop.properties',
        ensure => file,
        content => template("cv/agent_prop.properties.erb"),
        owner => root,
        group => root,
        notify => Service["collect-agent"],
    }

    file { '/opt/collect-agent/etc/collector/conf/mq_prop.properties':
        path => '/opt/collect-agent/etc/collector/conf/mq_prop.properties',
        ensure => file,
        content => template("cv/mq_prop.properties.erb"),
        owner => root,
        group => root,
        notify => Service["collect-agent"],
    }

    file { '/opt/zkclient/share/zkclient.xml':
        path => '/opt/zkclient/share/zkclient.xml',
        ensure => file,
        content => template("cv/zkclient.xml.erb"),
        owner => root,
        group => root,
        notify => Service["zkclient"],
    }
}