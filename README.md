# Mkdocs using Docker
We are using Docker to encapsulate a tool called Mkdocs
(​http://www.mkdocs.org/​) to produce and serve a website using local mkdocs project.
So User dont need to install mkdocs locally.

## 1. Create a Mkdocs project in local system:
First, We are creating a local directory `mkdocs_project` and in that directory 
make a new directory name `docs` and one yml file `mkdocs.yml` .

The `mkdocs.yml` file is a configuration file for our newly created MkDocs project. 
The `docs` directory is where we will write our actual documentation as text files in Markdown format to host.

We can edit the `mkdocs.yml` file to change the name of your website.
> site_name: My First Mkdocs Project

So, Now our local Mkdocs project is ready to host.

## 2. Build a Docker Image:
Download this code and save it into your local directory after that move to
that directory and build your docker image like this:

> `docker build -t < image_name >:< tag > .`

Here is an Example:

> `docker build -t pints_mkdocs:moon .`

Now, your docker image is ready.

## 3. Produce your Mkdocs Project:
Let's build our web page like this:

> `docker run <arguments> -v <local path to mkdocs project directory>:<container mount point to mkdocs project directory> <docker image name> produce <container mount path to mkdocs directory>`

Here is an Example:

> `docker run --rm -v /Users/pints/Desktop/mkdocs_project/:/root/mkdocs_project pints_mkdocs:moon produce /root/mkdocs_project > mkdocs_project.tar.gz`

`/Users/pints/Desktop/mkdocs_project/` is our local mkdocs project which is present in our machine.

This command will send a tar.gz file to STDOUT (mkdocs_project.tar.gz in the example).
This compressed file is a directory containing a mkdocs generated site.

## 4. Serve your Mkdocs project:
You can Host your Mkdocs project like this on port 8000:

> `cat <compressed mkdocs site> | docker run --rm -p 8000:8000 -i <docker image name> serve`

Here is an Example:
 > `cat mkdocs_project.tar.gz | docker run --rm -p 8000:8000 -i pints_mkdocs:moon serve`

This command will Host the mkdocs_project.tar.gz web site in port 8000 via port forwarding using Docker.

You can check your Mkdocs project on `http://localhost:8000` .

## 5.Test Stage using Jenkins:
A Jenkinsfile is included in this repository, that executes the 
two files `produce.sh` and `serve.sh`. 
Make sure that jenkins has access to the docker CLI.




