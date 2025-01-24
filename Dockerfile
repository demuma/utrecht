FROM ros:humble-ros-base

RUN apt-get update && apt-get upgrade -y
RUN apt-get install ros-humble-rqt* ros-humble-mqtt-client -y
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
RUN mkdir /root/Documents
COPY bridge.yaml /root/Documents/bridge.yaml
COPY simulation.py /root/Documents/bridge.yaml
