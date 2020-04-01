#!/usr/bin/env sh
# @file      update-clang-alternatives.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# Pick here your clang version
VERSION=10

# Remove all existing alternatives
sudo update-alternatives --remove-all clang

# exit on first error
set -e

sudo update-alternatives \
  --install /usr/bin/clang clang /usr/bin/clang-${VERSION} 20 \
  --slave /usr/bin/clang++ clang++ /usr/bin/clang++-${VERSION} \
  --slave /usr/bin/lld lld /usr/bin/lld-${VERSION} \
  --slave /usr/bin/clang-format clang-format /usr/bin/clang-format-${VERSION} \
  --slave /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-${VERSION} \
  --slave /usr/bin/clang-tidy-diff.py clang-tidy-diff.py /usr/bin/clang-tidy-diff-${VERSION}.py \
  --slave /usr/bin/run-clang-tidy run-clang-tidy /usr/bin/run-clang-tidy-${VERSION} \
  --slave /usr/bin/clang-include-fixer clang-include-fixer /usr/bin/clang-include-fixer-${VERSION} \
  --slave /usr/bin/clang-offload-bundler clang-offload-bundler /usr/bin/clang-offload-bundler-${VERSION} \
  --slave /usr/bin/clangd clangd /usr/bin/clangd-${VERSION} \
  --slave /usr/bin/clang-check clang-check /usr/bin/clang-check-${VERSION} \
  --slave /usr/bin/scan-view scan-view /usr/bin/scan-view-${VERSION} \
  --slave /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-${VERSION} \
  --slave /usr/bin/clang-query clang-query /usr/bin/clang-query-${VERSION} \
  --slave /usr/bin/modularize modularize /usr/bin/modularize-${VERSION} \
  --slave /usr/bin/sancov sancov /usr/bin/sancov-${VERSION} \
  --slave /usr/bin/c-index-test c-index-test /usr/bin/c-index-test-${VERSION} \
  --slave /usr/bin/clang-reorder-fields clang-reorder-fields /usr/bin/clang-reorder-fields-${VERSION} \
  --slave /usr/bin/clang-change-namespace clang-change-namespace /usr/bin/clang-change-namespace-${VERSION} \
  --slave /usr/bin/clang-import-test clang-import-test /usr/bin/clang-import-test-${VERSION} \
  --slave /usr/bin/scan-build scan-build /usr/bin/scan-build-${VERSION} \
  --slave /usr/bin/scan-build-py scan-build-py /usr/bin/scan-build-py-${VERSION} \
  --slave /usr/bin/clang-cl clang-cl /usr/bin/clang-cl-${VERSION} \
  --slave /usr/bin/clang-rename clang-rename /usr/bin/clang-rename-${VERSION} \
  --slave /usr/bin/find-all-symbols find-all-symbols /usr/bin/find-all-symbols-${VERSION} \
  --slave /usr/bin/lldb lldb /usr/bin/lldb-${VERSION} \
  --slave /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-${VERSION}
