# Users Management

```sh
cat /etc/passwd  # list all users

# Create User
useradd --create-home username       # create user
passwd username                      # change user password
mkhomedir_helper username            # creates home directory for existing user

usermod --shell /bin/bash username   # change shell for username
chsh --shell /bin/sh username        # change shell for username

# Add User to Group
usermod -aG sudo username            # add username to sudoers: assigns superuser privileges, allowing the account to use the sudo command
usermod -aG docker username          # add username to docker group

# show groups
groups           # what groups current user belongs
groups $user     # what groups $user belongs
cat /etc/group   # list all groups
getent group     # list all groups
```

## useradd - Create User

https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command/
