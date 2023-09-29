# slurm2tcs

## Setup

Python 3.6 required. Then, set PATH for slurm2tcs/bin.

```
$ python --version
Python 3.6.8

$ export PATH=/path/to/slurm2tcs/bin:$PATH
```

## Commands

### sbatch

```
$ sbatch <script> 
```

sbatch accepts scripts with the following Slurm Directive and converts them to TCS Directive.

|  Slurm Directive  |  TCS Directive  |
| ---- | ---- |
|#SBATCH  |#PJM   |
|--time|-L \"elapse=\"|
|--nodes|-L \"node=\"|
|--exclusive||
|--job-name|--name |
|--output|-o|
|--error|-e|
|--partition|-L \"rscgrp=\"|
|--mincpus|--mpi \"max-proc-per-node=\"|


sbatch will show the following message and return 0 on success, or error code on failure.
```
Submitted batch job <job id>
```

sbatch basically emulates the following TCS command.
```
$ pjsub <script>
```

### squeue

```
$ squeue --job=<job id> --noheader --format=jobid,state
```

squeue will show the following message and return 0 on sucess, or error code on failure.
```
<job id>	<status>
```

squeue basically emulates the following TCS command.
```
$ pjstat -E -v <job id>
```

### sacct

```
$ sacct --job=<job id> --noheader --format=state,exitcode
```

sacct will show the following message and return 0 on success, or error code on failure.
```
 <status>     <exitcode>
```

sacct basically emulates the following TCS command.
```
$ pjstat -H -v <job id>
```

### scancel

```
$ scancel <job id>
```

scancel will return 0 on success or error code on failure. 

scancel basically emulates the following TCS command.
```
$ pjdel <job id>
```

### sinfo

```
$ sinfo
```

sinfo will show the following message and return 0 on success, or error code on failure.

```
PARTITION AVAIL  TIMELIMIT    NODES  STATE NODELIST 
<partition>*  up   infinite  <nodes>    any        -
```

sinfo collects information of the partition (default resource group) from the following TCS commaands.
```
$ pjacl --data
$ pjshowrsc --data --rscgrp <partition>
$ pjstat --rsc --rscgrp <partition>
```


