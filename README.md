# pyside2-macos

[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-macos.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-macos)

Unoffical PySide2 standalone wheels for macOS.

:fire: _Official_ wheels are now available as [Qt for Python](https://www.qt.io/qt-for-python) (PySide2) has officially been released by The Qt Company. I am **no longer going to maintain this repository** for this reason. Go get the official wheels!


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


### Target deployment platform versions

PySide2 for macOS should be built using the latest and greatest in terms of macOS version, Xcode version etc. A deployment target platform is then specified (e.g. `--osx-deployment-target=10.10`) to mark which minimum macOS version can use the built wheel.

The deployment target for each Qt version can be found by grep'ing `QMAKE_MACOSX_DEPLOYMENT_TARGET` in `qtbase`, which is set in `mkspecs/macx-clang/qmake.conf` for the 5.6, 5.9, 5.10 branches:
- [Qt 5.6](http://code.qt.io/cgit/qt/qtbase.git/tree/mkspecs/macx-clang/qmake.conf?h=5.6)
- [Qt 5.9](http://code.qt.io/cgit/qt/qtbase.git/tree/mkspecs/macx-clang/qmake.conf?h=5.9)
- [Qt 5.10](http://code.qt.io/cgit/qt/qtbase.git/tree/mkspecs/macx-clang/qmake.conf?h=5.10)
- [Qt 5.11](http://code.qt.io/cgit/qt/qtbase.git/tree/mkspecs/macx-clang/qmake.conf?h=5.11)

It can also be found in the Coin CI macOS platform configs marked with "Packaging" tag:
- [Qt 5.6](http://code.qt.io/cgit/qt/qt5.git/tree/coin/platform_configs/default.txt?h=5.6)
- [Qt 5.9](http://code.qt.io/cgit/qt/qt5.git/tree/coin/platform_configs/default.txt?h=5.9)
- [Qt 5.10](http://code.qt.io/cgit/qt/qt5.git/tree/coin/platform_configs/default.txt?h=5.10)
- [Qt 5.11](http://code.qt.io/cgit/qt/qt5.git/tree/coin/platform_configs/default.txt?h=5.11)

Go to https://testresults.qt.io/coin/ and find a Qt5 build with a matching config. Look at the build log of `qtbase`, search for `-mmacosx-version` and get the value of this option. This marks the lowest target deployment version.


### Build platform versions

The official advice is use latest macOS, latest xcode, latest sdk. Pragmatic advice is whatever runs on your machine and succeeds at building.


### A note on Upstream issues

All upstream issues should be reported in the [official PySide issue tracker](https://bugreports.qt.io/projects/PYSIDE/issues).

Note: PRs attempting to fix upstream fixes will not be accepted. Please send your PR upstream instead.


### Ask questions in the PySide/PySide2 Gitter

If you have any general questions, please check out the [PySide2 Gitter community](https://gitter.im/PySide/pyside2). If you prefer IRC, check out `#qt-pyside` on irc.freenode.net.


### Useful links

- [PySide2 website](https://wiki.qt.io/PySide2)
- [Coin CI pyside-setup](https://testresults.qt.io/coin/?project=pyside%2Fpyside-setup)
- Supported platforms and configurations
  - [Qt 5.6](https://doc.qt.io/qt-5.6/supported-platforms-and-configurations.html)
  - [Qt 5.9](https://doc.qt.io/qt-5.9/supported-platforms-and-configurations.html)
  - [Qt 5.10](https://doc.qt.io/qt-5.10/supported-platforms-and-configurations.html)
