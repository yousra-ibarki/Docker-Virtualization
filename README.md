# Docker-Virtualization

A project focused on Docker and virtualization techniques, leveraging Shell scripts, Dockerfiles, and Makefiles to manage and automate containerized environments.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Resource](#resource)

## Introduction

This repository provides a set of tools and scripts to facilitate the creation, management, and automation of Docker containers and virtualized environments. It includes Shell scripts for automation, Dockerfiles for container creation, and Makefiles for build management.

## Features

- Automated setup of Docker containers using Shell scripts.
- Predefined Dockerfiles for various environments.
- Makefiles for streamlined build processes.
- Examples and templates for common Docker use cases.

## Technologies Used

- **Shell**: Used for scripting and automation.
- **Dockerfile**: Used for defining Docker images.
- **Makefile**: Used for build automation.
- **Nginx**: Used as a web server and reverse proxy.
- **MariaDB**: Used as a database server.
- **WordPress**: Used as a content management system.
- **PHP**: Used for server-side scripting.

## Installation

Follow these steps to set up the project locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yousra-ibarki/Docker-Virtualization.git
   cd Docker-Virtualization

   ```
   1. Build Docker images:
     ```bash
     make build
     ```
   2. Run Docker containers:
      ```bash
      make run
      ```
  Or Run Using Dockerfiles
  ```bash
    docker build -t my_image -f Dockerfile .
    docker run -d --name my_container my_image
  ```
## Project Structure
- **/scripts**: Contains Shell scripts for automation.
- **/docker**: Contains Dockerfiles for various environments.
- **/makefiles**: Contains Makefiles for build automation.
- **/nginx**: Configuration files for Nginx.
- **/mariadb**: Configuration files and initialization scripts for MariaDB.
- **/wordpress**: WordPress setup and configuration files.
- **/php**: PHP scripts and configuration files.
- **/python**: Python scripts for automation and other tasks.


## Resources

To understand more about the project and the technologies used, check out the following resources:

- [Docker Documentation](https://docs.docker.com/)
- [Docker Roadmap](https://roadmap.sh/docker)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)
- [PHP Documentation](https://www.php.net/docs.php)
