#!/bin/bash

# parse the command line options
while getopts ":g:m:c:C:" opt; do
  case $opt in
    g)
      cgroup_name=$OPTARG
      ;;
    m)
      memory_limit=$OPTARG
      ;;
    c)
      cpu_limit=$OPTARG
      ;;
    C)
      command=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# create a new cgroup with the specified name
cgcreate -g memory:/$cgroup_name

# set the memory limit for the cgroup
cgset -r memory.high=$memory_limit $cgroup_name

# set the CPU limit for the cgroup
cgset -r cpu.max=$cpu_limit $cgroup_name

# run the specified command within the cgroup
cgexec -g memory:$cgroup_name $command