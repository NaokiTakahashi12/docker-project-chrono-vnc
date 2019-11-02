FROM naokitakahashi12/project-chrono-vnc:xenial-base

RUN apt update && \
	apt install -y \
		wget \
		cmake \
		make \
		bsdtar \
	&& \
	mkdir -p /setup/eigen3.3.7 && \
	cd /setup/eigen3.3.7/ && \
	EIGEN3_SOURCE_DIR=eigen3.3.7 && \
	EIGEN3_SOURCE_TAR_FILE=eigen3.3.7.tar.bz2 && \
	wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2 -O $EIGEN3_SOURCE_TAR_FILE && \
	mkdir $EIGEN3_SOURCE_DIR && \
	bsdtar -xf $EIGEN3_SOURCE_TAR_FILE --strip-components 1 -C $EIGEN3_SOURCE_DIR && \
	mkdir $EIGEN3_SOURCE_DIR/build && \
	cd $EIGEN3_SOURCE_DIR/build && \
	cmake .. && \
	make install && \
	cd / && \
	rm -rf /setup && \
	apt remove -y \
		wget \
		cmake \
		make \
		bsdtar \
	&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
