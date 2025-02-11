@echo off

set perl-path="perl"

if exist "tools\win\perl.exe" (
	echo Found perl override, using that for compilation.
	set perl-path="tools\win\perl.exe"
)

:check
if exist "rh-jpn.gba" (
	goto tools
) else (
	goto nofile
)

:tools
mkdir build
copy "rh-jpn.gba" "build\rh-atlus.gba"

echo -- Compile Text --

%perl-path% "tools\abcde\abcde.pl" -cm abcde::Atlas "build\rh-atlus.gba" "src\script.txt"

echo -- Compile Bitmap --

setlocal EnableDelayedExpansion

for /f "skip=1 delims=" %%f in (for_script/bitmaps_to_compile.md) do (
  set "file=%%f"
  tools\win\4bmpp.exe -p !file!
)

endlocal

echo -- Compile Graphics --

setlocal EnableDelayedExpansion

for /f "skip=1 delims=" %%f in (for_script/graphics_to_compile.md) do (
  set "file=%%f"
  tools\win\DSDecmp.exe -c lz10 !file!.bin !file!
)

endlocal

echo -- Compile Tile Maps ---

setlocal EnableDelayedExpansion

for /f "skip=1 delims=" %%f in (for_script/tilemaps_to_compile.md) do (
  set "file=%%f"
  tools\win\rhcomp.exe !file!
)

endlocal

echo -- Compile Audio (Unimplemented, skipping) --

REM ffmpeg -y -i "sfx/DrumLessons/one.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/one.pcm" -loglevel error
REM ffmpeg -y -i "sfx/DrumLessons/two.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/two.pcm" -loglevel error
REM ffmpeg -y -i "sfx/DrumLessons/three.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/DrumLessons/three.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/6FCCE8_remix5_music_0.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/6FCCE8_remix5_music_0.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/703D60_remix5_music_1.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/703D60_remix5_music_1.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/70A898_remix5_music_2.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/70A898_remix5_music_2.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/716DA4_remix5_music_3.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/716DA4_remix5_music_3.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/7251F8_remix5_music_4.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/7251F8_remix5_music_4.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/730FCC_remix5_music_5.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/730FCC_remix5_music_5.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/737894_remix5_music_6.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/737894_remix5_music_6.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/73E77C_remix5_music_7.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/73E77C_remix5_music_7.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/744E60_remix5_music_8.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/744E60_remix5_music_8.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/74A9A4_remix5_music_9.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/74A9A4_remix5_music_9.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/751808_remix5_music_10.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/751808_remix5_music_10.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/75870C_remix5_music_11.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/75870C_remix5_music_11.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/75E670_remix5_music_12.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/75E670_remix5_music_12.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/765294_remix5_music_13.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/765294_remix5_music_13.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/76BE38_remix5_music_14.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/76BE38_remix5_music_14.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/772F3C_remix5_music_15.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/772F3C_remix5_music_15.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/774F60_remix5_music_16.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/774F60_remix5_music_16.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/7770BC_remix5_music_17.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/7770BC_remix5_music_17.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/778BB4_remix5_music_18.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/778BB4_remix5_music_18.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/77FE60_remix5_music_19.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/77FE60_remix5_music_19.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/784644_remix5_music_20.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/784644_remix5_music_20.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/78C590_remix5_music_21.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/78C590_remix5_music_21.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix5/7912A0_remix5_music_22.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix5/7912A0_remix5_music_22.pcm" -loglevel error

REM ffmpeg.exe -y -i "sfx/Remix3/64b0b8_remix3_0.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/64b0b8_remix3_0.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/654188_remix3_1.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/654188_remix3_1.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/65783c_remix3_2.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/65783c_remix3_2.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/65c083_remix3_3.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/65c083_remix3_3.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/661bb7_remix3_4.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/661bb7_remix3_4.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/66699c_remix3_5.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/66699c_remix3_5.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/66fc92_remix3_6.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/66fc92_remix3_6.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/67b7b9_remix3_7.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/67b7b9_remix3_7.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/67ce68_remix3_8.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/67ce68_remix3_8.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/685fb1_remix3_9.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/685fb1_remix3_9.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/68b861_remix3_10.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/68b861_remix3_10.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/690e26_remix3_11.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/690e26_remix3_11.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/692868_remix3_12.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/692868_remix3_12.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/69858b_remix3_13.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/69858b_remix3_13.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/69ad4b_remix3_14.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/69ad4b_remix3_14.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/6a10ec_remix3_15.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6a10ec_remix3_15.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/6a90fe_remix3_16.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6a90fe_remix3_16.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/6b0af1_remix3_17.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6b0af1_remix3_17.pcm" -loglevel error
REM ffmpeg.exe -y -i "sfx/Remix3/6c3a59_remix3_18.wav" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/Remix3/6c3a59_remix3_18.pcm" -loglevel error

REM Rhythm Tweezers (Tempo Up)
REM ffmpeg -y -i "sfx/SpaceDance/voices/and1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/and1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/and2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/and2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/down1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/down1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/down2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/down2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/lets1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/lets1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/lets2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/lets2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pa1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pa1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pa2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pa2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pose1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pose1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/pose2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/pose2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/punch1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/punch1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/punch2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/punch2.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/sit1.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/sit1.pcm" -loglevel error
REM ffmpeg -y -i "sfx/SpaceDance/voices/sit2.ogg" -acodec pcm_s8 -ar 13379 -ac 1 -f s8 "sfx/SpaceDance/voices/sit2.pcm" -loglevel error

echo -- Compile Code --

tools\armips.exe src/main.asm
if %ERRORLEVEL% NEQ 0 (
    goto fail
)
color 0f

echo Building complete! (Press any key to recompile!)
del "build\rh-atlus.gba"

pause > nul

clear
goto check

:nofile
echo Couldn't find a Rhythm Tengoku ROM, please place one in the root of the project to continue.
pause
goto check

:fail
color 4f

echo Building failed! (Press any key to recompile!)
del "build\rh-atlus.gba"

pause > nul

color 0f
clear
goto check
