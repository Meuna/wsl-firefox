FROM ubuntu:jammy

RUN apt-get update && apt-get -y install wget && \
    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- > /etc/apt/keyrings/packages.mozilla.org.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" > /etc/apt/sources.list.d/mozilla.list && \
    echo "Package: *" > /etc/apt/preferences.d/mozilla && \
    echo "Pin: origin packages.mozilla.org" >> /etc/apt/preferences.d/mozilla && \
    echo "Pin-Priority: 1000" >> /etc/apt/preferences.d/mozilla && \
    apt-get update && apt-get -y install firefox

CMD firefox
