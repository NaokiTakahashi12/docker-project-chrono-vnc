FROM naokitakahashi12/project-chrono-vnc:xenial-irrlicht

RUN apt-get update && \
	apt-get install -y \
		pkg-config \
		cmake \
		make \
		git \
	&& \
	mkdir -p /setup/project-chrono && \
	cd /setup/project-chrono/ && \
	git clone --depth 1 https://github.com/projectchrono/chrono.git && \
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
		-D ENABLE_MODULE_DISTRIBUTED=ON \
		-D ENABLE_MODULE_IRRLICHT=ON \
		-D ENABLE_MODULE_OPENGL=ON \
		-D ENABLE_MODULE_PARALLEL=ON \
		-D ENABLE_MODULE_POSTPROCESS=ON \
	.. \
	&& \
	make && \
	make install && \
	cd / && \
	rm -rf /setup && \
	apt remove -y \
		pkg-config \
		cmake \
		make \
		git \
	&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

