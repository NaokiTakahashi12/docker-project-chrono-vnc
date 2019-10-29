FROM naokitakahashi12/project-chrono-vnc:xenial-irrlicht

RUN mkdir -p /Eigen3_build && \
	cd /Eigen3_build && \
	apt-get update && \
	apt-get install -y \
		wget \
		bsdtar \
		pkg-config \
		cmake \
		make \
		git \
	&& \
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
	rm -rf /Eigen3_build && \
	mkdir ProjectChrono_build && \
	cd ProjectChrono_build/ && \
	git clone https://github.com/projectchrono/chrono.git && \
	cd chrono/ && \
	git submodule init && \
	git submodule update && \
	mkdir build && \
	cd build/ && \
	cmake \
		-D BUILD_BENCHMARKING=ON \
		-D BUILD_DEMOS=ON \
		-D ENABLE_HDF5=ON \
		-D ENABLE_MODULE_COSIMULATION=ON \
		-D ENABLE_MODULE_IRRLICHT=ON \
		-D ENABLE_MODULE_POSTPROCESS=ON \
	.. \
	&& \
	make -j8 && \
	make install && \
	cd / && \
	rm -rf ProjectChrono_build && \
	apt remove -y \
		wget \
		bsdtar \
		pkg-config \
		cmake \
		make \
		git \
	&& \
	apt clean && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/*

