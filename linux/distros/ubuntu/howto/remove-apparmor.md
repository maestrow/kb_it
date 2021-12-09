# How to disable and remove AppArmor

source: https://www.simplified.guide/ubuntu/remove-apparmor

1. Stop apparmor service.
`$ sudo systemctl stop apparmor`

2. Disable apparmor from starting on system boot. 
`$ sudo systemctl disable apparmor`

3. Remove apparmor package and dependencies. (optional). 
`$ sudo apt remove --assume-yes --purge apparmor`
