MUED - a Multi-Used Ed
======================

Think of Google Docs, but with Ed instead of Google.

Installation
------------

Clone this repo and run:

	busybox httpd -p 8800

Usage
-----

Open your browser and navigate to <http://localhost:8800/>. Type ed commands in
the bottom box, submit by Ctrl+Enter, and see ed output in the top box. `w`
command is added automatically, so there is an auto-save.

Sample commands
---------------

Start with `,p` to see the current contents of the file. You can fix the typo in
the first line by this command: `1s/el/le/`. To see the result - send `,p`
command again. To add some more lines, use multi-line `a` command finished with
a line containing a single `.`, like this:

	a
	Lines to be added
	(you can have several)
	.

For more fancy commands, read [man ed][1].

[1]: https://www.gnu.org/fun/jokes/ed-msg.html
