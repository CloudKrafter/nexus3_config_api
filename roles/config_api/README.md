cloudkrafter.nexus.config_api
=========

[![Dynamic JSON Badge](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fgalaxy.ansible.com%2Fapi%2Fv3%2Fplugin%2Fansible%2Fcontent%2Fpublished%2Fcollections%2Findex%2Fcloudkrafter%2Fnexus%2F&query=%24.download_count&label=Galaxy%20Downloads)](https://galaxy.ansible.com/ui/repo/published/cloudkrafter/nexus/)


Ansible role to configure Nexus Repository Manager with Config as Code.

Requirements
------------

This role has been tested with Nexus Repository Manager OSS and Pro version 3.73 and higher.
To make this role work out-of-the-box you have to provide the following values first:

- `nexus_api_scheme:`
- `nexus_api_hostname:`
- `nexus_api_port:`
- `nexus_admin_username:`
- `nexus_admin_password:`

If you want to enable the Pro features, please note that you have to provide your own license.
If your Nexus instance is already running on the Pro version, you still need the `nexus_enable_pro_version` set to true, otherwise it will remove your license!

If you set `nexus_enable_pro_version` to `true`, you must provide a base64 encoded license file

Either by setting the `NEXUS_LICENSE_B64` environment variable on the system that executes your playbook or by providing the base64 encoded license string in your vars.
`nexus_license_b64: <your Nexus .lic license file encoded into a base64 string>`

Role Variables
--------------

<!-- A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well. -->

### defaults file for nexus3-config-as-code
```yaml
nexus_api_scheme: http
nexus_api_hostname: localhost
nexus_api_port: 8081
nexus_admin_username: admin
nexus_admin_password: changeme
nexus_enable_pro_version: false
```

#### Note on compatibility with the nexus_oss role
Most of the variables in this role are the same as the variables used in the `nexus_oss` role.
This is intentionally to help facilitating the migration process where the _provisional_ and _configuration_ tasks will be separated.

This role also aims to stick with the API definitions as described in the Nexus API reference.
Meaning the format of all dictionaries, lists, strings etc. will be in line with the API requirements.

To maintain compatibility with the values set previously if you are using the `nexus_oss` role, all payloads to the API will be transformed and mapped accordingly a.k.a normalized.

Eventually the `nexus_oss` role will not be handling tasks to create, update or delete Nexus assets suchs as; repositories, local users, cleanup policies, routing rules, content selectors, security realms, roles, privileges etc.. That will be handled by this role.

#### Anonymous Access
A note on setting the `nexus_anonymous_access` variable. This variable is backwards compatible with the `nexus_anonymous_access` variable used in the nexus_oss role. Meaning you don't have to change this value to make it work. However, when enabling anonymous access through the API, Nexus expects an username and realm to be provided as well. By default this will be the **anonymous** user and the **NexusAuthorizingRealm**.
If you want to change this, provide these options as following:

```yaml
nexus_anonymous_access:
  enabled: true
  userId: anonymous
  realmName: NexusAuthorizingRealm
```

Anonymous Docker pulls are handled by the DockerToken realm. You need to enable this and then ensure the `docker.forceBasicAuth` attribute is set to `false`.

#### Security Realms

Each realm will be activated and configured in the same order as you listed.
Available security realms are `NexusAuthenticatingRealm`, `User-Token-Realm`, `NuGetApiKey`, `ConanToken`, `Crowd`, `DefaultRole`, `DockerToken`, `LdapRealm`, `NpmToken`, `rutauth-realm` and `SamlRealm`.

```yaml
nexus_security_realms:
  - NexusAuthenticatingRealm # default realm
```

If you're using the **nexus_oss** role, you do not have to add the `nexus_security_realms:` variable.
This role will map and normalize the realm variables from the nexus_oss role for compatibility.
However, if you define the `nexus_security_realms` with any realm other than `NexusAuthenticatingRealm`, the realms variables of nexus_oss will be ignored.

Our recommendation is to configure security realms using this role and not using the nexus_oss role.

#### Cleanup Policies
```yaml
nexus_repos_cleanup_policies: []
```

#### Routing Rules
```yaml
nexus_repos_routing_rules: []
```

#### Local Users
````yaml
nexus_local_users: []
````

#### Other

```yaml
nexus_config_maven: true

nexus_repos_maven_hosted: []

nexus_repos_maven_proxy: []

nexus_repos_maven_group: []

```


Dependencies
------------
No dependencies

Example Playbook
----------------
This role will be executed against the Nexus API only. It does not make any changes to your target, so we can run this playbook from localhost, given the fact the machine you're running this on, is able to establish a connection to your Nexus instance.

```yaml
- name: Configure Nexus
  hosts: localhost
  gather_facts: true
  roles:
    - role: nexus3-config-as-code
```

License
-------

GNUv3

Author Information
------------------

[CloudKrafter](https://github.com/CloudKrafter)

Special thanks to [Oliver Clavel](https://github.com/zeitounator) who created the popular [Nexus3-OSS Ansible role](https://github.com/ansible-ThoTeam/nexus3-oss) where this project is inspired and partially based upon.
