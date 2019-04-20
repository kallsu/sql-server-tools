FROM debian:stretch
MAINTAINER giorgio.desideri@gmail.com

# Install .NET CLI dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bzr git mercurial openssh-client procps ca-certificates curl netbase wget \
        libc6 libgcc1 libgssapi-krb5-2 libicu57 liblttng-ust0 libssl1.0.2 libstdc++6 zlib1g \
        curl apt-transport-https software-properties-common locales apt-utils libunwind8 gpg \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'deb [arch=amd64] https://packages.microsoft.com/debian/9/prod stretch main' > /etc/apt/sources.list.d/mssql-release.list
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
  && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
  && wget -q https://packages.microsoft.com/config/debian/9/prod.list \
  && mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
  && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
  && chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# microsoft
RUN apt-get update -qq && \
  ACCEPT_EULA=Y apt-get install -y unzip mssql-tools unixodbc-dev \
  && rm -rf /var/lib/apt/lists/*

# Install SqlPackage
RUN mkdir -p /opt/downloads
RUN curl -Lq https://go.microsoft.com/fwlink/?linkid=873926 -o sqlpackage-linux-x64-latest.zip \
  && ls -alh \
  && unzip sqlpackage-linux-x64-latest.zip -d /opt/sqlpackage \
  && chmod +x /opt/sqlpackage/sqlpackage

# Set BashRC  
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin:/opt/sqlpackage"' >> ~/.bashrc

CMD /bin/bash
