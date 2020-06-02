# CD Scan
Cloud Defense CLI Scanner - A single CLI for scanning and detecting vulnerabilities in any language. 
Currently, the CLI supports java, python, php, Node.js and golang. Support for other languages coming soon.

## Table Of Contents:

- [Installation](#installation)
- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [CI/CD](#cicd)
- [Docker](#docker)
## Installation

The CLI is a single binary which can run on Linux, Windows or Mac OS.

## Features

- **Find** known vulnerabilities by running `cdefense scan` on a project either as a one off or as part of your CI process.
- **Prevent** new vulnerable dependencies from being added to your project by running `cdefense scan` as part of your CI to fail tests when vulnerable Node.js or Python dependencies are added.
- **Secrets** are automatically scanned from your locally cloned git repo.

## Requirements

The following are language specific requirements.
 
#### Python
- Python version 3.5 or higher
- `pip` installed
- All project dependencies installed

#### Java
- Supports only maven projects
- `maven` or `mvn` installed
- `maven install` already run on the project 

#### Php
- `composer` installed
- `composer install` already run on the project

#### Node.js
- Node.js version 12.12.0 or higher

### Golang
- Supports only project with `go.sum`

## Usage

### Main command
```
NAME:
   Cloud Defense CLI Scanner - CLI for scanning and detecting vulnerabilities in any language

USAGE:
   cdefense [global options] command [command options] [arguments...]

COMMANDS:
   scan, s    Scan a given project
   dryrun, d  Dry run of the scan
   help, h    Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h  show help (default: false)
```
### Sub commands

#### scan
```
NAME:
   cdefense scan - Scan a given project

USAGE:
   cdefense scan [command options] [arguments...]

OPTIONS:
   --lang value, -l value          Language of the project being scanned [%LANG%] (required)
   --api-key value, -a value       Api Key for Cloud Defense server (required)
   --path value, -p value          Path to the project or file
   --project-name value, -P value  Name of the project
   --json, -j                      Print the output in json format (default: false)
   --no-versions, -n               Get available next versions (default: false)
   --help, -h                      show help (default: false)
```
#### dryrun
```
NAME:
   cdefense dryrun - Dry run of the scan

USAGE:
   cdefense dryrun [command options] [arguments...]

OPTIONS:
   --lang value, -l value          Language of the project being scanned [%LANG%] (required)
   --api-key value, -a value       Api Key for Cloud Defense server
   --path value, -p value          Path to the project
   --project-name value, -P value  Name of the project
   --json, -j                      Print the output in json format (default: false)
   --no-versions, -n               Get available next versions (default: false)
   --help, -h                      show help (default: false)
```
#### Examples
##### Example of python scan
`./cdefense dryrun|scan --lang=python --api-key=<YOUR_API_KEY> --path=/d/temp/vulpy/requirements.txt --project-name="my-python-project"`<br>
##### Example of java scan
`./cdefense dryrun|scan --lang=java --api-key=<YOUR_API_KEY> --path=/d/temp/java-goof --verbose --project-name="My Java Project"`<br>
##### Example of php scan
`./cdefense dryrun|scan --lang=php --api-key=<YOUR_API_KEY> --path=/d/temp/php-helloworld-app --project-name="my-php-project"`<br>
##### Example of Node.js scan
`./cdefense dryrun|scan --lang=node --api-key=<YOUR_API_KEY> --path=/d/temp/nodejs-system --project-name="my-nodejs-project"`<br>

## CI/CD
The scan can be run in CI/CD pipelines by downloading the binaries from github.

#### A sample python CI/CD configuration in gitlab 
```
image: "python:3.7"

variables:
  CLOUDDEFENSE_API_KEY: <YOUR_API_KEY>

before_script:
  - python --version
  - pip install -r requirements.txt

stages:
  - Test

pytest:
  stage: Test
  script:
    - curl https://raw.githubusercontent.com/CloudDefenseAI/cd/master/latest/cd-latest-linux-x64.tar.gz > /tmp/cd-latest-linux-x64.tar.gz \
        && tar -C /usr/local/bin -xzf /tmp/cd-latest-linux-x64.tar.gz && chmod +x /usr/local/bin/cdefense
    - cdefense scan --lang=python --project-name=python-sample-project --api-key=$CLOUDDEFENSE_API_KEY --path=requirements.txt
    - echo $?
``` 

#### A sample java CI/CD configuration in gitlab 
```
image: maven:3-jdk-8

variables:
  CLOUDDEFENSE_API_KEY: <YOUR_API_KEY>

cache:
  paths:
    - .m2/repository/
    - target/

stages:
  - test

run_scan:
  stage: test
  script:
    - mvn web3j:generate-sources
    - mvn clean install
    - curl https://raw.githubusercontent.com/CloudDefenseAI/cd/master/latest/cd-latest-linux-x64.tar.gz > /tmp/cd-latest-linux-x64.tar.gz \
            && tar -C /usr/local/bin -xzf /tmp/cd-latest-linux-x64.tar.gz && chmod +x /usr/local/bin/cdefense
    - cdefense scan --lang=java --project-name=java-mvn-sample --api-key=$CLOUDDEFENSE_API_KEY --path=$PWD
    - echo $?
``` 

## Docker 

Coming soon!

The host project folder will be mounted to `/app` on the container and will be used to read the dependencies file and write results for CI builds.


