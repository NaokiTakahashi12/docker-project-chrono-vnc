FROM dorowu/ubuntu-desktop-lxde-vnc:xenial

RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		gcc \
		g++ \
		libopenmpi-dev \
		liblapack-dev \
		libthrust-dev \
		libgl-dev \
		libglm-dev \
		libglew-dev \
		libglfw3-dev \
		freeglut3-dev \
		libxmu-dev \
		libxi-dev \
	&& \
	apt clean && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/*
