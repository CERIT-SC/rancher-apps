# ownCloud Client

ownCloud client can be used to sync [Persistent Volume Claim](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) with [ownCloud](https://owncloud.com) servers, such as [ownCloud CESNET](https://owncloud.cesnet.cz).

Persistent Volume Claim is used as a storage for running applications/pods in Kubernetes. If you want to sync data to/from this storage with ownCloud server, owncloud client provides convenient way to do it.

## Namespace

**It is important to deploy owncloud client into the same namespace where your PVC is located.** The PVC name is selected in the form below, select *Use an existing namespace* and select the one that the PVC is from.

## Authentication

At first, it is required to setup access name and password on the ownCloud server, in case of ownCloud CESNET, follow documentation [here](https://du.cesnet.cz/en/navody/owncloud/start#access_via_webdav_protocol) (see Access via WebDAV protocol). Access name and password needs to be passed in the form during launching this application.

## Folders

For more information, consult our [documentation](https://docs.cerit.io/docs/owncloudclient.html).

You need to fill *local* and *remote* folders. The local folder is relative to PVC mount point. E.g., if PVC is connected to `/home/user` and you select local folder as `owncloud-data`, data will be synced into `/home/user/owncloud-data`.

You can check the mount point entering the `pod` and issuing `df -h` to see the mount point, for more, see [documentation](https://docs.cerit.io/docs/owncloudclient.html).

The *remote* folder if name on the ownCloud server such as, `Documents`, `Photos`. If you set remote folder to `/`, all your data from the ownCloud server will be synced.

### Note

* Data synchronisation is *always bidirectional*, meaning you cannot sync only from ownCloud server or only to ownCloud server. Data is synced both from and to the ownCloud server.

* Data synchronisation is done every 30 seconds.
