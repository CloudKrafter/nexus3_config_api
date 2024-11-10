When using this in a 'desired-state' kind of way, renaming repositories is not supported. This has to do with the fact when you rename a repository, it will be considered a new repo and the old one will be deleted since its not in the list of 'desired repos' anymore.

Unfortunatly repos do not have an unique identifier that's returned by the Nexus API, therefore we can not use that to update a new of a repo.


Take away: when not all attributes for PUT are passed through the API, the role might see it as changed, eventho its not.

if the order of the roles/privileges changes, it will not be updated, but it will try to PUT all the changes to the api


# TODO:
- ALL repository endpoints
- Email endpoint
- Blob store endpoint
- HTTPS System settings
- Security Mangement Anonymous Access
- Security Management LDAP
- Security Management REALMS
- Security Management Privileges
- Security Management Roles
- Security Certificates
- Tasks
