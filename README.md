# heartbleed-weaponized

## Introduction
The [Heartbleed](http://heartbleed.com/) bug was released on April 7, 2014.

Shortly thereafter, a raft of checkers and testers emerged, starting with [ilippo.io/Heartbleed/](http://filippo.io/Heartbleed/). That is a website that checks submitted sites for vulnerability to the Heartbleed OpenSSL bug.

More and more checking tools have been released since that one, including [possible.lv/tools/hb/](http://possible.lv/tools/hb/).

It is important for Systems Operations people to be able to check their servers without submitting their server addresses to a public website. That's somewhat like submitting your password to a public website to check if the password is a good one. Probably not a good idea, even if the website is above-board.

This Vagrant virtualmachine contains tools you can use to verify whether or not your website, and websites that you use, such as your bank and email provider, are vulnerable to the Heartbleed bug. It will not contain tools to exploit the Heartbleed vulnerability, although such tools already exist.

The intent of this repo is make the jobs of people protecting the web easier, not to make attacker's jobs easier. You can be sure, however, that people are out there working hard to make attackers jobs easier.

Currently we're using two tools:

* [Takeshixx's hb-test.py](https://gist.github.com/takeshixx/10107280) 
* [heartbleeder](https://github.com/titanous/heartbleeder) by [Jonathan Rudenberg](https://github.com/titanous)

## Vagrant Setup


If you have the latest version of VirtualBox installed, and you have vagrant-vbguest installed you'll need to do:

```
vagrant up ; vagrant provision ; vagrant reload --provision
```

If you're not on the latest version of VirtualBox, you'll only need to do "vagrant up". [The above works around a Virtualbox bug](http://schof.org/2014/03/31/working-around-virtualbox-bug-12879/).)


## Usage

```
vagrant ssh
```

```
heartbleeder WEBSITE:PORT
#or
heartbleeder WEBSITE
```

or 

```
hb-test.py WEBSITE:PORT
```
or

```
hp-test.py WEBSITE
```


Heartbleeder gives you a concise report of whether or not the web server is vulnerable. Hp-test.py actually dumps out the web server's memory and prints it for you to see. I've found that hb-test.py will intermittantly report a server is secure when it's not. Heartbleeder seems to be more reliable.
