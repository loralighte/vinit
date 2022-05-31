#!/usr/bin/env -S v run
import os

if os.args[1] == "install"{
	// Must be SUDO to install
	os.execute_or_exit("v vinit.v")
	os.execute_or_exit("mv ./vinit /usr/bin/vinit")
}