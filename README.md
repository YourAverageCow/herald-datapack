<p align="center">
  <img src=".github/banner.png" alt="Herald — server announcements for Minecraft" width="100%">
</p>

<p align="center">
  <img alt="Minecraft Java 26.3" src="https://img.shields.io/badge/Minecraft_Java-26.3-62B47A?style=for-the-badge">
  <img alt="Datapack" src="https://img.shields.io/badge/type-datapack-B22234?style=for-the-badge">
  <img alt="No mods required" src="https://img.shields.io/badge/mods-none_required-F7C43A?style=for-the-badge">
  <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-2B2F5A?style=for-the-badge">
</p>

**Herald** lets server admins send an announcement to everyone at once, and makes sure nobody misses it.
Players who are online see it right away. Players who are offline see it the next time they log in.
Every announcement is also kept on an **Announcement Board** that any player can open from the pause menu.

## ✦ Features

- **Reaches offline players.** About 1–2 seconds after logging in (after the join messages), each player sees the announcements they missed, up to the 5 most recent, oldest first.
- **Looks the part.** Each announcement shows as a framed gold chat card with the sender and in-game day, plus an on-screen title and a bell chime.
- **Announcement Board.** A real in-game menu window listing every announcement ever sent, newest first, 5 per page.
- **Send from anywhere:** in-game, the server console, RCON or a command block.
- **Rich text.** Colours, bold, mixed styles and quotes all work through `send_rich`.
- **Light on the server.** Join checks run once per second. The board is only built when someone opens it.
- **Vanilla only.** No mods, no plugins, and clients don't need anything installed.

## 📦 Install

1. Download `herald-vX.Y.Z.zip` from the [latest release](../../releases/latest).
2. Drop the zip into `<world>/datapacks/`.
3. Run `/reload` (or restart the server).

## 📣 Sending announcements (admins)

```mcfunction
/function herald:send {text:"Server restarts at 6pm — don't be late!"}
/function herald:send_rich {msg:{text:"Build contest tonight!",color:"gold",bold:true}}
/function herald:send_rich {msg:["",{text:"PvP arena ",color:"red"},{text:"opens at 8pm",color:"white"}]}
```

From the **server console or RCON**, leave off the leading `/`. Those messages are signed **Server**.

| Command | What it does |
|---|---|
| `/function herald:send {text:"…"}` | Send a plain announcement |
| `/function herald:send_rich {msg:<text component>}` | Send a formatted announcement |
| `/function herald:delete {id:7}` | Remove one announcement (ids are shown on the board) |
| `/function herald:list` | Show the login queue (last 5) in chat |
| `/function herald:clear` | Wipe **all** announcements |
| `/function herald:help` | Clickable cheat-sheet in chat |
| `/function herald:uninstall` | Remove all Herald data, then `/datapack disable` the pack |

> **Tip:** plain `send` text can contain apostrophes but not double quotes (`"`). For quotes, use `send_rich`: `{msg:{text:"Say \"hi\"!"}}`

## 📜 The Announcement Board (every player)

No op needed. Players can open it from any of these:

- **Esc → Announcements → Open the board** (the button appears in the pause menu)
- the **Quick Actions** key (set it in *Controls → Key Binds*)
- clicking **[All announcements]** under any announcement in chat
- typing `/trigger announce`, or `/trigger announce set 3` to jump to page 3

## ⚙️ How it works

| Piece | Details |
|---|---|
| Join detection | A 1-second scheduled loop checks the `leave_game` statistic and a "known player" tag. There's no heavy per-tick work. |
| Seen tracking | Each player's `ann.id` score is the ID of the last announcement they saw. |
| Storage | `herald:data` holds `history` (the last 5, used for login) and `archive` (everything, used by the board). |
| Board | A `dialog` built on demand from the archive. A single score-filtered selector per tick keeps page turns instant. |
| Sender name | Resolved once at send time and stored, so it still shows after the sender goes offline. |

**Compatibility:** built and tested on Minecraft Java **26.3**. `pack.mcmeta` declares a format range, so it loads on 26.x releases that keep the same command syntax.
**Upgrading from "Announce" v1/v2:** stored announcements are migrated automatically on first load.

## 📄 License

[MIT](LICENSE) © 2026 YourAverageCow
