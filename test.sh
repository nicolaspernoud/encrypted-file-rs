#!/bin/bash
set -Eeuo pipefail
WD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${WD}"

for i in {1..2000}; do
    echo -e "===============================\nRunning test for iteration $i\n==============================="
    if ! cargo test --release -- --no-capture; then
        echo "Test failed on iteration $i"
        exit 1
    fi
done
