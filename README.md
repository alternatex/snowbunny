Snowbunny
=============

A development environment / playground for applications built upon [Apache Sling](http://sling.apache.org)

Index
------------

- [Overview](#overview)
- [Installation](#installation)
  - [Binaries](#binaries)
      - [Download](#download)
  - [Source](#source)
      - [Prerequisites](#prerequisites)
      - [Building](#building)
- [Configuration](#configuration)
- [Components](#components)
  - [Node-Webkit](#node-webkit)
  - [Apache Sling](#apache-sling)
  - [Cloud9 IDE](#cloud9-ide)
  - [Ripple Emulator](#ripple-emulator)
- [Sugar](#sugar)
  - [Source Code Management](#source-code-management)
- [License](#license)

<!--
- [Tour](#tour)
  - [Tray Menu](#tour-tray-menu)
  - [Cloud9 IDE](#tour-cloud9-ide)
  - [Sling Browser](#tour-sling-browser)
  - [Sling Console](#tour-sling-console)
  - [Ripple Emulator](#tour-ripple-emulator)
  - [Version Control](#tour-version-control)
-->

<!--
Bootstrap
------------

Cloud9 is started automatically with it's process bound to Snowbunny as parent process / lifecycle. 

Post starting Cloud9 Sling availability is checked using an HTTP request. XXX this request fails a Sling instance will be started automatically aswell. 

A WebDav mount to connect the two is initiated as soon as Sling is ready to operate.
-->

Overview
------------

Get a glimps of what this is about [here](http://slid.es/giannifurger/snowbunny/fullscreen)

Installation
------------

### Binaries

#### Download

A pre-built vagrant box package can be downloaded [here](https://github.com/alternatex/snowbunny/archive/1.0.0.tar.gz).

### Source

#### Prerequisites

* [Virtualbox](http://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)
* [Maven 3.x](http://maven.apache.org)

#### Building

```bash

# create workspace
mkdir snowbunny-dev && $_;

# fetch latest sources
git clone https://github.com/alternatex/snowbunny.git .

# initialize vagrant box
vagrant init
vagrant up

# scp copy-over 
scp setup.sh vagrant@localhost:

# ssh run setup *
ssh vagrant@localhost 'chmod a+x setup.sh && sudo ./setup.sh'

# ...

```

Configuration
------------

...

Workflow
------------

...

Components
------------

### Node-Webkit

[https://github.com/rogerwang/node-webkit](https://github.com/rogerwang/node-webkit)

> node-webkit is an app runtime based on Chromium and node.js. You can write native apps in HTML and Javascript with node-webkit. It also lets you to call Node.js modules directly from DOM and enables a new way of writing native applications with all Web technologies.

> It's created and developed in Intel Open Source Technology Center.

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

Sugar
------------

### Source Code Management

Manage source files easily using `git` via Cloud9 console:

```shell
git init
git remote add origin https://github.com/username/repository
git add content 
git commit -m "initial commit" -a
git push -u origin master
```

Todo
------------

- Cloud9 IDE: Syntax Highlightning for .esp files

License
------------
Released under two licenses: new BSD, and MIT. You may pick the
license that best suits your development needs.

https://raw.github.com/alternatex/snowbunny/develop/LICENSE
