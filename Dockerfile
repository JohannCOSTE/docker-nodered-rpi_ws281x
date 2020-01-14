FROM nodered/node-red
USER root
RUN apk add python-dev git scons swig
RUN git clone https://github.com/jgarff/rpi_ws281x.git
RUN cd rpi_ws281x && scons && cd python && python setup.py install
COPY py_scripts /
