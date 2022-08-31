# Install instructions

## Prep SD card

Setup SD card using the Raspberry Pi imager. Choose `Respberry Pi OS Lite` and setup some settings.

- hostname: `nixie`
- wifi
- etc

## SSH

Copy your local key to the device: `ssh-copy-id pi@nixie.local`
Connect: `ssh pi@nixie.local`

## Enable I2C and SPI

```
sudo raspi-config
# Interface Options -> SPI
# Interface Options -> I2C
```

## Install needed software

```
cd
sudo apt-get update && sudo apt-get install --yes git vim
```

## Install wiringPi

```
cd
git clone https://github.com/WiringPi/WiringPi.git
cd WiringPi
./build
```

## Install and run nixie

This is my private nixie code and shows a simple clock.

```
cd
git clone https://github.com/bglnelissen/nixie.git
cd nixie
make
mkdir ~/bin
cp nixie ~/bin/nixie
chmod 755 ~/bin/nixie
~/bin/nixie
```

## Create service to start at boot

```
sudo vim /etc/systemd/system/nixie.service
```

```
[Unit]
After=network.target
StartLimitIntervalSec=0

[Service]
Restart=always
RestartSec=2
ExecStart=/home/bas/bin/nixie
User=pi

[Install]
WantedBy=multi-user.target
```

Start me up

```
sudo systemctl enable nixie.service
sudo systemctl start nixie.service
sudo systemctl stop nixie.service
sudo systemctl restart nixie.service
sudo systemctl daemon-reload

# log and debug:
journalctl -u nixie.service
```
