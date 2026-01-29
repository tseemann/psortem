#!/usr/bin/env bats

setup () {
  name="psortem"
  bats_require_minimum_version 1.5.0
  dir=$(dirname "$BATS_TEST_FILENAME")
  cd "$dir"
  exe="$dir/../$name"
}

@test "Script syntax check" {
  run -0 perl -c "$exe"
}
@test "Version" {
  run -0 $exe -v
  [[ "$output" =~ "$name " ]]
}
@test "Help" {
  run -0 $exe -h
  [[ "$output" =~ "merge" ]]
}
@test "Ciiation" {
  run -0 $exe -C
  [[ "$output" =~ "Seemann" ]]
}
@test "No parameters" {
  run ! $exe
}
@test "Bad option" {
  run ! $exe -Q
}
@test "Bad -k" {
  run ! $exe -k 0
  [[ "$output" =~ "ERROR:" ]]
}
@test "Plain files" {
  run $exe -q N01.txt N01.txt
  [[ "${lines[-1]}" =~ "100" ]]
}
@test "Compressed files" {
  run $exe -q N0*
  [[ "${lines[-1]}" =~ "6418" ]]
}
@test "Many CPUs" {
  run $exe -j $(nproc) -q N0*
  [[ "${lines[-1]}" =~ "6418" ]]
}
