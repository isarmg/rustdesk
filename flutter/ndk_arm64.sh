#!/usr/bin/env bash
cargo ndk --platform 29 --target aarch64-linux-android build --locked --release --features flutter,mediacodec --lib
