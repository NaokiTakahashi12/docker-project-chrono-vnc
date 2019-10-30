FROM dorowu/ubuntu-desktop-lxde-vnc:xenial

RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		gcc g++ \
		libgl-dev \
		freeglut3-dev \
	&& \
	apt clean && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/*
