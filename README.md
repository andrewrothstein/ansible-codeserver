andrewrothstein.codeserver
=========
![Build Status](https://github.com/andrewrothstein/ansible-codeserver/actions/workflows/build.yml/badge.svg)

[Run VS Code on a remote server.](https://github.com/cdr/code-server)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.codeserver
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
