# cyclopdog/ubuntu_rails_sqlite3

Making Rails apps on a different platform may cause some nasty errors on deploy, this image is meant to be a way to easily setup a linux environment to develop Rails apps and have them deployed in a linux server without the incompatibility concerns.

Getting up and running:

`docker run -it -p 3000:3000 -v $(pwd):/workspace cyclopdog/ubuntu_rails_sqlite3`

It is quite important that the `$(pwd)` reflects a folder in the system, otherwise an inaccessible one will be created (for example, in windows could be something like `-v C:/rails_projects:/workspace`

Alternatively you could replace `-p 3000:3000` with just `-P` for docker to automatically assign a port to it.
`-it` can be ignored if running it on the background is desired, but because of it's purpose it is not recommended.

After image is created, starting it up again can be done by running `docker start -i <image>` to go interactive.

Because this image uses rbenv, when running any `gem` or `rails` command it is needed to prefix them with `rbenv exec`.\
More on rbenv here: <https://github.com/rbenv/rbenv>

Once in the terminal just `cd` into the /workspace folder and from there you can create the rails app by running `rbenv exec rails new <appname> <options>`\
Run the server with `rbenv exec rails s -b 0.0.0.0` in order for it to be accesible from the browser.

Notice that if the image is run with `-P` option it is needed to check which port it was assigned.\
While the container is running, in another terminal run the command `docker container ls` and  under PORTS something like `0.0.0.0:49163->3000/tcp` will indicate the port that is pointing to the container's 3000.