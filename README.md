# Barge

Barge is a tool for easily managing docker containers on my dev machine.
It mounts to the home directory and can be called from anywhere.
It uses the docker API and autocomplete for ease of use.
It allows you to use Nvidia GPU and does X forwarding.
Still working on proper device and network interface forwarding.
My work is geared towards robotics so device access from docker is important.

---
## Install
- cd into the `barge/barge` directory
- run `install_barge.sh`
  - This will install python autocomplete and add the barge script to your bashrc

---
## Usage
All commands/args can be tab autocompleted!

###### Start a new container
`barge start <image_name> <optional_container_name>`
###### Drop into a shell in an existing container
`barge shell <container_name>`
###### Kill a running container
`barge kill <container_name>`
###### List active containers and built images
`barge list`
###### Build all image files
`barge build --all`
###### Build a specific image file
`barge build <image_name>`
###### Build an image file from the start
`barge build <image_name> --nocache`

---

## Structure
- `barge` contains the main executable and installer
- Docker files are placed in the main directory with the extension `.dkr`
- A directory for helper scripts
