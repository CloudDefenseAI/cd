#!/bin/sh

# Copyright Cloud Defense Authors
#

set -e

# Determines the operating system.
OS="$(uname)"
if [ "x${OS}" = "xDarwin" ] ; then
  OSEXT="mac"
else
  OSEXT="linux"
fi

echo $OSEXT
# Determine the latest Istio version by version number ignoring alpha, beta, and rc versions.
if [ "x${CD_VERSION}" = "x" ] ; then
  CD_VERSION="$(curl -sL https://github.com/CloudDefenseAI/cd/releases | \
					grep 'releases/tag/[0-9]*.[0-9]*.[0-9]*' | sort -V | \
					tail -1 | awk -F'/' '{ print $6}' | awk -F'"' '{ print $1}')"
  CD_VERSION="${CD_VERSION##*/}"
fi
echo $CD_VERSION

LOCAL_ARCH=$(uname -m)
if [ "${TARGET_ARCH}" ]; then
    LOCAL_ARCH=${TARGET_ARCH}
fi

case "${LOCAL_ARCH}" in
  x86_64)
    CD_ARCH=x64
    ;;
  armv8*)
    CD_ARCH=arm64
    ;;
  aarch64*)
    CD_ARCH=arm64
    ;;
  armv*)
    CD_ARCH=armv7
    ;;
  amd64|arm64)
    CD_ARCH=${LOCAL_ARCH}
    ;;
  *)
    echo "This system's architecture, ${LOCAL_ARCH}, isn't supported"
    exit 1
    ;;
esac

if [ "x${CD_VERSION}" = "x" ] ; then
  printf "Unable to get latest Cloud Defense version. Set CD_VERSION env var and re-run. For example: export CD_VERSION=1.0.4"
  exit 1;
fi

NAME="cdefense-${CD_VERSION}"
URL="https://github.com/CloudDefenseAI/cd/releases/download/${CD_VERSION}/cd-latest-${OSEXT}-x64.tar.gz"
ARCH_URL="https://github.com/CloudDefenseAI/cd/releases/download/${CD_VERSION}/cd-latest-{OSEXT}-${CD_ARCH}.tar.gz"

with_arch() {
  printf "\nDownloading %s from %s ...\n" "$NAME" "$ARCH_URL"
  if ! curl -o /dev/null -sIf "$ARCH_URL"; then
    printf "\n%s is not found, please specify a valid CD_VERSION and TARGET_ARCH\n" "$ARCH_URL"
    exit 1
  fi
  curl -fsLO "$ARCH_URL"
  filename="cd-latest-{OSEXT}-${CD_ARCH}.tar.gz"
  tar -xzf "${filename}"
  tar -C /usr/local/bin -xzf "${filename}"
  chmod +x /usr/local/bin/cdefense
  rm "${filename}"
}

without_arch() {
  printf "\nDownloading %s from %s ..." "$NAME" "$URL"
  if ! curl -o /dev/null -sIf "$URL"; then
    printf "\n%s is not found, please specify a valid CD_VERSION\n" "$URL"
    exit 1
  fi
  curl -fsLO "$URL"
  filename="cd-latest-${OSEXT}-x64.tar.gz"
  tar -C /usr/local/bin -xzf "${filename}"
  chmod +x /usr/local/bin/cdefense
  rm "${filename}"
}

ARCH_SUPPORTED="9.9"

if [ "${OS}" = "Linux" ] ; then
  # This checks if CD_VERSION is less than ARCH_SUPPORTED (version-sort's before it)
  if [ "$(printf '%s\n%s' "${ARCH_SUPPORTED}" "${CD_VERSION}" | sort -V | head -n 1)" = "${CD_VERSION}" ]; then
    without_arch
  else
    with_arch
  fi
elif [ "x${OS}" = "xDarwin" ] ; then
  without_arch
else
  printf "\n\n"
  printf "Unable to download Cloud Defense %s at this moment!\n" "$CD_VERSION"
  printf "Please verify the version you are trying to download.\n\n"
  exit 1
fi

printf ""
printf "\nCloud Defense %s Download Complete!\n" "$CD_VERSION"
printf "\n"
printf "Cloud Defense CLI has been successfully installed on your system.\n"
printf "\n"
printf "Run cdefense -h for usage details\n"
