For more information about this image and its history, please see [the relevant manifest file (`library/photon`)](https://github.com/docker-library/official-images/blob/master/library/photon). This image is updated via [pull requests to the `docker-library/official-images` GitHub repo](https://github.com/docker-library/official-images/pulls?q=label%3Alibrary%2Fphoton).

For detailed information about the virtual/transfer sizes and individual layers of each of the above supported tags, please see [the `photon/tag-details.md` file](https://github.com/docker-library/docs/blob/master/photon/tag-details.md) in [the `docker-library/docs` GitHub repo](https://github.com/docker-library/docs).

# VMware Photon OS

Photon OS is a technology preview of a minimal Linux container host. It is designed to have a small footprint and boot extremely quickly on VMware platforms. Photon OS is intended to invite collaboration around running containerized applications in a virtualized environment.

Photon contains `tdnf`, a new, open-source, yum-compatible package manager that will help make the system as small as possible, but preserve the robust yum package management capabilities.

See the [FAQ](http://vmware.github.io/photon/assets/files/photon_faqs.pdf) for more information.

## How to use these images

Photon OS images are intended for use in the **FROM** field of an application's `Dockerfile`. For example, to use VMware Photon 1.0RC as the base of an image, specify `FROM photon:1.0RC`.

## Support

Photon OS is released as open source software and comes with no commercial support.

But since we want to ensure success and recognize that Photon OS™ consumers might fall into a range of roles - from developers that are steeped in the conventions of open-source to customers that are more accustomed to VMware commercial offerings, we offer several methods of engaging with the Photon OS team and community.

For our developer community, feel free to join our Google groups at [vmware-photon-os-dev](https://groups.google.com/forum/#%21forum/vmware-photon-dev)

For more general user questions, visit the Photon OS user forum in our [Photon OS VMware Community](http://communities.vmware.com/community/vmtn/devops/project-photon).

# License

View [license information](https://github.com/vmware/photon/blob/master/LICENSE) for the software contained in this image.
