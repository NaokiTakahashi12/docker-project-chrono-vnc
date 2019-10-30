FROM naokitakahashi12/project-chrono-vnc:xenial-base

RUN apt update && \
	apt install -y \
		make \
		wget \
		unzip \
	&& \
	cd / && \
	mkdir IRRlicht_build && \
	cd IRRlicht_build && \
	wget http://downloads.sourceforge.net/irrlicht/irrlicht-1.8.4.zip && \
	unzip irrlicht-1.8.4.zip && \
	cd irrlicht-1.8.4/source/Irrlicht && \
	make sharedlib && \
	make install && \
	echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local-lib.conf && \
	ldconfig -v && \
	cd / && \
	rm -rf IRRlicht_build && \
	apt remove -y \
		make \
		wget \
		unzip \
	&& \
	apt clean && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/*
