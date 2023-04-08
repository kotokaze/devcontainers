#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "latex" latex --version
check "biber" biber --version
check "xindy" xindy --version
check "arara" arara --version
check "kpsewhich" kpsewhich --version
check "texdoc" texdoc --version

check "python" python --version
check "pygmentize" pygmentize -V

# Report result
reportResults
