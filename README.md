[![CI](https://github.com/tseemann/psortem/workflows/CI/badge.svg)](https://github.com/tseemann/psortem/actions)
[![GitHub release](https://img.shields.io/github/release/tseemann/psortem.svg)](https://github.com/tseemann/psortem/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Conda](https://img.shields.io/conda/dn/bioconda/psortem.svg)](https://anaconda.org/bioconda/psortem)
[![Language: Perl 5](https://img.shields.io/badge/Language-Perl%205-blue.svg)](https://www.perl.org/)

# psortem

Parallel external merge sort for billions of rows.

## Introduction

<IMG SRC="psortem.png" ALIGN="right" WIDTH="256" ALT="psortem logo">

The classic Unix `sort` tool is great if you
want to sort a bunch of unsorted files 
using the `--parallel=CPUS` option. However
if you want to do a merge sort, the `--merge`
option is single-threaded and is very slow
when merging large numbers of files. 
`psortem` will accpet all your files 
(sorted or unsorted, compressed or plain) and use as many CPUs
and RAM you have to efficiently sort your data.

## Installation

```
conda install -c bioconda -c conda-forge psortem
```

## Quick start

```
% psortem bigfiles*.txt > sorted

% psrterm -f filenames.fofn > sorted

% psortm A B.gz C.bz2 D.xz E.zst F.lz4 > sorted

% psortem -o sorted -s unsoirted*.txt

```

## Input files

* Accepts plain or compressed files 
  (.gz .zst .xz .bz2 .lz4)
* Assumes input files are *sorted* 
  and will merge them. If you have unsorted
  file use `-s` to pre-sort them.
* Control sort keys with `-S`. FOr common
  case of numeric sort, use the convenience
  options `-n`.
* If you have 1000s of files, you can provide
  a file of file names (a FOFN) via `-f`

## Output

* Default output is to `stdout`
* Save to a direct file using `-o`.
* If `-o` filename has a compression suffix
  (.gz .zst .xz .bz2 .lz4) it will be compressed

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
  -s       Sort input files first
  -S STR   Unix 'sort' options eg. -k1,1n -t$'\t'
  -n       Sort numerically; same as -S '-n'
  -t       Pre-cache input files with 'vmtouch'
```

## Performance tips

* By default all CPUs will be used. Control via `-j`
* If you have lots of RAM, use `-T /dev/shm`
* If you have slow disk, try reducing `-k`

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
