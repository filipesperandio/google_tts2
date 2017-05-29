#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

export CODECLIMATE_API_HOST=http://localhost:3000
#export CODECLIMATE_REPO_TOKEN=9b3d530b57dc6675696903f05a0e0813b53d2c915a2b846a968271154c901715
export CODECLIMATE_REPO_TOKEN=3c77cb58d30ec71503266903a93fa46d532258c8d2419f175274dce18871b7b3
bundle exec codeclimate-test-reporter
