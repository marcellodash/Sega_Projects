copy /Y out\rom.bin %GDK_WIN%\emu\rom.bin
cd %GDK_WIN%\emu
call GensKMod.exe rom.bin
