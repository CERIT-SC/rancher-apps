# Samba Server

Samba server can be used to expose [Persistent Volume Claim](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) via CIFS/SMB protocol as Windows network drive.

Persistent Volume Claim is used as a storage for running applications/pods in Kubernetes. If you want to upload/download data to/from this storage, Samba server provides convenient way to do it.

## Namespace

**It is important to deploy samba server into the same namespace where your PVC is located.** The PVC name is selected in the form below, select *Use an existing namespace* and select the one that the PVC is from.

## Authentication
In the form below, enter password that will be used for authentication. Username is always `user`.

## Access

To access the network drive, a URL needs to be provided. It is in the following form: `\\{$ns-$samba}.dyn.cloud.e-infra.cz\data`. Where `$samba` is replaced by instance name (selected in the next step, usually `samba`) and $ns is replaced by `namespace` you run this server in, e.g., `hejtmanek-ns`, so full URL can be `\\hejtmanek-ns-samba.dyn.cloud.e-infra.cz\data`.

### Windows

Map a network drive to get to it from File Explorer in Windows without having to look for it or type its network address each time.

1. Open **File Explorer** from the taskbar or the **Start** menu, or press the **Windows logo key `❖` + E.**

2. Select **This PC** from the left pane. Then, on the **Computer** tab, select **Map network drive**. 

3. In the **Folder** box, type the path of the folder or computer `\\{ns-samba}.dyn.cloud.e-infra.cz\data`. Replace `{ns-samba}` with correct name, see above. Fill in logon credentials, select `user` as username and selected password below.

### Linux

As root, type `mount //{ns-samba}.dyn.cloud.e-infra.cz/data /mnt -t cifs -o username=user,password=$PASSWORD` to mount the drive into the `/mnt` directory. Replace `$PASSWORD` with password selected below.

