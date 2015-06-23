class cv::clean (
 $cv_clean_all = false
)
{
    exec { "cvcleanall":
        path =>  "/sbin:/usr/sbin:/usr/local/sbin:/root/bin:/usr/local/bin:/usr/bin:/bin:",
        command => "/usr/local/bin/cv clean all  >& /tmp/cv_clean_all.log",
        timeout => 600,
    }
  if ( $cv_clean_all ) {
      Class["cv::clean"]->Class["cv::config"]
  }
}
