# Class: cv
#
# This module manages cv
#
# Parameters: cv_mgmt_vlan  cv_biz_vlan cv_stor_vlan
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
 class cv (
   $cv_mgmt_vlan  = 2,
   $cv_biz_vlan = 4,
   $cv_stor_vlan  = 8,
   $cv_mgmt_nic,
   $cv_biz_nic,
   $cv_stor_nic,
   $cv_collet_server_ip,
   $cv_zookeeper_cluster,
 
 )
 
 {
     include cv::service
     class { 'cv::config':
      cv_mgmt_vlan => $cv_mgmt_vlan,
      cv_biz_vlan  => $cv_biz_vlan  ,
      cv_stor_vlan => $cv_stor_vlan  ,
      cv_mgmt_nic  => $cv_mgmt_nic   ,
      cv_biz_nic   => $cv_biz_nic    ,
      cv_stor_nic  => $cv_stor_nic   ,
      cv_collet_server_ip =>  $cv_collet_server_ip,
      cv_zookeeper_cluster =>  $cv_zookeeper_cluster,
    }
 }
 