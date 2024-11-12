# Changelog

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