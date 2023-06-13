## The ECDSA host key for 'github.com' differs from the key for the IP address

source: https://stackoverflow.com/questions/76187211/warning-the-ecdsa-host-key-for-github-com-differs-from-the-key-for-the-ip-ad

Example of reproducing the problem: 

    $ git push
    Warning: the ECDSA host key for 'github.com' differs from the key for the IP address '140.82.121.3'
    Offending key for IP in /home/andrew/.ssh/known_hosts:4
    Matching host key in /home/andrew/.ssh/known_hosts:69
    Are you sure you want to continue connecting (yes/no)?


### Solution

Remove old keys:

    ssh-keygen -R github.com

and re-add the proper key(s):

    ssh-keyscan github.com >> ~/.ssh/known_hosts

This will add the current RSA and ECDSA keys.
