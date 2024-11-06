if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi
apt update
apt upgrade -y
apt update
apt install locales
locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
apt install software-properties-common -y
add-apt-repository universe -y
apt update
apt install curl -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
apt update
apt install ros-jazzy-desktop -y
apt install gedit falkon git -y
update-alternatives --set x-www-browser /usr/bin/falkon
add-apt-repository ppa:kisak/kisak-mesa -y
apt update
apt upgrade -y
echo "source /opt/ros/jazzy/setup.bash" >> /home/headless/.bashrc
echo "LANG=en_US.UTF-8" >> /home/headless/.bashrc
