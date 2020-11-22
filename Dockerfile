FROM kalilinux/kali-rolling
EXPOSE 5901
COPY startup.sh /startup.sh
WORKDIR /
RUN chmod +x startup.sh
RUN apt-get update && apt-get dist-upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y nano htop chromium kali-tools-top10 kali-desktop-xfce dbus-x11 tightvncserver
# ENTRYPOINT [ "startup.sh" ]
