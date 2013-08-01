Snowbunny
=============

A development environment / playground for applications built upon [Apache Sling](http://sling.apache.org)

Index
------------

- [Overview](#overview)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Binaries](#binaries)
  - [Source](#source)
- [Tools](#tools)
  - [Administration](#administration)
- [Shell Access](#shell-access)
  - [Internal](#internal)
  - [External](#external)
- [Components](#components)
  - [Apache Sling](#apache-sling)
  - [Cloud9 IDE](#cloud9-ide)
  - [Ripple Emulator](#ripple-emulator)
  - [Vagrant](#vagrant)
  - [Virtualbox](#virtualbox)
- [Roadmap](#roadmap)
- [License](#license)

Overview
------------

Get a glimps of what this is about [here](http://slid.es/giannifurger/snowbunny/fullscreen)

Installation
------------

#### Prerequisites

* [Virtualbox](http://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)

### Binaries

A pre-built vagrant box package can be downloaded [here](https://github.com/alternatex/snowbunny/archive/1.0.0.tar.gz).

### Source

```bash

# create workspace
mkdir snowbunny && $_;

# fetch latest sources
git clone https://github.com/alternatex/snowbunny.git .

# initialize vagrant box
vagrant init
vagrant up

# run installer
scp src/scripts/setup/install.sh vagrant@localhost:
ssh vagrant@localhost './install.sh'

# ...
```

Tools
------------

### Administration

[Snowbunny UI](https://github.com/alternatex/snowbunny-ui)

Shell Access
------------

### Internal 

You can connect to the development environment using the command `vagrant ssh` (defaults).

### External 

Use `tunnelx` to easily access the environment with limited access.

Components
------------

### Apache Sling

[https://sling.apache.org/](https://sling.apache.org/)

> Apache Sling is a web framework that uses a Java Content Repository, such as Apache Jackrabbit, to store and manage content.

> Sling applications use either scripts or Java servlets, selected based on simple name conventions, to process HTTP requests in a RESTful way.

> The embedded Apache Felix OSGi framework and console provide a dynamic runtime environment, where code and content bundles can be loaded, unloaded and reconfigured at runtime.

> As the first web framework dedicated to JSR-170 Java Content Repositories, Sling makes it very simple to implement simple applications, while providing an enterprise-level framework for more complex applications.

### Cloud9 IDE

[https://github.com/ajaxorg/cloud9/](https://github.com/ajaxorg/cloud9/)

> Cloud9 is an open source IDE built with Node.JS on the back-end and JavaScript/HTML5 on the client. It is very actively maintained by about 20 developers in both Amsterdam and San Francisco and is one component of the hosted service at c9.io. The version available here runs on your local system.

> Cloud9 balances the power of traditional desktop IDEs with the simplicity and elegance of editors like TextMate and Sublime.

> Cloud9 is built entirely on a web stack, making it the most hacker-friendly IDE today. Fork it, hack it, and if you think others would benefit, issue a pull request on this repo and we'll take a look. If you have any questions, meet us in #cloud9ide on irc.freenode.net or ask us on Twitter @Cloud9IDE.

### Ripple Emulator

[http://ripple.incubator.apache.org/](http://ripple.incubator.apache.org/)

> Apache Ripple™ is a web based mobile environment simulator designed to enable rapid development of mobile web applications for various web application frameworks, such as Apache Cordova™ and BlackBerry® WebWorks™. It can be paired with current web based mobile development workflows to decrease time spent developing and testing on real devices and/or simulators.

> It is free software, licensed under the Apache License, Version 2.0.

### Vagrant

[http://www.vagrantup.com](http://www.vagrantup.com)

> Vagrant provides easy to configure, reproducible, and portable work environments built on top of industry-standard technology and controlled by a single consistent workflow to help maximize the productivity and flexibility of you and your team.

> To achieve its magic, Vagrant stands on the shoulders of giants. Machines are provisioned on top of VirtualBox, VMware, AWS, or any other provider. Then, industry-standard provisioning tools such as shell scripts, Chef, or Puppet, can be used to automatically install and configure software on the machine.

### Virtualbox

[http://www.virtualbox.org](http://www.virtualbox.org)

> VirtualBox is a powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use. Not only is VirtualBox an extremely feature rich, high performance product for enterprise customers, it is also the only professional solution that is freely available as Open Source Software under the terms of the GNU General Public License (GPL) version 2. See "About VirtualBox" for an introduction.

Roadmap 
-------------

### Cloud9 IDE

- Syntax Highlightning for .esp files

License
------------
Released under two licenses: new BSD, and MIT. You may pick the
license that best suits your development needs.

https://raw.github.com/alternatex/snowbunny/develop/LICENSE
