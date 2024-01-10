# README #

WorksMedia workingspace install instruction.

### Working Space information ###

- CentOS Linux 7
- Apache/2.4.6 (CentOS)
- PHP 7.2.27 

### Requirement

- Docker
- Docker Compose

### Install make package

- [Windows](http://gnuwin32.sourceforge.net/packages/make.htm)
```shell
Download and install GnuWin32
Go to the install folder C:\Program Files (x86)\GnuWin32\bin
Copy all files inside the bin folder to the root project directory (libiconv2.dll, libintl3.dll, make.exe)
```
- Mac/Linux: install `make` package

### How do get set up?

 Clone repository
```shell
$ git clone git@bitbucket.org:vvhuy298/workspace-docker.git
$ cd life-api
```

 Edit configuration `.env` file

 Docker build and lauch
```shell
$ make start
```

 Docker restart when have change
```shell
$ make restart
```

 Docker stop
```shell
$ make stop
```

 Access to Docker container Shell
```shell
$ make exec
```
