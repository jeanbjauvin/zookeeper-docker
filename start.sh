#!/bin/bash -x

# This file is part of zookeeper-docker.
#
# zookeeper-docker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# zookeeper-docker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with zookeeper-docker.  If not, see <http://www.gnu.org/licenses/>.

cat ${ZOOKEEPER_CONF_DIR}/zoo.cfg.template | sed \
-e "s|{{DATADIR}}|${ZOOKEEPER_DATADIR}|g" \
-e "s|{{CLIENTPORT}}|${ZOOKEEPER_CLIENT_PORT}|g" \
> /zookeeper/conf/zoo.cfg

exec /zookeeper/bin/zkServer.sh start-foreground
