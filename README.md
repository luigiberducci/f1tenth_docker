# F1/10 Docker 

Docker image to provide HTML5 VNC interface for F1/10 simulator (Course Autonomous Racing Cars - TUWien).

The image inlcudes, Ubuntu 20.04 focal, ROS Noetic Desktop Full, F1Tenth Simulator.


# Quick Start

Build the Docker image:
```
docker build -t f1tenth .
```

Access via the HTML VNC interface:
```
docker run -it --rm -p 6080:80 
```
Then, browse to http://127.0.0.1:6080/


Access using any VNC Viewer (e.g. Remmina):
```
docker run -it --rm -p 6080:80 -p 5900:5900
```
Then, use the VNC Viewer to access 127.0.0.1:5900

From there, to launch the simulator:
- Open a terminal window
- Run `roslaunch f1tenth_simulator simulator.launch`

# Acknowledgements

Many thanks to:
- dorowu for creating the dorowu/ubuntu-desktop-lxde-vnc [image](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc/)
- madhurbehl for creating the base repo for [F1TENTH Docker](https://hub.docker.com/r/madhurbehl/f1tenth)
