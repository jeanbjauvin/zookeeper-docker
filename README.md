Apache ZooKeeper on Docker
======================

This repository holds a build definition and supporting files for building a
[Docker] image to run [ZooKeeper] in containers. It is published as an Automated
Build [on Docker Hub], as `jeanbjauvin/zookeeper`.

If you find any shortcomings with the build regarding operability, pull requests
or feedback via GitHub issues are welcomed.

[Docker Compose]: https://docs.docker.com/compose/

License
-------

Copyright (C) 2017 Jean Bruno JAUVIN

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Usage Quick Start
-----------------

Here is a minimal-configuration example running the Kafka broker service, then
using the container as a client to run the basic producer and consumer example
from [the Kafka Quick Start]:

```
$ docker run -d --name ZooKeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 jeanbjauvin/zookeeper:latest
```

### Volumes

The container exposes two volumes that you may wish to bind-mount, or process
elsewhere with `--volumes-from`:

- `/data`: Path where ZooKeeper's data is stored (`dataDir` in ZooKeeper configuration)
- `/zookeeper/conf/zoo.cfg`: Path where ZooKeeper's configuration is written

### Ports and Linking

The container publishes three ports:

- `2181`: ZooKeeper client port
- `2888`: ZooKeeper follower port
- `3888`: ZooKeeper election port

Configuration
-------------

This image uses ZooKeeper's default configuration.

If you want to change it link your own configuration file with `-v <path to config file>/zoo.cfg:/zookeeper/conf/zoo.cfg`

## Disclaimer

This Docker build is based on image provided by jplock/zookeeper <http://hub.docker.com/r/jplock/zookeeper>

My original motivations for forking were:

- Change the base image to use an alpine-based image

You can check the [CHANGELOG](https://github.com/jeanbjauvin/kafka-zookeeper/blob/master/CHANGELOG.md)


[Docker](http://www.docker.io)

[ZooKeeper](https://zookeeper.apache.org/)

[on Docker Hub](https://hub.docker.com/r/jeanbjauvin/kafka/)

[the ZooKeeper Getting Started](https://zookeeper.apache.org/doc/trunk/ZooKeeperStarted.html)

[ZooKeeper License](https://github.com/apache/zookeeper/blob/release-3.4.10/LICENSE.txt)
