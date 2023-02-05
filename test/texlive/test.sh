#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "latex" latex --version
check "biber" biber --version
check "xindy" xindy --version
check "arara" arara --version

# Check kpsewhich and texdoc if DOCFILES is set
if [ -n "${DOCFILES}" ]; then
  check "kpsewhich" kpsewhich --version
  check "texdoc" texdoc --version
fi

check "python" python --version
check "pygmentize" pygmentize -V

# Report result
reportResults
