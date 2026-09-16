# tk5-docker

This is a backup of a stock TK5 system, which runs an emulated MVS 3.8J
mainframe. It's packaged to run in a Docker container, using the last
released version of TK5.

All credit for TK5 itself goes to the MVS Turnkey community. I did not write
TK5, MVS, or any of the software it bundles — I only wrote the Dockerfile
and Compose setup to make it convenient to run. I'm mirroring the
distribution files here because I wanted backup copies for my own use.

## What's mine vs. not

- **Mine:** `Dockerfile`, `docker-compose.yml`, any scripts in this repo
- **Not mine:** anything under the TK5 distribution itself (Hercules,
  MVS 3.8J, JCL, utilities, docs) — that's the Turnkey team's work,
  mirrored as-is

## Usage

All you should have to do is clone the repository and run `sudo docker compose up`. 
The first time, don't run it with `-d` and watch the log to make sure it boots correctly.
Like in the manual, if you see the TK5 logo in the log, it booted successfully.
See below for what the end of a successful boot looks like:
```
dylan-tk5-1  | HHC02260I Script 5: begin processing file local_scripts/08
dylan-tk5-1  | HHC02264I Script 5: file local_scripts/08 processing ended
dylan-tk5-1  | HHC01603I script local_scripts/09
dylan-tk5-1  | HHC02260I Script 5: begin processing file local_scripts/09
dylan-tk5-1  | HHC02264I Script 5: file local_scripts/09 processing ended
dylan-tk5-1  | HHC01603I script local_scripts/10
dylan-tk5-1  | HHC02260I Script 5: begin processing file local_scripts/10
dylan-tk5-1  | HHC02264I Script 5: file local_scripts/10 processing ended
dylan-tk5-1  | HHC02264I Script 5: file scripts/local.rc processing ended
dylan-tk5-1  | HHC01603I *
dylan-tk5-1  | HHC01603I *                           ************   ****  *****          ||
dylan-tk5-1  | HHC01603I *                           **   **   **    **    **           |||
dylan-tk5-1  | HHC01603I *                           **   **   **    **   **           ||||
dylan-tk5-1  | HHC01603I *                                **         **  **           || ||
dylan-tk5-1  | HHC01603I *        |l      _,,,---,,_      **         ** **           ||  ||
dylan-tk5-1  | HHC01603I * ZZZzz /,'.-'`'    -.  ;-;;,    **         ****           ||   ||
dylan-tk5-1  | HHC01603I *      |,4-  ) )-,_. ,( (  ''-'  **         *****         ||    ||
dylan-tk5-1  | HHC01603I *     '---''(_/--'  `-')_)       **         **  **       ||     ||    ||||||||||
dylan-tk5-1  | HHC01603I *                                **         **   **      |||||||||||  Turnkey 5
dylan-tk5-1  | HHC01603I *       The MVS 3.8j             **         **    **            ||
dylan-tk5-1  | HHC01603I *     Tur(n)key System           **         **     **           ||
dylan-tk5-1  | HHC01603I *                              ******      ****     ***       ||||||
dylan-tk5-1  | HHC01603I *
dylan-tk5-1  | HHC01603I *            TK3 created by Volker Bandke       vbandke@bsp-gmbh.com
dylan-tk5-1  | HHC01603I *            TK4- update by Juergen Winkelmann  winkelmann@id.ethz.ch
dylan-tk5-1  | HHC01603I *                     see TK5.CREDITS for complete credits
dylan-tk5-1  | HHC01603I *
dylan-tk5-1  | HHC02264I Script 5: file scripts/tk5.rc processing ended
```



For general operating practices, see the manual. For some good resources, the Moshix youtube channel is pretty good.
[https://www.youtube.com/@moshixmainframechannel](https://www.youtube.com/@moshixmainframechannel)

## License / attribution note

I'm not aware of TK5's original license terms being included with this
distribution; if you know of a license file or terms published,
let me know so I can include or link them properly. This repo exists
for personal backup and convenience — not as a claim of ownership over
any of the mirrored software.
