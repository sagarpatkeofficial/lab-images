source "vmware-iso" "basic-example" {
  # iso_url = "https://releases.ubuntu.com/18.04/ubuntu-18.04.6-server-amd64.iso"
  # iso_checksum = "sha256:6c647b1ab4318e8c560d5748f908e108be654bad1e165f7cf4f3c1fc43995934"
  # iso_url = "https://releases.ubuntu.com/18.04/ubuntu-18.04.6-desktop-amd64.iso"
  # iso_checksum = "sha512:4801ab93a12fc81ce599b4601cda44a07e516a7ff10713c09ce4b93612b34343c290caa1565c86258b4f131473baabdbdd372835724cb1356309a9e6bcc436ab"
  iso_url = "http://cdimage.ubuntu.com/ubuntu/releases/bionic/release/ubuntu-18.04.6-server-amd64.iso"
  iso_checksum = "sha256:f5cbb8104348f0097a8e513b10173a07dbc6684595e331cb06f93f385d0aecf6"
  guest_os_type = "ubuntu64Guest"
  http_directory = "http"
  network = "nat"
  boot_wait = "3s"
  boot_command = [
    "<esc><esc><enter><wait>",
    "/install/vmlinuz noapic ",
    "initrd=/install/initrd.gz ",
    "preseed/url=http://{{.HTTPIP}}:{{.HTTPPort}}/bionic.cfg ",
    "debian-installer=en_US auto locale=en_US kbd-chooser/method=us ",
    "hostname=bionic ",
    "grub-installer/bootdev=/dev/sda<wait> ",
    "fb=false debconf/frontend=noninteractive ",
    "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA ",
    "keyboard-configuration/variant=USA console-setup/ask_detect=false ",
    "-- <enter>"
  ]
  ssh_username = "stack-user"
  ssh_password = "s3cret"
  shutdown_command = "echo 's3cret' | sudo -S shutdown -P now"
  ssh_timeout = "30m"
  vmx_remove_ethernet_interfaces = true
}

build {
  sources = ["sources.vmware-iso.basic-example"]
}
