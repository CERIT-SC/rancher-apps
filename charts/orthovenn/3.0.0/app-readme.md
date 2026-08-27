# OrthoVenn 3

[OrthoVenn](https://orthovenn.bioinfotoolkits.net/) compares whole-genome
orthologous clusters: it identifies and annotates orthologous gene clusters,
draws the Venn diagram of their overlaps, and reports GO enrichment for the
sets you pick out of it.

The web frontend, the API and its MySQL database run as three containers of one
pod, sharing two `ReadWriteMany` volumes.

## Before you install

* **The release name and the namespace pick the URL.** The application is
  published at `https://<release-name>-<namespace>.dyn.cloud.e-infra.cz`
  (`.dyn.cloud.trusted.e-infra.cz` on the trusted cluster). No DNS record has to
  be created; a Let's Encrypt certificate is requested automatically.
* **The site is behind HTTP basic auth.** OrthoVenn has no authentication of its
  own, so the login you enter below guards the whole application. The
  credentials are shown again in the release notes after install.
* **Volumes survive uninstall.** PersistentVolumeClaims are kept on
  `helm uninstall` so an accidental removal does not destroy uploaded data;
  delete them by hand for a clean slate.
