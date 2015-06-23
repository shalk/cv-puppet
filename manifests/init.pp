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
   $cv_mgmt_vlan = undef  ,
   $cv_biz_vlan  = undef ,
   $cv_stor_vlan  = undef ,
   $cv_mgmt_nic = undef,
   $cv_biz_nic = undef,
   $cv_stor_nic = undef ,

   
   $cv_cvm_mgmt_ip  ,

   $cv_collet_server_ip = $cv_cvm_mgmt_ip,
   $cv_zookeeper_cluster = undef,


   $cv_cvm_mgmt_netmask = '255.255.255.0',
   $cv_cvm_default_gateway  = '10.0.33.254',
    
   $cv_cvm_biz_novlan_ip = "" ,
   $cv_cvm_biz_vlan_netmask  = '255.255.255.0',
   $cv_cvm_biz_vlan_ip   = "" ,
   $cv_cvm_biz_novlan_netmask = '255.255.255.0' ,
   
   $cv_ntpip =  $cv_cvm_mgmt_ip ,
   
   $cv_cvmpath = '/root/vhd',
   $cv_vhd_for_install_dir = '/cvm/',
   $cv_install_cvm = false,
   $cv_clean_all   = false
   )
 {
 include cv::package
 include cv::service
# Class["cv::packge"]->Class["cv::config"]~>Class["cv::service"]
  class { 'cv::config':
  cv_mgmt_vlan => $cv_mgmt_vlan ,
  cv_biz_vlan  => $cv_biz_vlan  ,
  cv_stor_vlan => $cv_stor_vlan  ,
  cv_mgmt_nic  => $cv_mgmt_nic   ,
  cv_biz_nic   => $cv_biz_nic    ,
  cv_stor_nic  => $cv_stor_nic   ,
  cv_collet_server_ip      =>  $cv_collet_server_ip,
  cv_zookeeper_cluster     =>  $cv_zookeeper_cluster,
    
  cv_cvm_mgmt_ip           =>  $cv_cvm_mgmt_ip  ,
  cv_cvm_mgmt_netmask      =>  $cv_cvm_mgmt_netmask ,

  cv_cvm_default_gateway   =>  $cv_cvm_default_gateway ,

  cv_cvm_biz_novlan_ip     =>  $cv_cvm_biz_novlan_ip,
  cv_cvm_biz_vlan_netmask  =>  $cv_cvm_biz_vlan_netmask ,
  cv_cvm_biz_vlan_ip       =>  $cv_cvm_biz_vlan_ip   ,
  cv_cvm_biz_novlan_netmask=>  $cv_cvm_biz_novlan_netmask,

  cv_ntpip                 =>  $cv_ntpip,

  cv_cvmpath               =>  $cv_cvmpath,
  cv_vhd_for_install_dir   =>  $cv_vhd_for_install_dir,
    } 
  class{"cv::clean":
  cv_clean_all => $cv_clean_all,
  }

  if ( $cv_install_cvm ) { 
      include cv::cvm
  }
    
    
 }
 
