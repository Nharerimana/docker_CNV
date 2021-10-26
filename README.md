# RUTH HWE docker container

This is a repo that contains the code for a docker container with RUTH - Robust Unified Hardy-Weinberg Equilibrium Test.

The original repository can be found at https://github.com/statgen/ruth

## Installation

To install the container, run the following using docker:

```bash
docker pull befh/ruth
```

or the following with singularity:

```bash
singularity pull --name ruth.img docker://befh/ruth:latest
```

To use with Snakemake, you do not need to install. Just put the following in the Snakefile:

```
container: 'docker://befh/ruth:latest'
```

Then run with `snakemake --use-singularity` see https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html for more info.

## Usage

To run with docker, `docker run ruth [ARGS]`.

To run with singularity, `singularity run ruth.img [ARGS]`.
