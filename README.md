# pyside2-macos

[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-macos.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-macos) [![Latest release](http://github-release-version.herokuapp.com/github/fredrikaverpil/pyside2-macos/release.svg?style=flat)](https://github.com/fredrikaverpil/pyside2-macos/releases/latest)

Unoffical PySide2 standalone wheels for macOS.


## Sister projects

- [pyside2-linux](https://github.com/fredrikaverpil/pyside2-linux)
- pyside2-macos (this project)
- [pyside2-windows](https://github.com/fredrikaverpil/pyside2-windows)


## Download the standalone wheels

[Releases](https://github.com/fredrikaverpil/pyside2-macos/releases) contain built PySide2 wheels.


## How does this work?

### Travis CI setup

A build matrix is set up in Travis CI, which will download and install all requirements before building PySide2.

Unfortunately, I cannot just select all components of the Qt installation, as this will consume too much time out of the 50 minute build job limit. I'm trying to use Travis cache for this, but have been unsuccessful setting this up...

If a `git tag` initiated the build, a Github release is peformed. All built wheels are deployed and attached to the Github release.

Job auto cancellation is enabled for this project in Travis CI, which means that queued up jobs are cancelled if a new job is initiated within the same branch.


### Tagging creates a new relese

Manual tagging causes a Github release to be created through CI deploy. PySide2 wheels will be attached to the release notes as they are fully built. Tag using semver (`[v]major.minor.patch` or `YY.MM.DD`), e.g. `2018.01.01`, since PySide2 does not yet have a maintained version string.

```bash
git commit -am "Commit all changes..."
git push  # triggers a build
git tag 2018.01.01
git push origin 2018.01.01  # cancels previous build, starts new build and generates release
```


### A note on Upstream issues

All upstream issues should be reported in the [official PySide issue tracker](https://bugreports.qt.io/projects/PYSIDE/issues).

Note: PRs attempting to fix upstream fixes will not be accepted. Please send your PR upstream instead.


### Ask questions in the PySide/PySide2 gitter

If you have any general questions, please check out the [PySide2 Gitter community](https://gitter.im/PySide/pyside2). If you prefer IRC, check out `#qt-pyside` on irc.freenode.net.


## Temporary notes

> Q: Except pre-built binaries, which parts of the Qt install needs to be checked
> for an "as complete build" of PySide2 as possible?
>
> A: Aside from the platform, you might want to check charts, webengine, location, and script
> 
> Q: is this true for both 5.6 and 5.9 branches of PySide2?
>
> A: no, location needs to be checked in 5.6, but not in 5.9, and charts bindings are not
> present in 5.6 afaik


### Useful links

- [PySide2 Getting Started Wiki](https://wiki.qt.io/PySide2_GettingStarted)
- [Coin CI pyside-setup](https://testresults.qt.io/coin/?project=pyside%2Fpyside-setup)
- Supported platforms and configurations
  - [Qt 5.6](https://doc.qt.io/qt-5.6/supported-platforms-and-configurations.html)
  - [Qt 5.9](https://doc.qt.io/qt-5.9/supported-platforms-and-configurations.html)
