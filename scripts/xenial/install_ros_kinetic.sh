#!/bin/bash

CANDIDATE=ros-kinetic-desktop-full
#CANDIDATE=ros-kinetic-desktop
#CANDIDATE=ros-kinetic-ros-base

# Add ROS repositories
sh -c 'echo deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
apt-get update

# Install ROS
apt-get install $CANDIDATE -y

# Initialize rosdep
rm -rf /etc/ros/rosdep/sources.list.d/20-default.list # Remove the file if it already exists
rosdep init
rosdep update

# Add kinetic to your rc.local
echo "#!/bin/bash -e\n" > /etc/rc.local
echo "source /opt/ros/kinetic/setup.bash\n" >> /etc/rc.local
echo "exit 0\n" >> /etc/rc.local
#echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

# Install build tools
apt-get install python-rosinstall python-rosinstall-generator -y
