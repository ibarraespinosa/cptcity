NEWS
===========

### cptcity v1.1.1 (Release date: 2026-07-20)

- **URL:** cpt-city archive moved from `soliton.vm.bytemark.co.uk` to `phillips.shef.ac.uk`. All documentation updated.
- **`cpt()`:** added error message for unknown palette names.
- **`cpt()`:** improved documentation explaining `colorRampPalette` vs character-vector return — `sf` users need `colorRampPalette = TRUE`.
- **`find_cpt()`:** now case-insensitive by default (`ignore.case = TRUE`). Added `fixed` argument for literal (non-regex) matching.
- **`lucky()`:** deduplicated internal `runif` call. Guards against out-of-range index.
- **`show_cpt()`:** moved `on.exit(par(oldpar))` to top of function. Cleaner grid layout logic and better margins.
- **Tests:** added tests for sf integration, `find_cpt` case sensitivity, `frgb` scaling, unknown palette error, and `colorRampPalette` return type.
- **Documentation:** all `.R` files re-documented with comprehensive roxygen2 entries.

### cptcity v1.1.0 (Release date: 2023-08-13)

- Planned release

### cptcity v1.0.5 (Release date: 2019-11-07)

- Add argument frgb to change internal rgb composition

### cptcity v1.0.3 (Release date: 2018-04-17)

- Add argument colorRampPalette to return this function


### cptcity v1.0.2 (Release date: 2018-03-09)

- Fix documentation

### cptcity v1.0.1 (Release date: 2018-03-06)

- Fix documentation
- Included *lucky* function!


### cptcity v1.0.0 (Release date: 2018-02-23)

- Incorporated 7140 colour gradients cpt-city_2.19-1 http://soliton.vm.bytemark.co.uk/pub/cpt-city/pkg/
- Only two gradients were not incorporated: http://soliton.vm.bytemark.co.uk/pub/cpt-city/gmt/tn/GMT_cyclic.png.index.html
 http://soliton.vm.bytemark.co.uk/pub/cpt-city/jjg/hatch/tn/diag5.png.index.html
- Added the function find_cpt.
- Renamed the existing gradients to the new names, for instance, "inferno" is
now "mpl_inferno".
- Added a dataset with the names of the colour gradients.

### cptcity v0.1.1 (Release date: 2018-02-16)

- Adding 4 gradients
- cptcity renamed as cpt which nows is a function

### cptcity v0.1.0 (Release date: 2018-02-06)

- release including 4 gradients

