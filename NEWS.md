## miner version 0.1.6 (2019-02-11)

### New features

- Updated `Dockerfile` to the latest version of the RaspberryJuice
  plugin, 1.11.

- A bunch of new functions available with the latest version of the
  RaspberryJuice plugin (1.11): `getPlayerId()`, `getPlayerName()`,
  `getEntityTypes()`

- Added `find_entity()` for search the output of `getEntityTypes()` to
  find a particular type of entity. This is similar to `find_item()`.


## miner version 0.1.5 (2019-02-10)

### Minor changes

- Clarified, and added further details to, some of the documentation.

### Bug fixes

- `miner::find_item()` now works when the package isn't loaded.