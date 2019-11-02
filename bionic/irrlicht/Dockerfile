FROM naokitakahashi12/project-chrono-vnc:bionic-blaze

RUN apt update && \
	apt install -y \
		make \
		wget \
		unzip \
	&& \
	mkdir -p /setup/irrlicht && \
	cd /setup/irrlicht && \
	wget http://downloads.sourceforge.net/irrlicht/irrlicht-1.8.4.zip && \
	unzip irrlicht-1.8.4.zip && \
	cd irrlicht-1.8.4/source/Irrlicht && \
	make sharedlib && \
	make install && \
	echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local-lib.conf && \
	ldconfig -v && \
	cd / && \
	rm -rf /setup && \
	apt remove -y \
		make \
		wget \
		unzip \
	&& \
	apt clean && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/*
