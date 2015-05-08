class cv::service {
    service { 'devagentd':
        ensure => true,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
    service { 'storage-agent':
        ensure => true,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
    service { 'host-agent':
        ensure => true,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
    service { 'zkclient':
        ensure => true,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
    service { 'collect-agent':
        ensure => true,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
    service { 'cron':
        ensure => true,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}