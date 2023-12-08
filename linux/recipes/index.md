- [How to enable root login?](https://askubuntu.com/questions/44418/how-to-enable-root-login)
- [How to view log files on the shell?](https://www.faqforge.com/linux/distributions/debian/linux-how-to-view-log-files-on-the-shell/)
- [Git Bash won't let me type anything, just shows a blinking cursor](https://stackoverflow.com/questions/28073577/git-bash-wont-let-me-type-anything-just-shows-a-blinking-cursor)
- [How to Setup an iSCSI Storage Server on Ubuntu 20.04 LTS](https://www.howtoforge.com/tutorial/how-to-setup-iscsi-storage-server-on-ubuntu-2004-lts)
- [Attach a Terminal to a Detached Process in Linux](https://www.baeldung.com/linux/attach-terminal-detached-process)

## What shell I'm running?
    echo $0

## Multiline string

possibility 1:

    echo "line 1" >> greetings.txt
    echo "line 2" >> greetings.txt

possibility 2:

    echo "line 1
    line 2" >> greetings.txt

possibility 3:

    cat <<EOT >> greetings.txt
    line 1
    line 2
    EOT

save to variable:

    IFS='' read -r -d '' String <<"EOF"
    <?xml version="1.0" encoding='UTF-8'?>
    <painting>
      <img src="madonna.jpg" alt='Foligno Madonna, by Raphael'/>
      <caption>This is Raphael's "Foligno" Madonna, painted in
      <date>1511</date>-<date>1512</date>.</caption>
    </painting>
    EOF

Source: https://serverfault.com/questions/72476/clean-way-to-write-complex-multi-line-string-to-a-variable

## Split and sort $PATH parts

IFS=':' read -r -a array <<< $PATH && printf '%s\n' "${array[@]}" | sort

## How To Find Out My Linux Distribution Name and Version?

$ cat /etc/*-release
$ lsb_release -a
$ hostnamectl

source: https://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/

### How do I find out My Linux kernel version?

$ uname -a
$ uname -mrs
$ cat /proc/version