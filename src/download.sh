#!/bin/bash

pushd /download
youtube-dl --write-info-json "$*"
popd
