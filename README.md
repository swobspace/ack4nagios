ack4nagios
==========

ack4nagios is a rails application to acknowledge failed nagios 
services and execute additional actions i.e. send an email, 
create an otrs ticket and so on. ack4nagios is intended to integrate 
in any web GUI for Nagios via action_url, it does not replace 
such a web GUI by itself.

I'm using [OMD, the open monitoring distribution](http://www.omdistro.org) 
to install Nagios and Livestatus. OMD can manage multiple monitoring instances
in parallel on single server. Each instance is called a site. ack4nagios
adapts this logic to handle multiple sites at onces. A site contains the 
configuration parameters to access your livestatus module. There is no need to
use OMD, but you have to create at least one site in ack4nagios to configure
livestatus access of your monitoring installation.

Versions
--------

| branch     | rails | ruby   | bootstrap | icons           | wobapphelpers |
|            |       |        |           |                 | + wobauth     |
|------------|-------|--------|-----------|-----------------|---------------|
| master     | >=5.1 | >= 2.3 |  v3       | glyphicons      | 2-0-stable    |
| 0.2-stable |  4.2  | >= 2.3 |  v3       | glyphicons      | 1-0-stable    |

Breaking Change
---------------
In Version 1.0 OTRS is disabled. May be readded later.

Requirements
------------

* Nagios with livestatus broker module loaded, see http://mathias-kettner.de/checkmk_livestatus.html for details.

System dependencies
-------------------
Nagios with the livestatus broker module must be running on the same host as ack4nagios.

Licence
-------

ack4nagios Copyright (C) 2014-2018  Wolfgang Barth

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Nagios is a trademark of Nagios Enterprises LLC, U.S.A
