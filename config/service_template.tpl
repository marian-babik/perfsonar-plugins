define service {
    use                    ncgx-generic-service
    host_name              ::hostname
    service_description    ::metric
    check_command          ::t_function(check_command)
    normal_check_interval  ::interval|60
    retry_check_interval   ::retry_interval|15
    max_check_attempts     ::max_check_attempts|1
    obsess_over_service    ::ocsp|1
    notification_interval  10080
    ::t_function(contacts)
    ::t_function(docs)
    ::t_function(stream)
    ::t_function(passive)
    ::t_function(service_groups)
}

::t_function(service_dependency)