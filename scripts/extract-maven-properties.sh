#! /usr/bin/env bash

function show_help() {
  printf "
This script copies all properties defined in the given pom.xml file into a properties file.

 Usage: %s [deps-dir] [dep-file]
 " "$0"
}

BOLD_BLUE="\033[1;34m"
BOLD_RED="\033[1;31m"
RESET="\033[0m"

# shellcheck disable=SC2059,SC2086,SC2048
log_info() {
  format="[${BOLD_BLUE}INFO${RESET}] $1"
  shift
  printf "${format}\n" $*
}

# shellcheck disable=SC2059,SC2086,SC2048
log_error() {
  format="[${BOLD_RED}ERROR${RESET}] $1"
  shift
  printf "${format}\n" $*
}



if [[ "$#" -lt 2 ]]; then
  log_error "Not enough arguments"
  show_help
  exit 1
fi

deps_dir=$1
dep=$2

dep_path="${deps_dir}/${dep}"
pom_file="${dep_path}.pom"
xml_file="${dep_path}.xml"
properties_file="${dep_path}.properties"

if [[ ! -f "${pom_file}" ]]; then
  log_error "Couldn't find '%s'. Ensure it's copied properly by maven-dependency-plugin." "${pom_file}"
  exit 1
fi

# NOTE: yq runs into errors w/o xml file extensions
cp "${pom_file}" "${xml_file}"

yq -oy '
  .project.properties[]
  | key + "=" + .
' "${xml_file}" \
  > "${properties_file}"

log_info "Extracted properties from '%s' to '%s'" "${pom_file}" "${properties_file}"
