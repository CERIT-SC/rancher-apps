# MaxQuant

MaxQuant is a quantitative proteomics software package designed for analyzing large mass-spectrometric data sets. It is specifically aimed at high-resolution MS data. Several labeling techniques as well as label-free quantification are supported.

Application is installed in `/opt/MaxQuant_v2.2.0.0/`. GUI version can be run from menu on the top left `Applications` -> `Education` -> `MaxQuant`. CLI version can be run from command line issuing `mono /opt/MaxQuant_v2.2.0.0/bin/MaxQuantCmd.exe`.

## Notes

* Starting GUI application (either from menu or command line) is slow and takes ten or more seconds before something happens, so please, be patient.
* As GUI application is Mono/Windows/.NET based and is running in Linux, HiDPI support is rather broken so increasing font DPI can lead to unusable GUI of the application.
* HiDPI problems can be solved going to Settings Manager > Appearance > Settings > Window Scaling and select 2, but it does not work for mono/wine apps.
