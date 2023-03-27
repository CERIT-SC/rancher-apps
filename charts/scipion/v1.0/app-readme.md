# Scipion
This application enables you to use Scipion app in cloud environment with several 3DEM tools and queue system. The solution includes GUI with browser-based remote desktop, and is capable of using a graphics card for CUDA-accelerated tools.

## Onedata
Onedata is used as a storage with dataset data (e.g. data scanned by CryoEM) and project data.

## Required input arguments
When launching Scipion app, you need to fill the following information:

- VNC password - required to access the remote desktop
- Onedata storage connection credentials

## Web Access
When the instance is running, navidate you browser to the URL with the following format: `https://scipion.`*instance-name*`.`*your-namespace*`.dyn.cloud.e-infra.cz/`.  
E.g. `https://scipion.test.handl-ns.dyn.cloud.e-infra.cz/`.

