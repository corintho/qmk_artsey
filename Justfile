keyboard := "artsey_io"
device := "/dev/sdg1"
device_id := "2e8a:0003"

default:
    @just --list

lint:
    qmk lint -kb {{keyboard}}

lint-watch:
    watchexec -w keyboards/{{keyboard}} just lint

make: make-left

make-left:
    qmk compile -kb artsey_io -km left

install: make
    #!/usr/bin/env sh
    if [ -e {{device}} ]; then
        echo "Root password required to mount device."
    else
        echo "Device is not connected."
        exit 1
    fi
    mkdir -p .drive
    sudo mount {{device}} .drive -o umask=000
    cp artsey_io_left.uf2 .drive
    sudo umount .drive
    rm -r .drive
