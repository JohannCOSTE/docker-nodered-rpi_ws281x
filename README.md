# docker-nodered-rpi_ws281x
## Overview
This project is born from a IoT school work. We needed to connect the Adafruit NeoPixel rings (16 leds and 12 leds) to a Raspberry Py but we haven't anthing exepect the leds and the wires. After seeking on the web I found this tutorial http://frederickvandenbosch.be/?p=1014 which help me a lot. In order to simply a little more the process, I decided to create in Docker container which will contained all the stuff needed in order to be able to make the leds works just with a `docker pull` and a `docker run`. Futhermore to make the led utilisation really user friedly and compliant with IoT pusrpose, I wanted to add Node-RED to the container.

## Credits
This projet is born thanks to:
*  Jeremy Garff rpi_ws281x library (BSD-2-Clause license): https://github.com/jgarff/rpi_ws281x
*  Frederick Vandenbosch tutorial: http://frederickvandenbosch.be/?p=1014

## What's inside
The docker file is pretty simple, from the official Node-RED image it install the needed package and clone the rpi_ws281x library and initialise the evirnomment. I add some personnal scripts to use basic feature of the leds.

## How to build
### From Docker hub
```
$> docker pull johanncoste/docker-nodered-rpi_ws281x:latest
```

### Manually
```
$> git clone https://github.com/JohannCOSTE/docker-nodered-rpi_ws281x.git .
$> cd docker-nodered-rpi_ws281x
$> docker build -t docker-nodered-rpi_ws281x .
```

## How to run
Beacause of GPIO access, you have to run the container in privileged mode:
```
docker run -p 1880:1880 --privileged docker-nodered-rpi_ws281x
```

## How to access
It's first a Node-RED container so to access it you have to connect to:
```
http://0.0.0.0:1880/
```
Replace `0.0.0.0` by the IP adress of your device


## Python scripts and Json flows
### Python
There is some default python scripts that will be move inside the container at the root. You case use them directly with Node-RED:
*  `/color.py r v b blink` will light up the led with the `r` `v` `b` color and the led will blink with a frequency of `blink` second.
*  `ledtest.py` will just display some colors on the leds, you can use it to test if all is correctly wired.

You may have to edit the `# LED strip configuration` section of them in order to change the number of leds of you device etc.

### Json
There is also a Json flow `color_flow.json` that will show you an exemple of the script usage via Node-RED. You have to import it manually via the `Import` option in Node-RED.

## How to wire