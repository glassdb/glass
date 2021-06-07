# GLASS [![Build Status](https://github.com/glassdb/glass/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/glassdb/glass/actions/workflows/ci.yml)

## Installation

```Smalltalk
"Upgrade Metacello and Grease first"
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeGrease.

"Install GLASS from github"
GsDeployer deploy: [
 Metacello new
  baseline: 'GLASS1';
  repository: 'github://glassdb/glass:master/repository';
  get.
 Metacello new
  baseline: 'GLASS1';
  repository: 'github://glassdb/glass:master/repository';
  onLock: [:ex | ex honor ];
  load: 'default' ].
```
