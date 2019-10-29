FROM naokitakahashi12/project-chrono-vnc:bionic-irrlicht

RUN apt update && \
	apt install -y \
		libeigen3-dev \
		pkg-config \
		cmake \
		make \
		git \
	&& \
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
		pkg-config \
		cmake \
		make \
		git \
	&& \
	apt clean && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/*
