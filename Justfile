keyboard := "artsey_io"

set dotenv-load

[private]
default:
    @just --list

# Lint code with QMK custom linter
lint:
    qmk lint -kb {{keyboard}}

# Use a watcher to run linter when any keyboard definition change
lint-watch:
    watchexec -w keyboards/{{keyboard}} just lint

# Build all targets
make: make-left make-left-liatris

# Build the default left hand target
make-left:
    qmk compile -kb {{keyboard}} -km left

# Build the liatris enhanced left hand target
make-left-liatris:
    qmk compile -kb {{keyboard}} -km left_liatris

# Build compile_commands.json compatible with basic target
workon-left:
    bear -- qmk compile -kb {{keyboard}} -km left --clean

# Build compile_commands.json compatible with liatris target
workon-left-liatris:
    bear -- qmk compile -kb {{keyboard}} -km left_liatris --clean

# Install the firmware. Check the code for overridable values
install: make
    #!/usr/bin/env sh
    if [ -e "$DEVICE" ]; then
        echo "Root password required to mount device."
    else
        echo "Device is not connected."
        exit 1
    fi
    mkdir -p .drive
    sudo mount $DEVICE .drive -o umask=000
    cp $FIRMWARE .drive
    sudo umount .drive
    rm -r .drive
