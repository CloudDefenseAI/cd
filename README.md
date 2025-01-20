
<p align="center"> 
 <a href="https://clouddefense.ai/" target="_blank">
<img height=70px src="https://user-images.githubusercontent.com/23183124/108589836-2a722b00-7382-11eb-9465-6620a00c9252.PNG" alt="" class="logo---vertical">
 </a>
 </p>
<p align="center"> 
 <a href="https://clouddefense.gitbook.io/clouddefense" rel="nofollow" class="rich-diff-level-one">Documentation</a> | <a href="https://clouddefense.gitbook.io/clouddefense" rel="nofollow" class="rich-diff-level-one">Tutorial</a>
</p>
<p align="center"> 
Clouddefense.ai is an automated web application security testing tool that audits your web applications by checking for vulnerabilities like SQL Injection, Cross site scripting and other exploitable vulnerabilities.
 </p>
 
<p align="center">
 <a href="http://clouddefense.ai/" alt="Contributors">
        <img src="https://img.shields.io/badge/Downloads-1.69M-<COLOR>.svg" /></a>
 </p>

# What is CloudDefense.AI?
<p align="center"> 
<img src="https://user-images.githubusercontent.com/23183124/109674528-ced14a00-7b98-11eb-84c7-abf7b8548281.PNG" alt="" class="logo---vertical">
</p>


## Introduction
Data is the ultimate motivator for hackers. Hackers are constantly looking for ways to exploit application vulnerabilities and gain access to sensitive data. The average enterprise company deals with hundreds of applications and this volume, understandably, creates a nightmarish situation for SecOps personnel to constantly certify, pen-test, and validate the security posture of each application. While the SecOps team is hard at work doing all that, developers become frustrated with the bottleneck. This is where CloudDefense helps. CloudDefense introduces a breakthrough platform for assessing the risk posture for the entire application stack and enables a more agile DevSecOps philosophy, which will help security move at the same pace as development.

## Table of Content
<ul>
 <li>
    <a href="#products">Products</a>
 </li>
 <li>
  <a href="#language">Language Supported</a>
 </li>
 <li>
 <a href="#integrations">Integrations</a></li>
 <li>
  <a href="#features">Features</a></li>
 </li>
 <li>
  <a href="#usage">Usage</a></li>
 </li>
</ul>

## Products
 - SAST
 - DAST
 - SCA
 - API Scanning
 - Containers 

## Language
<p float="left">
<img height=70px src="https://user-images.githubusercontent.com/23183124/109679420-620c7e80-7b9d-11eb-87b0-f49c29961c1d.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680341-3b027c80-7b9e-11eb-9414-57829a9006c7.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680350-3ccc4000-7b9e-11eb-899a-21fd3f216e19.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680356-3d64d680-7b9e-11eb-8b09-8da7de442fba.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680358-3dfd6d00-7b9e-11eb-82a1-d65c853c22d5.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680361-3e960380-7b9e-11eb-99b5-95d01611d6d7.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680364-3e960380-7b9e-11eb-954c-5902be1115f8.png" alt="" class="logo---vertical">&nbsp;&nbsp;
<img height=70px src="https://user-images.githubusercontent.com/23183124/109680369-3f2e9a00-7b9e-11eb-8a72-520cdddc41c7.png" alt="" class="logo---vertical">&nbsp;&nbsp;
</p>

## Installation

### Mac

```sh
curl https://raw.githubusercontent.com/CloudDefenseAI/cd/master/release-1.38.6/cd-latest-mac-x64.tar.gz > /tmp/cd-latest-mac-x64.tar.gz && tar -C /usr/local/bin -xzf /tmp/cd-latest-mac-x64.tar.gz && chmod +x /usr/local/bin/cdefense
```
### Windows

```sh
https://github.com/CloudDefenseAI/cd/raw/master/release-1.38.6/cd-latest-windows.exe.tar.gz
```
### Linux

```sh
sudo curl https://raw.githubusercontent.com/CloudDefenseAI/cd/master/release-1.38.6/cd-latest-linux-x64.tar.gz > /tmp/cd-latest-linux-x64.tar.gz && tar -C /usr/local/bin -xzf /tmp/cd-latest-linux-x64.tar.gz && chmod +x /usr/local/bin/cdefense
```
## Integrations
<ol>
 <li>
  Jenkins
 </li>
  <li>
  GoCD
 </li>
  <li>
  Gitlab
 </li>
  <li>
  Bitbucket
 </li>
  <li>
  CircleCI
 </li>
  <li>
  Teamcity
 </li>
  <li>
  Travis CI
 </li>
  <li>
  Azure DevOps
 </li>
</ol>

## Usage
### DotNet
```bash
cdefense sca --lang=dot_net --api-key=<YOUR_KEY> --project-name="example_project" 
```
### GO
```bash
cdefense sca --lang=go --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Java
```bash
cdefense sca --lang=java --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Kotlin
```bash
cdefense sca --lang=kotlin --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Node
```bash
cdefense sca --lang=node --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Objective C
```bash
cdefense sca --lang=objective_c --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Php
```bash
cdefense sca --lang=php --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Python
```bash
cdefense sca --lang=python --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Rust 
```bash
cdefense sca --lang=rust --api-key=<YOUR_KEY> --project-name="example_project" 
```
### Swift
```bash
cdefense sca --lang=swift --api-key=<YOUR_KEY> --project-name="example_project" 
```
