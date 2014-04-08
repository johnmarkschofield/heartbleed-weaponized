heartbleed-weaponized
=====================

The [Heartbleed](http://heartbleed.com/) bug was released on April 7, 2014.

Shortly thereafter, a raft of checkers and testers emerged, starting with [ilippo.io/Heartbleed/](http://filippo.io/Heartbleed/). That is a website that checks submitted sites for vulnerability to the Heartbleed OpenSSL bug.

More and more checking tools have been released since that one.

It is important for Systems Operations people to be able to check their servers without submitting their server addresses to a public website. That's somewhat like submitting your password to a public website to check if the password is a good one. Probably not a good idea, even if the website is above-board.

This Vagrant virtualmachine contains tools you can use to verify whether or not your website, and websites that you use, such as your bank and email provider, are vulnerable to the Heartbleed bug. It will not contain tools to exploit the Heartbleed vulnerability, although such tools already exist.

The intent of this repo is make the jobs of people protecting the web easier, not to make attacker's jobs easier. You can be sure, however, that people are out there working hard to make attackers jobs easier.