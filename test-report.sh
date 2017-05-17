#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

export CODECLIMATE_API_HOST=http://localhost:3000
#export CODECLIMATE_REPO_TOKEN=9b3d530b57dc6675696903f05a0e0813b53d2c915a2b846a968271154c901715
export CODECLIMATE_REPO_TOKEN=17f6b47dcf4b203c2b9c097f92afada65ff358593d1c0bd37c1a04dc46548b34
bundle exec codeclimate-test-reporter
