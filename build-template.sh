#/bin/bash

(cd initrd && find . | cpio -o -H newc --owner root:root | gzip -9) > template-initrd.gz

