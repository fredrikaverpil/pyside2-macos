# pyside2-macos

[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-macos.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-macos) [![Latest release](http://github-release-version.herokuapp.com/github/fredrikaverpil/pyside2-macos/release.svg?style=flat)](https://github.com/fredrikaverpil/pyside2-macos/releases/latest)


<br><br>


## Sister projects

- [pyside2-linux](https://github.com/fredrikaverpil/pyside2-linux)
- pyside2-macos (this project)
- [pyside2-windows](https://github.com/fredrikaverpil/pyside2-windows)


<br><br>


## Download the standalone wheels

[Releases](https://github.com/fredrikaverpil/pyside2-macos/releases) contain built PySide2 wheels.

<br><br>


## Known issues

### Build issues

TBD

### Upstream issues

All upstream issues should be reported in the [official PySide issue tracker](https://bugreports.qt.io/projects/PYSIDE/issues).

Note: PRs attempting to fix upstream fixes will not be accepted. Please send your PR upstream instead.

<br><br>


### Tagging creates a new relese

Manual tagging causes Travis CI to generate a Github release and attach the built wheels to it. Tag using semver (`[v]major.minor.patch` or `YY.MM.DD`), e.g. `2018.01.01`, since PySide2 does not yet have a maintained version string.

```bash
git commit -am "Commit all changes..."
git push  # triggers an AppVeyor build
git tag 2018.01.01
git push origin 2018.01.01  # cancels previous build, starts new build and generates release
```


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
