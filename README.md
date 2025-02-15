# RosDocker: ROS in a Docker
Consente l'uso del Robot Operating System (ROS) su sistemi operativi Windows che abbiano installato Docker Desktop.

ROS è preinstallato in versione "Jazzy" all'interno di un container docker che ospita un ambiente di esecuzione Linux Ubuntu 24.04. Si accede al sistema tramite browser. L'interfaccia grafica offre una operatività Linux completa, inclusa l'installazione di ulteriori pacchetti.

In alternativa è disponibile un container con la versione "Humble" su Ubuntu 22.04. Per ottenerela rimuovere o rinominare il file `docker-compose.yml` e rinominare il file `docker-compose_humble.yml` come `docker-compose.yml`.

Il package ROS installato è il "desktop", che include tutti gli strumenti ROS di uso comune (ad es. ros2, rqt, rviz2 ecc.).

## Installazione ed avvio

 1. Installare Docker Desktop ([link](https://www.docker.com/products/docker-desktop/))
 3. Clonare questo repository git nel proprio PC ed accedere alla directory
    
        git clone https://github.com/mastrogeppetto/rosdocker
        cd rosdocker
    
 4. Avviare il container

        docker compose up -d

 5. Accedere al container dal browser alla URL [http://localhost:36901/vnc.html](http://localhost:36901/vnc.html). La password dell'utente "headless" è "headless"
 6. Testare l'installazione realizzando il primo dei tutorial sulla pagina di installazione di ROS. Nella interfaccia Linux del container, aprire due terminali.
    
    In uno:

        ros2 run demo_nodes_cpp talker

    Nell'altro:

        ros2 run demo_nodes_py listener

 7. Per arrestare il container utilizzare il tasto *default* in alto a destra nell'interfaccia Ubuntu offerta dal container.
 8. Per riavviare il container conservando le modifiche dell'utente utilizzare il comando 'docker start RosDesktop". Usare `compose` **solo** per rigenerare un nuovo container cancellando le modifiche dell'utente

## Suggerimenti d'uso

### Scambio di file con il sistema ospite

Per scambiare file con il sistema ospite è disponibile il comando Docker "cp", che copia un file dal sistema ospite al filesystem di un container e viceversa. Per copiare da ospite a container:

    docker cp <nomeFile> RosDesktop:<nomeFile>

e viceversa per copiare da container ad ospite.

In alcuni casi può essere più efficace un volume Docker condiviso tra ospite e container, che può essere realizzato in modo semplice con conoscenze elementari della tecnologia Docker.

### Condivisione della clipboard con il sistema ospite

Per effettuare operazioni di copia/incolla tra ospite e container è necessario condividere la clipboard utilizzando la linguetta che si trova all'estrema sinistra della pagina di accesso al container. Premendola si accede alla barra di controllo di VNC. Il secondo tast della barra di controllo da accesso alla clipboard condivisa.

Il contenuto della finestra corrisponde alla clipboard condivisa. Viene impostata automaticamente con operazioni di *copy* e *paste* dal container. Per trasferire da ospite a container è invece necessaria una operazione di *copy* da sistema ospite ed un *paste* nella finestra della clipboard condivisa. A questo punto è possibile un *paste* nel container.

### Realizzazione di due tutorial

I tutorial sono tratti dal sito di documentazione del progetto ([https://docs.ros.org/en/jazzy/Tutorials.html](URL)).

Nel tutorial *turtlesim* si utilizza, per lanciare la finestra grafica ed il controller:

    ros2 run turtlesim turtlesim_node
    ros2 run turtlesim turtle_teleop_key  

Per lanciare la seconda tartaruga utilizzare il comando `rqt` come illustrato nella documentazione.

Per controllare la seconda tartaruga:

    ros2 run turtlesim turtle_teleop_key --ros-args --remap turtle1/cmd_vel:=turtle2/cmd_vel

Nel tutorial *dummy-robot" si utilizza il seguente comando per lanciare il robot:

    ros2 launch dummy_robot_bringup dummy_robot_bringup_launch.py

In una seconda finestra si utilizza il comando `rviz2` per visualizzarne il comportamento. Per visualizzare l'intera finestra di *rviz2* può essere necessario ridimensionarla, con il tasto in alto a destra.

# Credits
La documentazione completa dell'immagine utilizzata per il desktop virtuale è [https://hub.docker.com/r/accetto/ubuntu-vnc-xfce](https://hub.docker.com/r/accetto/ubuntu-vnc-xfce)
