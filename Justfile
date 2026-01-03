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

# Clean build folders
clean:
    qmk clean

# Build the default left hand target
make-left:
    qmk compile -kb {{keyboard}} -km left

# Build the liatris enhanced left hand target
make-left-liatris:
    qmk compile -kb {{keyboard}} -km left_liatris

# Build compile_commands.json compatible with most complete target
workon:
    qmk compile -kb {{keyboard}} -km left_liatris --compiledb

[private]
check-device:
    #!/usr/bin/env sh
    if [ -e "$DEVICE" ]; then
        echo ""
    else
        echo "Device is not connected."
        exit 1
    fi

# Install the firmware. Check the code for overridable values
@install: check-device make
    echo "Installing firmware: $FIRMWARE"
    mkdir -p .drive
    echo "Root password required to mount device."
    sudo mount $DEVICE .drive -o umask=000
    cp $FIRMWARE .drive
    sudo umount .drive
    rm -r .drive
