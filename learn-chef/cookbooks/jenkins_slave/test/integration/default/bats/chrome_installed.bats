#!/usr/bin/env bats

@test "chrome binary is found in PATH" {
  run which google-chrome
  [ "$status" -eq 0 ]
}
