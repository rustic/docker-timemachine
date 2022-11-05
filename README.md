# Docker TimeMachine
### Creates a Docker container for running the Time Machine compatible backup service.
Based on my bare metal TimeMachine install and [willtho89's](https://github.com/willtho89) [script files](https://github.com/willtho89/docker-samba-timemachine)

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/rustic/docker-timemachine/tree/master.svg?style=shield)](https://dl.circleci.com/status-badge/redirect/gh/rustic/docker-timemachine/tree/master)
[![Image Size](https://img.shields.io/docker/image-size/rustic/docker-timemachine/latest)](https://hub.docker.com/repository/docker/rustic/docker-timemachine)
[![License](https://img.shields.io/github/license/rustic/docker-timemachine)](https://hub.docker.com/repository/docker/rustic/docker-timemachine)

### Environment Variables
| Variable  | Function                | Default.    |
| ----------|:-----------------------:|-------------:|
| TM_USER   | Time Machine User       | timemachine |
| TM_PW     | User's Password         | timemachine |
| TM_ID     | UserID                  | 1000        |
| TM_SIZE   | Time Machine Size in GB | 250         |