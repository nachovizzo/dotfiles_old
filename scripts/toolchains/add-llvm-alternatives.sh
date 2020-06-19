#!/usr/bin/env sh
# @file      add-llvm-alternatives.sh
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
  --slave /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-${VERSION} \
  --slave /usr/bin/llvm-addr2line llvm-addr2line /usr/bin/llvm-addr2line-${VERSION} \
  --slave /usr/bin/llvm-ar llvm-ar /usr/bin/llvm-ar-${VERSION} \
  --slave /usr/bin/llvm-as llvm-as /usr/bin/llvm-as-${VERSION} \
  --slave /usr/bin/llvm-bcanalyzer llvm-bcanalyzer /usr/bin/llvm-bcanalyzer-${VERSION} \
  --slave /usr/bin/llvm-cat llvm-cat /usr/bin/llvm-cat-${VERSION} \
  --slave /usr/bin/llvm-cfi-verify llvm-cfi-verify /usr/bin/llvm-cfi-verify-${VERSION} \
  --slave /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-${VERSION} \
  --slave /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-${VERSION} \
  --slave /usr/bin/llvm-c-test llvm-c-test /usr/bin/llvm-c-test-${VERSION} \
  --slave /usr/bin/llvm-cvtres llvm-cvtres /usr/bin/llvm-cvtres-${VERSION} \
  --slave /usr/bin/llvm-cxxdump llvm-cxxdump /usr/bin/llvm-cxxdump-${VERSION} \
  --slave /usr/bin/llvm-cxxfilt llvm-cxxfilt /usr/bin/llvm-cxxfilt-${VERSION} \
  --slave /usr/bin/llvm-cxxmap llvm-cxxmap /usr/bin/llvm-cxxmap-${VERSION} \
  --slave /usr/bin/llvm-diff llvm-diff /usr/bin/llvm-diff-${VERSION} \
  --slave /usr/bin/llvm-dis llvm-dis /usr/bin/llvm-dis-${VERSION} \
  --slave /usr/bin/llvm-dlltool llvm-dlltool /usr/bin/llvm-dlltool-${VERSION} \
  --slave /usr/bin/llvm-dwarfdump llvm-dwarfdump /usr/bin/llvm-dwarfdump-${VERSION} \
  --slave /usr/bin/llvm-dwp llvm-dwp /usr/bin/llvm-dwp-${VERSION} \
  --slave /usr/bin/llvm-elfabi llvm-elfabi /usr/bin/llvm-elfabi-${VERSION} \
  --slave /usr/bin/llvm-exegesis llvm-exegesis /usr/bin/llvm-exegesis-${VERSION} \
  --slave /usr/bin/llvm-extract llvm-extract /usr/bin/llvm-extract-${VERSION} \
  --slave /usr/bin/llvm-ifs llvm-ifs /usr/bin/llvm-ifs-${VERSION} \
  --slave /usr/bin/llvm-install-name-tool llvm-install-name-tool /usr/bin/llvm-install-name-tool-${VERSION} \
  --slave /usr/bin/llvm-jitlink llvm-jitlink /usr/bin/llvm-jitlink-${VERSION} \
  --slave /usr/bin/llvm-lib llvm-lib /usr/bin/llvm-lib-${VERSION} \
  --slave /usr/bin/llvm-link llvm-link /usr/bin/llvm-link-${VERSION} \
  --slave /usr/bin/llvm-lipo llvm-lipo /usr/bin/llvm-lipo-${VERSION} \
  --slave /usr/bin/llvm-lto llvm-lto /usr/bin/llvm-lto-${VERSION} \
  --slave /usr/bin/llvm-lto2 llvm-lto2 /usr/bin/llvm-lto2-${VERSION} \
  --slave /usr/bin/llvm-mc llvm-mc /usr/bin/llvm-mc-${VERSION} \
  --slave /usr/bin/llvm-mca llvm-mca /usr/bin/llvm-mca-${VERSION} \
  --slave /usr/bin/llvm-modextract llvm-modextract /usr/bin/llvm-modextract-${VERSION} \
  --slave /usr/bin/llvm-mt llvm-mt /usr/bin/llvm-mt-${VERSION} \
  --slave /usr/bin/llvm-nm llvm-nm /usr/bin/llvm-nm-${VERSION} \
  --slave /usr/bin/llvm-objcopy llvm-objcopy /usr/bin/llvm-objcopy-${VERSION} \
  --slave /usr/bin/llvm-objdump llvm-objdump /usr/bin/llvm-objdump-${VERSION} \
  --slave /usr/bin/llvm-opt-report llvm-opt-report /usr/bin/llvm-opt-report-${VERSION} \
  --slave /usr/bin/llvm-pdbutil llvm-pdbutil /usr/bin/llvm-pdbutil-${VERSION} \
  --slave /usr/bin/llvm-PerfectShuffle llvm-PerfectShuffle /usr/bin/llvm-PerfectShuffle-${VERSION} \
  --slave /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-${VERSION} \
  --slave /usr/bin/llvm-ranlib llvm-ranlib /usr/bin/llvm-ranlib-${VERSION} \
  --slave /usr/bin/llvm-rc llvm-rc /usr/bin/llvm-rc-${VERSION} \
  --slave /usr/bin/llvm-readelf llvm-readelf /usr/bin/llvm-readelf-${VERSION} \
  --slave /usr/bin/llvm-readobj llvm-readobj /usr/bin/llvm-readobj-${VERSION} \
  --slave /usr/bin/llvm-reduce llvm-reduce /usr/bin/llvm-reduce-${VERSION} \
  --slave /usr/bin/llvm-rtdyld llvm-rtdyld /usr/bin/llvm-rtdyld-${VERSION} \
  --slave /usr/bin/llvm-size llvm-size /usr/bin/llvm-size-${VERSION} \
  --slave /usr/bin/llvm-split llvm-split /usr/bin/llvm-split-${VERSION} \
  --slave /usr/bin/llvm-stress llvm-stress /usr/bin/llvm-stress-${VERSION} \
  --slave /usr/bin/llvm-strings llvm-strings /usr/bin/llvm-strings-${VERSION} \
  --slave /usr/bin/llvm-strip llvm-strip /usr/bin/llvm-strip-${VERSION} \
  --slave /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-${VERSION} \
  --slave /usr/bin/llvm-tblgen llvm-tblgen /usr/bin/llvm-tblgen-${VERSION} \
  --slave /usr/bin/llvm-undname llvm-undname /usr/bin/llvm-undname-${VERSION} \
  --slave /usr/bin/llvm-xray llvm-xray /usr/bin/llvm-xray-${VERSION}
