FROM debian
RUN sed -i 's/ main/ main contrib non-free security/g' /etc/apt/sources.list.d/* && \
  apt-get update -y && \
  apt-get install -y tigervnc-standalone-server openbox pulseaudio avahi-daemon firefox-esr gstreamer1.0-plugins-good && \
  rm -rf /var/lib/apt/lists
ENV VNC_DESKTOP_NAME "Xtigervnc"
ENV VNC_GEOMETRY 1280x800
ENV RTP_TARGET 172.17.0.1
ENV RTP_PORT 40000
COPY app/ /app/
COPY root/.config/openbox/ /root/.config/openbox/
CMD /app/main.sh
