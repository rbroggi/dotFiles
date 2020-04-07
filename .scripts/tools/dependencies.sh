#!/bin/bash

# usage: dependencies.sh <hostname> <remote_project_dir> <local_dependencies_dir>
# example: dependencies.sh ncerndobehsm002 '~/repo/acv' ~/.cep_test
#

vm=$1
repo_dir=$2
local_dir=$3
remote_dependencies=/remote/users/rbroggi/.bmsplugin/dependencies.zip
include_file=${local_dir}/include_directories.txt
curr_dir=$(pwd)


# Remove remote file dependencies
# Generate remote dependencies zip
echo "rm ${remote_dependencies} && cd ~/repo/bmsprojectextract/extract && ./project_extract.sh ${repo_dir} all"
echo "rm ${remote_dependencies} && cd ~/repo/bmsprojectextract/extract && ./project_extract.sh ${repo_dir} all" | ssh "${vm}" || exit

# make sure localdir parent exists
parent_local_dir=$(dirname ${local_dir})
echo "mkdir -p ${parent_local_dir}"
mkdir -p "${parent_local_dir}"

# Transfer the remote dependencies zip
echo "scp ${vm}:${remote_dependencies} ${parent_local_dir}"
scp "${vm}:${remote_dependencies}" "${parent_local_dir}" || exit

# Backup the local target dir
dt=$(date '+%s')
echo "mv ${local_dir} ${local_dir}_${dt}"
mv "${local_dir}" "${local_dir}_${dt}"
if [ ! $? == "0" ];
then
  echo "No previous folder found: ${local_dir}"
fi

# Unzip to local target dir
local_dependencies_zip=${parent_local_dir}/dependencies.zip
echo "unzip ${local_dependencies_zip} -d ${local_dir}"
unzip "${local_dependencies_zip}" -d "${local_dir}" > /dev/null

# Generate list of include dirs to special file in target local dir
cd "${local_dir}" || exit
find . -name "include" -type d | sed "s@^./@@g" | sort -u | sed "s@\(.*\)@include_directories(\${DEPDIR}/\1)@g" > "${include_file}"
echo "Generated include file: ${include_file}"
cd "${curr_dir}" || exit

# Remove all backup directories that have creation date older then 2 weeks
for dir in $(ls -1d "${local_dir}"_* | grep -E "${local_dir}_[0-9]+$")
do
  creation_date=${dir//${local_dir}_/}
  weeks_diff=$(( (dt - creation_date) / 604800 ))
  if (( weeks_diff >= 2 ))
  then
    echo "rm -r ${dir}"
    #rm -r "${dir}"
  fi
done
