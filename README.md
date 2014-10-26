stlhrt/consul-server
=========================
Docker base container for main [_Consul_](http://www.consul.io/) on Ubuntu Trusty Tahr.
Meant to be cluster controller, single by default but can be scaled up by changing environment variable.

Exposes volume for _Consul_ configuration files in /opt/consul/conf

Default configuration is provided in 50-defaults.json but can be overriden, just mount a directory with *.json files there and Consul will load them.

Exposes all _Consul_ ports for all transports as well as WEB UI, dns port is 53.