# Getting started

#### Clone the repository
```bash
git clone https://github.com/demuma/utrecht
´´´

#### Build the Docker image
```bash
cd utrecht\
docker build . -t utrecht
´´´

#### Run the Docker
```bash
docker run -it utrecht
´´´

#### Run the Docker with X11
```bash
docker run -it \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --network=host \
    utrecht
´´´

#### Start the MQTT client
```bash
ros2 launch mqtt_client standalone.launch.ros2.xml params_file:=/root/Documents/bridge.yaml &
´´´

## Sending and receiving ROS messages
### Example 1: Set hydraulic pump throttle to full
```bash
ros2 topic pub /robotic_arm/hydraulic_pump_throttle std_msgs/msg/Float32 "data: 1200" -1
´´´

### Example 2: Move servo 1 continuously and get angle
```bash
ros2 topic pub /robotic_arm/hydraulic_servo_1 std_msgs/msg/Float32 "data: 1050" -1\
ros2 topic echo /telemetry/beta1
´´´

### Example 3: Move servo 2 and 3 continuously
```bash
ros2 topic pub /robotic_arm/hydraulic_servo_2 std_msgs/msg/Float32 "data: 1050" -1\
ros2 topic pub /robotic_arm/hydraulic_servo_3 std_msgs/msg/Float32 "data: 1050" -1
ros2 topic echo /telemetry/beta2 --once
ros2 topic echo /telemetry/beta3 --once
´´´

### Example 4: Use the provided Python script
```bash
cd /root/Documements\
python push_button_1.py
´´´

## Re-entering the Docker container
#### Show all last container IDs
```bash
docker ps -a
´´´

#### Find container ID (most recent ID)
```bash
CONTAINER_ID=`docker ps -a | awk 'NR==2 {print $1}'`
´´´

#### Start Docker container
```bash
docker start $CONTAINER_ID
´´´

#### Enter Docker container
```bash
docker exec -it "$CONTAINER_ID" /bin/bash
´´´
