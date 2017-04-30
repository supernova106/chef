#!/usr/bin/env bats

@test "firefox binary is found in PATH" {
  run which firefox
  [ "$status" -eq 0 ]
}

@test "firefox version is 45.0" {
  run firefox -v
  [ "$output"="45.0" ]
}
