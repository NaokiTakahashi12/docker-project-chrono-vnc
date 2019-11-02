FROM naokitakahashi12/project-chrono-vnc:bionic-eigen3.3.7

RUN apt update && \
	apt install -y \
		cmake \
		make \
		pkg-config \
		git \
	&& \
	mkdir -p /setup/blaze && \
	cd /setup/blaze/ && \
	git clone --depth 1 https://bitbucket.org/blaze-lib/blaze.git && \
	mkdir blaze/build && \
	cd blaze/build/ && \
	cmake .. && \
	make install && \
	cd / && \
	rm -rf /setup && \
	apt remove -y \
		cmake \
		make \
		pkg-config \
		git \
	&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
