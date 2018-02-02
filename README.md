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

PySide2 needs to be built on the macOS version corresponding to the macOS version used to build the pre-compiled Qt binaries. This means PySide2-5.6 will work on macOS 10.11+ and PySide2-5.9 will work on macOS 10.12+.

### Target deployment platform versions

See Coin CI platform configs for:
- [Qt 5.6 "Packaging" tag macOS version](http://code.qt.io/cgit/qt/qt5.git/tree/coin/platform_configs/default.txt?h=5.6)
- [Qt 5.9 "Packaging" tag macOS version](http://code.qt.io/cgit/qt/qt5.git/tree/coin/platform_configs/default.txt?h=5.9)

Go to https://testresults.qt.io/coin/  and find a Qt5 build with a matching config. Look at the build log of `qtbase`, search for `-mmacosx-version` and get the value of this option. This marks the lowest target deployment version.

The value can be set as environment variable `MACOSX_DEPLOYMENT_TARGET` during build time.

Note: a simpler way of finding the deployment target is to grep for `QMAKE_MACOSX_DEPLOYMENT_TARGET` in `qtbase`, which is set in mkspecs/macx-clang/qmake.conf in 5.6,5.9,5.10 at least.

### Build platform versions

The official advice is use latest macOS, latest xcode, latest sdk. Pragmatic advice is whatever runs on your machine and succeeds at building.



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


### Ask questions in the PySide/PySide2 Gitter

If you have any general questions, please check out the [PySide2 Gitter community](https://gitter.im/PySide/pyside2). If you prefer IRC, check out `#qt-pyside` on irc.freenode.net.


### Useful links

- [PySide2 Getting Started Wiki](https://wiki.qt.io/PySide2_GettingStarted)
- [Coin CI pyside-setup](https://testresults.qt.io/coin/?project=pyside%2Fpyside-setup)
- Supported platforms and configurations
  - [Qt 5.6](https://doc.qt.io/qt-5.6/supported-platforms-and-configurations.html)
  - [Qt 5.9](https://doc.qt.io/qt-5.9/supported-platforms-and-configurations.html)
