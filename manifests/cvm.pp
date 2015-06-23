class cv::cvm {
    exec { "cvsetupcvm":
        path =>  "/sbin:/usr/sbin:/usr/local/sbin:/root/bin:/usr/local/bin:/usr/bin:/bin:",
        command => "/usr/local/bin/cv setup cvm  >& /tmp/cv_setup_cvm.log",
        timeout => 600,
        require => Class["cv::config"]
    }
}
