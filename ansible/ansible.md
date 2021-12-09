Resources:
- https://docs.ansible.com/ansible/latest/
- https://galaxy.ansible.com/

Importand paths:
- /etc/ansible/ansible.cfg

Random facts:
- By default Ansible uses SFTP to transfer files. If the machine or device you want to manage does not support SFTP, you can switch to SCP mode


# ansible CLI

## ansible

- You can use -u as one way to specify the user to connect as, by default Ansible uses SSH, which defaults to the ‘current user’.
- -m ping              # use ping module
- -a "/bin/echo hello" # run a live command

### Priviledge escalation

If you need privilege escalation (sudo and similar) to run a command, pass the become flags:

```bash
# as bruce
$ ansible all -m ping -u bruce
# as bruce, sudoing to root (sudo is default method)
$ ansible all -m ping -u bruce --become
# as bruce, sudoing to batman
$ ansible all -m ping -u bruce --become --become-user batman
```

## ansible-playbook

# Troubleshooting

## Ubuntu 16.04 on host should use /usr/bin/python3, but is using /usr/bin/python

```
[DEPRECATION WARNING]: Distribution Ubuntu 16.04 on host ... should use /usr/bin/python3, but is using /usr/bin/python for backward compatibility with prior Ansible releases. A future 
Ansible release will default to using the discovered platform python for this host. See https://docs.ansible.com/ansible/2.11/reference_appendices/interpreter_discovery.html for more information. 
This feature will be removed in version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
```

Solution: add `ansible_python_interpreter: auto` variable to host definition in inventory. More details: https://github.com/ansible/ansible/issues/70300


# Recipes

- https://www.axelerant.com/blog/managing-docker-containers-using-ansible

```
  tasks:
    - name: Print a message
      ansible.builtin.debug:
        msg: "this task runs before the example role"
```