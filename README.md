# F1/10 Docker 

Docker image to provide HTML5 VNC interface for F1/10 simulator (Course Autonomous Racing Cars - TUWien).

The image inlcudes, Ubuntu 20.04 focal, ROS Noetic Desktop Full, F1Tenth Simulator.


# Quick Start

Build the Docker image:
```
docker build -t f1tenth .
```

Run the docker image and open port `6080`
```
docker run -it --rm -p 6080:80 
```

Access to the VNC interface:
```
Browse to http://127.0.0.1:6080/
```

From there, to launch the simulator:
- Open a terminal window
- Run `roslaunch f1tenth_simulator simulator.launch`

# Acknowledgements

Many thanks to dorowu for creating the dorowu/ubuntu-desktop-lxde-vnc image.
<https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc/>
Many thanks to madhurbehl for creating the base repo for F1TENTH Docker.
<https://hub.docker.com/r/madhurbehl/f1tenth>
