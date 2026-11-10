# XIVCommands

XIVCommands adds Final Fantasy XIV-style commands to World of Warcraft: Forever.
The addon targets interface version `16001` and requires no libraries.

## Install

1. Copy the `XIVCommands` folder into your Forever client's `Interface/AddOns` folder.
2. Restart the client.
3. Enable XIVCommands in the AddOns list at character selection.

The installed files must have this structure:

```text
Interface/AddOns/XIVCommands/XIVCommands.toc
Interface/AddOns/XIVCommands/XIVCommands.lua
```

## Commands

| Command | Action |
| --- | --- |
| `/leave` | Leave your active party or raid. |
| `/leave <channel>` | Leave a chat channel through WoW's existing handler. |
| `/bgm` | Toggle music without changing the stored volume. |
| `/bgm 50` | Set music volume to 50% and enable music. |
| `/bgm 0` | Set music volume to zero and disable music. |
| `/bgm 100` | Set music volume to 100% and enable music. |

`/bgm` accepts whole numbers from 0 to 100. Invalid input leaves your audio settings unchanged.
Music volume remains subject to your master volume and sound settings.
WoW stores the music settings, so the addon needs no saved variables.

The addon extends WoW's existing `LEAVE` handler. Its other aliases also leave your group when used without arguments.
WoW handles group departure, including any applicable instance penalties or confirmation dialogs.

## In-game check

1. Run `/bgm 50` and inspect the music slider in the audio settings.
2. Run `/bgm` twice and listen for music to stop and resume.
3. Run `/bgm 0`, then `/bgm 50`, and listen for music to resume.
4. Run `/bgm 101` and make sure that the audio settings stay unchanged.
5. Join a disposable party and run `/leave`.
6. Join a temporary chat channel and run `/leave <channel>`.

Client loading, audio playback, and group departure still require an in-game check.

## References

- [FFXIV `/bgm` command](https://na.finalfantasyxiv.com/lodestone/playguide/db/text_command/85db360715b/)
- [Blizzard slash command source](https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_ChatFrameBase/Shared/SlashCommands.lua)
- [Blizzard audio settings source](https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_SettingsDefinitions_Shared/Audio.lua)
- [Forever addon manifest example](https://github.com/Somora/EasyAutoLootEnabler)
