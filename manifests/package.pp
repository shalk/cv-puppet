class cv::package{
  $package = ["storage-agent","collect-agent","host-agent","devagent","ocfs2-kmp-xen","ocfs2-tools","cv","cvm-install"]
  
  package { $package:
    ensure => installed
  }
  
}
