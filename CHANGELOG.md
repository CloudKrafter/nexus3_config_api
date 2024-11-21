# Changelog

## [v1.8.0] - 2024-11-21
### Added
- Configuring realms is now available through the `nexus_security_realms` variable. By default only NexusAuthenticatingRealm is enabled.
- Ability to manage SSL certificates in trust store (Adding and deleting)
- Create, update and delete LDAP conigurations


## [v1.7.0] - 2024-11-19
### Added
- Creating and deleting S3, File and Group blob stores. Might work with Azure and Google too, not tested.
- Creating, updating and deleting P2 proxy repos
- Creating, updating and deleting Cocoapods proxy repos
- Creating, updating and deleting Conda proxy repos
- Creating, updating and deleting Helm hosted and proxy repos
- Creating, updating and deleting Conan hosted and proxy repos
- Creating, updating and deleting Go group and proxy repos
- Creating, updating and deleting R hosted, proxy and group repos
- Creating, updating and deleting NuGet hosted, proxy and group repos
- Creating, updating and deleting Yum hosted, proxy and group repos
- Creating, updating and deleting Raw hosted, proxy and group repos
- Creating, updating and deleting APT hosted and proxy repos

### Changed
- **Breaking!** PUT requests to file blobstores are currently not supported, until a better implementation is available


## [v1.6.0] - 2024-11-16
### Added
- Creating, updating and deleting Docker hosted, proxy and group repos
- Creating, updating and deleting GitLFS hosted repos
- Creating, updating and deleting NPM hosted, proxy and group repos
- Creating, updating and deleting PyPi hosted, proxy and group repos

### Fixed
- Unable to set Nexus Trust Store for maven proxy repos. Fixed now :-)

## [v.1.5.0] - 2024-11-15
### Added
- Creating, updating and deleting maven group repositories

## [v.1.4.2] - 2024-11-12
### Added
- Added ansible-lint configuration

### Changed
- repo has been moved to Cloudkrafters GitHub organization
- Role will be published at the Cloudkrafter namespace in Galaxy
- Updated pip requirements

### Fixed
- Podman support for molecule scenario
- Maven repo updates are now idempotent again

## [v.1.4.1] - 2024-11-11
### Added
No features added

### Changed
No existing behaviour has changed

### Fixed
- Refactored code base for maintainability

## [v.1.4.0] - 2024-11-11
### Added
- Added support for File blob stores

## [v1.3.0] - 2024-11-10
### Added
- Added support for Content Selectors API endpoint
- Added support for Security - Anonymous Access API endpoint
- Added support for Roles API endpoint

### Changed
- Each part of the configuration can be ran seperately by specifing its tag. For example `--tags="roles,users,cleanup-policies"`
- moved role to cloudkrafter namespace
- renamed role from nexus_config_as_code to nexus_config_api

### Fixes
- API endpoints that require a pro license will be skipped when `nexus_enable_pro: false` is set.
- License will now be removed properly when `nexus_enable_pro: false` is set.

## [v1.2.0] - 2024-11-09
### Added
- Added support for User Tokens capability API endpoint.

## [v1.1.0] - 2024-11-09
### Added
- Added support for Users API endpoints. You can now create, update and delete users using this role.

## [v1.0.0] - 2024-11-09
Initial release. Support Create, Update and Delete actions for:
- Maven Hosted repositories
- Maven Proxy repositories
- Cleanup Policies
- Routing Rules
- Pro License