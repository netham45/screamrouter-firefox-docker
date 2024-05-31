# Firefox Docker

This docker container is based on Debian and will install xtigervnc, pulseaudio, and Firefox.

This container will output 16-bit 44.1kHz PCM audio encapsulated in an RTP stream to the Docker host (172.17.0.1) and is intended to be ran on the same host [ScreamRouter](https://github.com/netham45/screamrouter) is running on.

![Screenshot of Firefox in ScreamRouter](/images/firefox.png)

## Usage

1. Clone the repo ```git clone https://github.com/netham45/firefox-docker.git```
2. On the computer running Screamrouter, build the container image ```docker build firefox-docker/ -t firefox-docker```
3. Make an instance of the container ```docker create -h "Firefox" firefox-docker```

At this point ScreamRouter's Auto-Detection should pick up on the container and add it to the interface.