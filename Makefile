USER = stdang

KEYBOARDS = klein cnano
PATH_klein = klein
PATH_cnano = charybdis

all: $(KEYBOARDS)

.PHONY: $(KEYBOARDS)
$(KEYBOARDS):

	# cleanup old symlinks
	#for f in $(KEYBOARDS); do rm -rf ~/qmk_firmware/keyboards/$(PATH_$@); done
	#rm -rf ~/qmk_firmware/users/$(USER)

	# add new symlinks
	#ln -s $(shell pwd)/user ~/qmk_firmware/users/$(USER)
	#ln -s $(shell pwd)/$@ ~/qmk_firmware/keyboards/$(PATH_$@)

	# run lint check
	#cd ~/qmk_firmware; 

	# run build
	qmk flash -kb $(PATH_$@)/kb2040 -km default -e CONVERT_TO=promicro_rp2040

	# cleanup symlinks
	# for f in $(KEYBOARDS); do rm -rf ~/qmk_firmware/keyboards/$(PATH_$@); done
	# rm -rf ~/qmk_firmware/users/$(USER)

clean:
	rm -rf obj_*
	rm -f *.elf
	rm -f *.map
	rm -f *.hex
