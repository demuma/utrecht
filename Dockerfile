FROM ros:humble-ros-base

RUN apt-get update && apt-get upgrade -y
RUN apt-get install ros-humble-rqt* ros-humble-mqtt-client
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
RUN mkdir /root/documents
COPY bridge.yaml /root/documents/bridge.yaml
