#!/usr/bin/env bash
set -u

stdbuf -oL voxtype status --follow | while read -r state; do
  case "$state" in
    recording|streaming)
      printf '1' | socat - UNIX-CONNECT:/tmp/phemic_ctl.sock 2>/dev/null
      ;;
    idle|transcribing|stopped)
      printf '0' | socat - UNIX-CONNECT:/tmp/phemic_ctl.sock 2>/dev/null
      ;;
  esac
done
