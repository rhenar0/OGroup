# OGroup

This script uses the **`getopts`** built-in to parse the command line options and store the values in variables. It then creates a new cgroup with the specified name and sets the memory and CPU limits for the cgroup. Finally, it runs the specified command within the cgroup.

To use this script, you would run it with the following options:

```
./myscript.sh -g mygroup -m 1GB -c 50000 -C "stress --cpu 1 --io 1 --vm 1 --vm-bytes 1GB --timeout 60s"
```

This would create a new cgroup named "mygroup", set a memory limit of 1GB and a CPU limit of 50%, and then run the **`stress`** utility within the cgroup. You can customize this script to suit your specific needs and use it to create and manage cgroups with resource limits.