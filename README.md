# rodev <img src='man/figures/logo.png' align="right" height="134.5" />

[![Travis build status](https://travis-ci.com/ropenscilabs/rodev.svg?branch=master)](https://travis-ci.com/ropenscilabs/rodev) [![Coverage status](https://codecov.io/gh/ropenscilabs/rodev/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/rodev?branch=master) [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)


The goal of rodev is to help rOpenSci package developpers with common tasks, and to promote best practices like the use of status badges across the entire suite.

## Installation

You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ropenscilabs/rodev")
```
## Functions

``` r
# add a repostatus.org badge
use_repostatus_badge("wip")

# get the peer-review badge corresponding to onboarding issue 24
use_review_badge(24)

# get rOpenSci footer
use_ro_footer()

# browse the packaging guide
read_pkg_guide()

# add rOpenSci as a funder (for staff packages)
add_ro_fnd()

# add rOpenSci peer-review (for onboarded packages)
add_ro_desc()

# add templates for issues, PR and CONTRIBUTING
use_ro_github(package_name = "blabla")
```

See the [issue tracker](https://github.com/ropenscilabs/rodev/issues) for feature suggestions.

## Meta

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

