ack4nagios
==========

ack4nagios is a rails application to acknowledge failed nagios 
services and execute additional actions i.e. send an email, 
create an otrs ticket and so on.

ack4nagios is intended to integrate in any web gui for Nagios via action\_url, 
it does not replace such a web gui by itself.


**THIS APPLICATION IS WORK IN PROGRESS AND NOT FUNCTIONAL YET!** 
You will loose all your hair and teeth if you use this application ;-)

Requirements
------------

* ruby >= 2.0
* Nagios with livestatus broker module loaded, see http://mathias-kettner.de/checkmk_livestatus.html for details.

System dependencies
-------------------
TBD

Installation
------------
TBD

Configuration
-------------
TBD

Deployment
----------
TBD

Licence
-------

ack4nagios Copyright (C) 2014  Wolfgang Barth

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
