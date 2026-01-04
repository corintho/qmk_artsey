keyboard := "artsey_io"

set dotenv-load

[private]
default:
    @just --list

# Lint code with QMK custom linter
[group('build')]
lint:
    qmk lint -kb {{keyboard}}

# Use a watcher to run linter when any keyboard definition change
[group('build')]
lint-watch:
    watchexec -w keyboards/{{keyboard}} just lint

# Build all targets
[group('build')]
make: make-left make-left-liatris

# Clean build folders
[group('build')]
clean:
    qmk clean

# Build the default left hand target
[group('build')]
make-left:
    qmk compile -kb {{keyboard}} -km left

# Build the liatris enhanced left hand target
[group('build')]
make-left-liatris:
    qmk compile -kb {{keyboard}} -km left_liatris

# Build compile_commands.json compatible with most complete target
[group('develop')]
workon:
    qmk compile -kb {{keyboard}} -km left_liatris --compiledb

# Check if the device is connected. Fails with an error if not
[private]
check-device:
    #!/usr/bin/env sh
    if [ -e "$DEVICE" ]; then
        echo ""
    else
        echo "Device is not connected."
        exit 1
    fi

# Install the firmware. Check the .env for overridable values
[group('run')]
@install: check-device make
    echo "Installing firmware: $FIRMWARE"
    mkdir -p .drive
    echo "Root password required to mount device."
    sudo mount $DEVICE .drive -o umask=000
    cp $FIRMWARE .drive
    sudo umount .drive
    rm -r .drive
