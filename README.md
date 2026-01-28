[![CI](https://github.com/tseemann/psortem/workflows/CI/badge.svg)](https://github.com/tseemann/psortem/actions)
[![GitHub release](https://img.shields.io/github/release/tseemann/psortem.svg)](https://github.com/tseemann/psortem/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Conda](https://img.shields.io/conda/dn/bioconda/psortem.svg)](https://anaconda.org/bioconda/psortem)
[![Language: Perl 5](https://img.shields.io/badge/Language-Perl%205-blue.svg)](https://www.perl.org/)

# psortem

Parallel external merge sort for billions of rows.

## Introduction

<IMG SRC="psortem.png" ALIGN="right" WIDTH="96" ALT="psortem logo">

The classic Unix `sort` tool is great if you
want to sort a bunch of unsorted files 
using the `--parallel=CPUS` option. However
if you want to do a merge sort, the `--merge`
option is single-threaded and is very slow
when merging large numbers of files. 
`psortem` will accpet all your files 
(sorted or unsorted) and use as many CPUs
and RAM you have to efficiently sort your data.

## Installation

```
conda install -c bioconda -c conda-forge psortem # COMING ONE DAY
```

## Quick start

```
% psortem -v
psortem 0.4.2

% psortem bigfiles*.txt > sorted

% psrterm -f filenames.fofn > sorted

% psortem -o sorted -s unsoirted*.txt

```

## Options
Use `psortem -h` for full help:
```
  -h       Show this help and exit
  -v       Show version and exit
  -C       Show citation and exit
  -q       Quiet mode
  -j CPUS  Theeads to use [0]
  -k INT   Files to merge per CPU [16]
  -f FOFN  FIle of filenames to sort
  -T DIR   Fast temporary directory [/tmp/tseemann]
  -n       Dry-run - just print steps
  -s       Sort input files first
  -S STR   Unix 'sort' options eg. -k1,1n -t$'\t'
  -t       Pre-cache input files with 'vmtouch'
```

## Etymology

* Sounds like "Plz sort 'em!" ("Please sort them")
* It uses Unix `sort` but uses parallel (`p`) CPUs to do an extenal (`e`) merge (`m`) sort.
* Looks like the word [post-mortem](https://en.wiktionary.org/wiki/post_mortem)
* Fairly unique amongst software names

## References

* [Unix sort command](https://en.wikipedia.org/wiki/Sort_(Unix))
* [Linux `sort(1)` man page](https://manned.org/sort.1)
* [External merge   sort](https://en.wikipedia.org/wiki/External_sorting#External_merge_sort)

## Feedback

File questions, bugs, or ideas on the 
[Issues page](https://github.com/tseemann/psortem/issues)

## License

[GPLv3](https://raw.githubusercontent.com/tseemann/psortem/master/LICENSE)

## Author

[Torsten Seemann](https://tseemann.github.io)
