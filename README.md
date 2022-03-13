# Docker TimeMachine
### Creates a Docker container for running the Time Machine compatible backup service.
Based on my bare metal TimeMachine install and [willtho89's](https://github.com/willtho89) [script files](https://github.com/willtho89/docker-samba-timemachine)


### Environment Variables
| Variable  | Function                | Default.    |
| ----------|:-----------------------:|-------------:|
| TM_USER   | Time Machine User       | timemachine |
| TM_PW     | User's Password         | timemachine |
| TM_ID     | UserID                  | 1000        |
| TM_SIZE   | Time Machine Size in GB | 250         |