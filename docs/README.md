When using this in a 'desired-state' kind of way, renaming repositories is not supported. This has to do with the fact when you rename a repository, it will be considered a new repo and the old one will be deleted since its not in the list of 'desired repos' anymore.

Unfortunatly repos do not have an unique identifier that's returned by the Nexus API, therefore we can not use that to update a new of a repo.

## FAQ

Q: After enabling the Pro eatures, my playbook fails when configuring User Tokens or Cleanup Policies.
A: After enabling the pro features by uploading or installing the license, you have to reboot your Nexus instance first beore the additional API endpoints become available.

Take away: when not all attributes for PUT are passed through the API, the role might see it as changed, eventho its not.

if the order of the roles/privileges changes, it will not be updated, but it will try to PUT all the changes to the api

## Missing support on API
- setting content disposition on maven groups
- setting layout policy on maven groups
- setting version policy on maven groups
- enabling trust store on maven proxies
- create cleanup policy for format 'all'


# TODO:
- ALL repository endpoints
- S3 Blob store endpoint
- Group Blob store endpoit
- HTTPS System settings
- IQ Repo Firewall
- Security Management LDAP
- Security Management REALMS
- Security Certificates
- Tasks
- Security Management SAML
- Email endpoint
- Security Atlassian Cloud
- Security Management Privileges
- Tags
- Azure Blob store endpoint
- Google Blob store endpoint
