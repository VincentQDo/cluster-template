#!/bin/bash
set -x

sudo systemctl enable munge
sudo systemctl start munge
