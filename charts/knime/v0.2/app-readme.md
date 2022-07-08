# KNIME Server
KNIME Analytics Platform is the open source software for creating data science. Intuitive, open, and continuously integrating new developments, KNIME makes understanding data and designing data science workflows and reusable components accessible to everyone.

You can connect storage with your data. Access is available via `vncviewer`.

There are several options available:
* [RealVNC](https://www.realvnc.com/en/connect/download/viewer/windows/)
* [TightVNC](https://www.tightvnc.com/download.php)
* [TigerVNC](https://github.com/TigerVNC/tigervnc/releases)

On Linux distributions, the `vncviewer` is usually provided as a package and can be directly installed. E.g., on Ubuntu `apt-get install tigervnc-viewer`.

## Authentication
In the form, you choose password for VNC client, there is no default and it is required to set a password.

## Storage
This application supports currently `ha-bay.ics.muni.cz` storage only. You need to enter your UCO and *secondary* password,  or if you possess a service account, you can provide it. You need to specify a path also or select built in.

## VNC Access

VNC access is possible from MUNI network only. From outer networks, you need to use some kind of VPN service. Point your vncview to the address you can find in **Deployments** as **Endpoints**. If you copy paste from browser (copy link location from `5901/TCP` label), omit `http://` and trailing `/`. If you hover with pointer over the Endpoint label `5901/TCP`, you will see an IP address you need to connect to. Port is always 5901. Correct IP address will be something like `10.16.63.xx`. 
