# Getting started

### Clone the repository
git clone https://github.com/demuma/utrecht

### Build the Docker image
docker build . -t utrecht

### Run the Docker
docker run -it utrecht

### Start the MQTT client
ros2 launch mqtt-client standalone.launch.ros2.xml params_file:=/root/documents/bridge.yaml &

## Sending and receiving ROS messages
### Example 1: Set hydraulic pump trottle to full
ros2 topic pub /robotic_arm/hydraulic_pump_throttle std_msgs/msg/Float32 "data: 1200" -1

### Example 2: Move servo 1 continuously
ros2 topic pub /robotic_arm/hydraulic_servo_1 std_msgs/msg/Float32 "data: 1050" -1

### Example 3: Move servo 2 and 3 continuously
ros2 topic pub /robotic_arm/hydraulic_servo_2 std_msgs/msg/Float32 "data: 1050" -1
ros2 topic pub /robotic_arm/hydraulic_servo_3 std_msgs/msg/Float32 "data: 1050" -1

## Re-entering the Docker container
### Show all last container IDs
docker ps -a

### Find container ID (most recent ID)
CONTAINER_ID=`docker ps -a | awk 'NR==2 {print $1}'`

### Start Docker container
docker start $CONTAINER_ID

### Enter Docker container
docker exec -it "$CONTAINER_ID" /bin/bash
