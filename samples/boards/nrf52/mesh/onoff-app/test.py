#!/usr/bin/python2
from jumper.vlab import Vlab

# set up the device simulation
v = Vlab(working_directory=".", print_uart=True, platform="nrf52832")
v.load("build/zephyr/zephyr.bin")

v.run_for_ms(500)
v.BUTTON1.on()
v.run_for_ms(500)
v.BUTTON1.off()
v.run_for_ms(500)
v.stop()