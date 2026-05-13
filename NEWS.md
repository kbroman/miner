## miner version 0.2.6 (2026-05-13)

### Bug fixes

- Add loops to try to get `getPlayerRotation()`, `getPlayerPitch()`,
  and `getPlayerDirection()` to give fewer null results.

- The API for `getPlayerRotation()` seems to give incorrect values
  when `player_id` is `NULL`, so now using `getPlayerDirection()` and then
  converting to the rotation. (Issue #26)


## miner version 0.2.5 (2026-05-11)

### Minor changes

- Revised the Dockerfile, for installing minecraft in a docker container

- Fixed a typo in the vignette


## miner verison 0.2.3 (2020-12-14)

### Minor changes

- The miner package was moved from ropenscilabs to kbroman,
  <https://github.com/kbroman/miner>


## miner version 0.2.2 (2019-03-10)

### Minor changes

- Convert documentation to markdown


## miner version 0.1.6 (2019-02-11)

### New features

- Updated `Dockerfile` to the latest version of the RaspberryJuice
  plugin, 1.11.

- A bunch of new functions available with the latest version of the
  RaspberryJuice plugin (1.11): `getPlayerId()`, `getPlayerName()`,
  `getEntityTypes()`, `spawnEntity()`, `setDirection()`,
  `setRotation()`, and `setPitch()`.

- Added `find_entity()` for searching the output of `getEntityTypes()` to
  find a particular type of entity. This is similar to `find_item()`.


## miner version 0.1.5 (2019-02-10)

### Minor changes

- Clarified, and added further details to, some of the documentation.

### Bug fixes

- `miner::find_item()` now works when the package isn't loaded.
