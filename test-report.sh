#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

export CODECLIMATE_API_HOST=http://localhost:3000
#export CODECLIMATE_REPO_TOKEN=9b3d530b57dc6675696903f05a0e0813b53d2c915a2b846a968271154c901715
export CODECLIMATE_REPO_TOKEN=9e2a662502735cea3d94f6711b0a4a0d9e9995db510ef5edece4bde55b92b1e1
bundle exec codeclimate-test-reporter
