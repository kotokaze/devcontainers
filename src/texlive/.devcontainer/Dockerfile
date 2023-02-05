### base stage
ARG VARIANT=bullseye
ARG SCHEME=full
ARG DOCFILES=0
ARG SRCFILES=0
FROM buildpack-deps:${VARIANT}-curl as base

ENV \
  LANG=C.UTF-8 LC_ALL=C.UTF-8 \
  DEBIAN_FRONTEND=noninteractive \
  NOPERLDOC=1

# Install dependencies
RUN apt update && apt install -qy --no-install-recommends \
  git unzip \
  make fontconfig perl default-jre libgetopt-long-descriptive-perl libdigest-perl-md5-perl libncurses5 libncurses6 \
  libunicode-linebreak-perl libfile-homedir-perl libyaml-tiny-perl \
  ghostscript \
  libsm6 \
  python3 python3-pygments python-is-python3 \
  gnuplot-nox \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/cache/apt/

### builder stage
FROM base as builder
WORKDIR /tmp

ENV \
  TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1 \
  TEXLIVE_INSTALL_NO_DISKCHECK=1

# Create profile
COPY texlive.installation.profile .
RUN sed -i \
  -re "s|(selected_scheme\ scheme-)full|\1"${SCHEME}"|" \
  -re "s|(tlpdbopt_install_docfiles\ )0|\1"${DOCFILES}"|" \
  -re "s|(tlpdbopt_install_srcfiles\ )0|\1"${SRCFILES}"|" \
  texlive.installation.profile \
  && cat texlive.installation.profile

# Download and install TeX Live
ARG REPO=https://mirror.ctan.org/systems/texlive/tlnet
RUN case "${REPO}" in \
  'rsync://'*) \
  apt update && apt install -qy --no-install-recommends rsync \
  && rsync -va --del --stats ${REPO} texlive \
  && cd texlive \
  && perl ./install-tl -profile ../texlive.installation.profile --no-interaction \
  ;;*) \
  curl -sSLO https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  && zcat install-tl-unx.tar.gz | tar -xvf - \
  && cd install-tl-2* \
  && perl ./install-tl -profile ../texlive.installation.profile --no-interaction -repository ${REPO} \
  ;;esac

### final stage
FROM base
WORKDIR /tmp

ENV \
  DOCFILES=${DOCFILES} \
  SRCFILES=${SRCFILES}

# Install
COPY --from=builder /opt/texlive /opt/texlive

# Create dummy package with equivs and generate cache
RUN apt update && apt install -qy --no-install-recommends equivs \
  && curl https://tug.org/texlive/files/debian-equivs-2022-ex.txt -o texlive-local \
  && sed -i -e "s/2022/9999/" -e "/Depends: freeglut3/d" texlive-local \
  && equivs-build texlive-local \
  && dpkg -i texlive-local_9999.99999999-1_all.deb \
  && apt install -qy --no-install-recommends \
  && rm -rf ./*texlive* \
  && apt purge -qy equivs \
  && apt autoremove -qy --purge \
  && rm -rf /var/lib/apt/lists/* \
  && apt clean \
  && rm -rf /var/cache/apt/

# Add to path and generate cache
RUN $(find /opt/texlive -name tlmgr) path add \
  && (luaotfload-tool -u || true) \
  && (mtxrun --generate || true) \
  && (cp "$(find /usr/local/texlive -name texlive-fontconfig.conf)" /etc/fonts/conf.d/09-texlive-fonts.conf || true) \
  && fc-cache -fsv

ENTRYPOINT [ "/bin/bash" ]
