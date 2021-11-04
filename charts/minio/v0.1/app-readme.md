# Minio Server

Minio server can be used to expose [Persistent Volume Claim](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) via web interface or S3 API.

Persistent Volume Claim is used as a storage for running applications/pods in Kubernetes. If you want to upload/download data to/from this storage, minio server provides convenient way to do it.

**Due to minio limitation, you see only top level directories. Files from PVC root are not accessible.** Files from directories and subdirectories can be accessed as needed. Workaround for this limitation is done (automatically) symlinking root of the PVC to `root` directory/bucket.

## Namespace

**It is important do deploy minio server into the same namespace where your PVC is located.** The PVC name is selected in the form below, select *Use an existing namespace* and select the one that the PVC is from.

## Authentication
In the form below, enter username and password that will be used for Web authentication and S3 authentication. In case of S3 authentication, `username` is an **access key** and `password` is a **secret key**.

## Web Access

Navigate through the link `443/https` to the minio web console. Use `username` and `password` from the form for authentication. On the first login, you see `0 buckets` or `usage 0` and `objects 0`, this is normal and expected. You can click on buckets and see content or create new as needed. Web provides [user object browser](https://docs.min.io/minio/baremetal/console/minio-console.html#user-object-browser) only. Admin access is not allowed.

## S3 Access

Open Web Access to see the domain name of running server. It should be something like `minio-user-ns.dyn.cerit-sc.cz`. S3 endpoint is this URL prefixed `s3-`, e.g., `s3-minio-user-ns.dyn.cerit-sc.cz`. **Access key** and **secret key** are filled in the form below. 

You can use [`s4cmd`](https://github.com/bloomreach/s4cmd) command to utilize S3 api, this can be usually directly installed in most distros, e.g., `apt-get install s4cmd`. 

Example of listing buckets:
```
s4cmd --access-key=$USER --secret-key=$PASSWORD --endpoint-url=https://s3-minio-nextflow-ns.dyn.cerit-sc.cz ls
```

Just replace `$USER` and `$PASSWORD` and `endpoint-url` with your values.
