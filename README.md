# dkr-u18-iqr2-short
dkr-u18-iqr2-short version

compose-file is only intended for the user with following steps:
- 1- create a folder for your (git-based) project
- 2- copy this compose.yml in the above folder
- 3- run docker compose run --rm u18iqr2
- note: this local folder mappped to the home-directory of dev user called dev
if we clone in local folder we have access, and we can build
- 4 when we exit from docker terminal, it will automatically removed

```console
max@m211:/mnt/170C24895C0DB089/zGit/zdkr/dkr-u18-iqr2-short$ docker compose up -d && docker compose exec u18iqr2 /bin/bash
[+] Running 2/2
 ⠿ Network dkr-u18-iqr2-short_default  Created                                                                                                                     0.2s
 ⠿ Container u18iqr2c                  Started                                                                                                                     1.6s
dev@u18iqr2h:~$ ls
Dockerfile  Makefile  Makefile.dev  README.md  compose.yml
dev@u18iqr2h:~$ exit
exit
max@m211:/mnt/170C24895C0DB089/zGit/zdkr/dkr-u18-iqr2-short$ docker compose down
[+] Running 2/2
 ⠿ Container u18iqr2c                  Removed                                                                                                                     1.0s
 ⠿ Network dkr-u18-iqr2-short_default  Removed                                                                                                                     0.4s
max@m211:/mnt/170C24895C0DB089/zGit/zdkr/dkr-u18-iqr2-short$ 
```

OR easier to use just one command
```console
max@m211:/mnt/170C24895C0DB089/zGit/zdkr/dkr-u18-iqr2-short$ docker compose run --rm u18iqr2
[+] Running 1/1
 ⠿ Network dkr-u18-iqr2-short_default  Created                                                                                                                     0.2s
dev@u18iqr2h:~$ ls
Dockerfile  Makefile  Makefile.dev  README.md  compose.yml
dev@u18iqr2h:~$ exit
exit
max@m211:/mnt/170C24895C0DB089/zGit/zdkr/dkr-u18-iqr2-short$ 

```


# TODO
build red-line
docker build WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
possible solution

Dockerfile: Use "apt-get" instead of "apt"
apt-get may be considered as lower-level and "back-end", and support other APT-based tools. apt is designed for end-users (human) and its output may be changed between versions. Note from apt(8): The `apt` command is meant to be pleasant for end users and does not need to be backward compatible like apt-get


build-red-line: 
debconf: delaying package configuration, since apt-utils is not installed
possible soultion
apt-get install -y --no-install-recommends apt-utils


another ToDO
WARNING! Your password will be stored unencrypted in /home/max/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store



