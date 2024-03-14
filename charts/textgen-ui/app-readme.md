## Text generation web UI

A Gradio web UI for Large Language Models.

For more information, see [https://github.com/oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui).

## NOTE

**After successful install, wait few seconds before apps is up and running**

### Options

There are several options that needs to be filled.

* **Hostname:** it the name, using which the application will be accessed. The access URL will be displayed on success instal. It will be in the form: https://[Hostname]-[Namespace].dyn.cloud.e-infra.cz.

* **Username:** username for web authentication.

* **Password:** password for web authentication.

* **CPU:** CPU resource limit for the web instance.

* **Memory:** Memory resource limit for the web instance.

* **GPU:** GPU type. Selectable options: 
  
  * **nvidia.com/gpu** (Whole GPU, according to available resources, A10/22GB, A40/40GB, A100/80GB, H100/80GB)
  * **nvidia.com/mig-1g.10gb** (MIG part of A100 GPU, 10GB VRAM)
  * **nvidia.com/mig-2g.20gb** (MIG part of A100 GPU, 20GB VRAM)
