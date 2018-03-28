# rodev

[![Travis build status](https://travis-ci.org/ropenscilabs/rodev.svg?branch=master)](https://travis-ci.org/ropenscilabs/rodev) [![Coverage status](https://codecov.io/gh/ropenscilabs/rodev/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/rodev?branch=master) [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)


The goal of rodev is to help rOpenSci package developpers with common tasks, and to promote best practices like the use of status badges across the entire suite.

## Installation

You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ropenscilabs/rodev")
```
## Example

This is a basic example which shows you how to solve a common problem (using `usethis` internal functions for now):

``` r
rodev::use_repostatus_badge("wip")
```

## Meta

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

