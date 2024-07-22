Monitoring/Nagios plugins to check perfSONAR Toolkit installation:
- `check_ps` - checks perfSONAR toolkit installation including:
    - perfSONAR configuration: contacts	
    - perfSONAR configuration: location	 
    - perfSONAR configuration: meshes
    - perfSONAR hardware check
    - perfSONAR json summary
    - perfSONAR services: bwctl
    - perfSONAR services: owamp
    - perfSONAR services: http/https
    - perfSONAR services: ndt/npad disabled
    - perfSONAR services: ntp
    - perfSONAR services: regular testing/pscheduler
    - perfSONAR services: versions

```bash
OMD[etf]:~$ /usr/lib64/nagios/plugins/check_ps --help
usage: check_ps [-h] [--version] [-H HOSTNAME] [-w WARNING] [-c CRITICAL] [-d]
                [-p PREFIX] [-s SUFFIX] [-t TIMEOUT] [-C COMMAND] [--dry-run]
                [-o OUTPUT] [--hostcert HOSTCERT] [--hostkey HOSTKEY]
                [-T REQ_TIMEOUT] [--target-version TARGET_VERSION]
                [--target-memory TARGET_MEMORY] [--dirq DIRQ] [--topic TOPIC]

Checks basic properties of a perfSONAR Toolkit installation

optional arguments:
  -h, --help            show this help message and exits
  --version             show program version number and exits
  -H HOSTNAME, --hostname HOSTNAME
                        Host name, IP Address, or unix socket (must be an
                        absolute path)
  -w WARNING, --warning WARNING
                        Offset to result in warning status
  -c CRITICAL, --critical CRITICAL
                        Offset to result in critical status
  -d, --debug           Specify debugging mode
  -p PREFIX, --prefix PREFIX
                        Text to prepend to ever metric name
  -s SUFFIX, --suffix SUFFIX
                        Text to append to every metric name
  -t TIMEOUT, --timeout TIMEOUT
                        Global timeout for plugin execution
  -C COMMAND, --command COMMAND
                        Nagios command pipe for submitting passive results
  --dry-run             Dry run, will not execute commands and submit passive
                        results
  -o OUTPUT, --output OUTPUT
                        Plugin output format; valid options are nagios,
                        check_mk or passive (via command pipe); defaults to
                        nagios)
  --hostcert HOSTCERT   Path to hostcert.pem
  --hostkey HOSTKEY     Path to hostkey.pem
  -T REQ_TIMEOUT, --requests-timeout REQ_TIMEOUT
                        Timeout for HTTP(s) requests
  --target-version TARGET_VERSION
                        Target toolkit version
  --target-memory TARGET_MEMORY
                        Target amount of memory on the toolkit
  --dirq DIRQ           Directory queue for summaries
  --topic TOPIC         Topic for summaries
```


- `check_ps_es` - checks if esmond contains measurements as configured in the mesh config for given host,i.e. checks freshness of results in esmond by looking at the meta-data and comparing them to the list
of tests/tasks defined for the host in the mesh config. This is a high level functional check, which doesn't query the raw data, it relies on looking up esmond metadata (thus effectively only queries postgres). It requires a working instance
of mesh-config interface to check what tests are supposed to be running on a given host. It reports missing results per mesh (list of missing destinations for uni-directional tests or
list of missing sources for bi-directional tests).

```bash
OMD[etf]:~$ /usr/lib64/nagios/plugins/check_ps_es --help
usage: check_ps_es [-h] [--version] [-H HOSTNAME] [-w WARNING] [-c CRITICAL]
                   [-d] [-p PREFIX] [-s SUFFIX] [-t TIMEOUT] [-C COMMAND]
                   [--dry-run] [-o OUTPUT] [--hostcert HOSTCERT]
                   [--hostkey HOSTKEY] [-T REQ_TIMEOUT] [-e EVENTS]
                   [-r TIMERANGE] [-R] [-M AUTOURL] [--esmond ESMOND]

Checks metadata in esmond wrt. tests configured in the mesh config

optional arguments:
  -h, --help            show this help message and exits
  --version             show program version number and exits
  -H HOSTNAME, --hostname HOSTNAME
                        Host name, IP Address, or unix socket (must be an
                        absolute path)
  -w WARNING, --warning WARNING
                        Offset to result in warning status
  -c CRITICAL, --critical CRITICAL
                        Offset to result in critical status
  -d, --debug           Specify debugging mode
  -p PREFIX, --prefix PREFIX
                        Text to prepend to ever metric name
  -s SUFFIX, --suffix SUFFIX
                        Text to append to every metric name
  -t TIMEOUT, --timeout TIMEOUT
                        Global timeout for plugin execution
  -C COMMAND, --command COMMAND
                        Nagios command pipe for submitting passive results
  --dry-run             Dry run, will not execute commands and submit passive
                        results
  -o OUTPUT, --output OUTPUT
                        Plugin output format; valid options are nagios,
                        check_mk or passive (via command pipe); defaults to
                        nagios)
  --hostcert HOSTCERT   Path to hostcert.pem
  --hostkey HOSTKEY     Path to hostkey.pem
  -T REQ_TIMEOUT, --requests-timeout REQ_TIMEOUT
                        Timeout for HTTP(s) requests
  -e EVENTS, --events EVENTS
                        Comma separated list of events to query
  -r TIMERANGE, --timerange TIMERANGE
                        Time interval for esmond query
  -R, --reverse         Check reverse direction
  -M AUTOURL, --host-autourl AUTOURL
                        Mesh config auto-URL
  --esmond ESMOND       Specify explicit esmond location (to be used instead
                        of hostname/esmond)
```