How to test with a running instance of livestatus
=================================================

* Install omd or another nagios environment with livestatus running.
* edit spec/.localenv (use spec/.env as template):

    LIVESTATUS_SOCKET="/omd/sites/xyz/tmp/run/live"
    HOST_NAME="localhost"

