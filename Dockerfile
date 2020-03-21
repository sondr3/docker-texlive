FROM debian:sid-20200224-slim
LABEL maintainer "Sondre Nilsen <nilsen.sondre@gmail.com>"
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=dumb

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

ARG BUILD_DATE

# Fix for update-alternatives: error: error creating symbolic link '/usr/share/man/man1/rmid.1.gz.dpkg-tmp': No such file or directory
# See https://github.com/debuerreotype/docker-debian-artifacts/issues/24#issuecomment-360870939
RUN mkdir -p /usr/share/man/man1

RUN apt-get update -qq && apt-get upgrade -qq && \
    apt-get install -qy wget curl libgetopt-long-descriptive-perl libdigest-perl-md5-perl fontconfig && \
    apt-get install -qy --no-install-recommends libfile-which-perl libfile-copy-recursive-perl pdftk ghostscript unzip openssh-client git && \
    apt-get install -qy --no-install-recommends texlive-full fonts-texgyre latexml xindy && \
    # Removing documentation packages *after* installing them is kind of hacky,
    # but it only adds some overhead while building the image.
    # Source: https://github.com/aergus/dockerfiles/blob/master/latex/Dockerfile
    apt-get --purge remove -qy .\*-doc$ && \
    # save some space
    rm -rf /var/lib/apt/lists/* && apt-get clean

# update font index
RUN luaotfload-tool --update

COPY latexmkrc /root/.latexmkrc

WORKDIR /home
