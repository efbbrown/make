# make R package

## Effective data management tool. Great for compartmentalising code, caching expensive manipulations & changing environments.

### Code primarily by Derek Slone-Zhen, documentation & code additions by Eugene Brown.

`make` consists of two functions; `make(...)` & `make_once(...)`.

These functions are greatly useful in a few scenarios:

* Local data storage management
* Compartmentalising code & enabling efficient project structuring.
* Maintaining a smooth workflow in otherwise debilitating situations eg. offline sessions.

## Installation

The package is not yet available on CRAN but can be downloaded from GitHub in either of the following ways:

### Method 1 - devtools

```r
# install.packages("devtools")
devtools::install_github("efbbrown/make")
```

### Method 2 - pacman

```r
# install.packages("pacman")
pacman::p_load_gh("efbbrown/make")
```