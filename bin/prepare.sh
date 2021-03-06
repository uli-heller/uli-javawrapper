#!/bin/sh
#set -x
D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"

TPD="${D}/../3rd-party"

GROOVY_VERSION="2.1.6"
GROOVY_ZIP_BASENAME="groovy-binary-${GROOVY_VERSION}.zip"
GROOVY_ZIP_DOWNLOAD_URL="http://dist.groovy.codehaus.org/distributions/${GROOVY_ZIP_BASENAME}"
GROOVY_ZIP_ABSOLUTE_PATH="${TPD}/${GROOVY_ZIP_BASENAME}"

if [ ! -d "${TPD}" ]; then
  mkdir -p "${TPD}"
fi

if [ ! -d "${D}/groovy" ]; then
  if [ ! -s  "${GROOVY_ZIP_ABSOLUTE_PATH}" ]; then
    "${D}/httpcat.sh" "${GROOVY_ZIP_DOWNLOAD_URL}" >"${GROOVY_ZIP_ABSOLUTE_PATH}"
  fi
  (cd "${D}"; "${D}/myjar.sh" -xf "${GROOVY_ZIP_ABSOLUTE_PATH}")
  mv "${D}/groovy-${GROOVY_VERSION}" "${D}/groovy"
  (cd "${D}/groovy/bin"; ls|grep -v "bat"|xargs chmod +x)
fi

exit 0
