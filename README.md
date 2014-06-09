Using Docker to build a Quick and dirty NAS
===========================================

Why using this dockerfile?
--------------------------

You want to share some document with a bunch of windows machines, and you don't want to go through the actual burden of setting up a full fledged Samba on you computer when you know that you'll shut down the service after a few files transfer are done.


How to use
----------

First, you must build the image (here, I gave it the tag "qdnas"):

    docker.io build -t qdnas .

Then, for example, you can run one instance of this image with the following command:

    QDNAS=docker.io run -d -t qdnas:stable -v /pathtothedirectoryyouexport:/nas

At this point, you probably want external hosts to contact this instance. You can use [pipework](https://github.com/jpetazzo/pipework) for that purpose. Here, I expose the instance to the 192.168.1.2 address.

    ./pipework br1 $QDNAS 192.168.1.2/24
