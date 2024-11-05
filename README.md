### RosDocker: ROS in a Docker

 1.  Installare Docker Desktop
 2. Scaricare l'immagine e avviare il container

        $ docker compose up

 3. Caricare lo script di installazione nel docker:

        $ docker cp install.sh RosDesktop:/tmp/install.sh

 4. Accedere al docker dal browser alla URL [http://localhost:36901/vnc.html](http://localhost:36901/vnc.html). La password dell'utente "headless" è "headless"
 5. Lanciare il comando di installazione

        $ sudo bash /tmp/install.sh

 6. Testare l'installazione aprendo un secondo terminale.
    In uno:

        $ source /opt/ros/jazzy/setup.bash
        $ ros2 run demo_nodes_cpp talker

    Nell'altro:

        $ source /opt/ros/jazzy/setup.bash
        $ ros2 run demo_nodes_py listener

La documentazione completa dell'immagine utilizzata per il desktop virtuale è [https://hub.docker.com/r/accetto/ubuntu-vnc-xfce](https://hub.docker.com/r/accetto/ubuntu-vnc-xfce)
