# Changelog

## v2.0.0 — Herald
- Rebranded as **Herald** (`herald:` namespace, new pack icon). Stored announcements from "Announce" migrate automatically.
- **Announcement Board:** a paged in-game menu with every announcement ever sent, available from the pause menu, the Quick Actions key, a chat link or `/trigger announce`.
- `herald:delete {id:N}` removes a single announcement.
- The login catch-up count is now exact, even after a delete.

## v1.0.0
- Broadcast to online players, with catch-up on login for the last 5 missed announcements.
- Framed chat card, title and chime. Send from in-game or the console. `send_rich` for formatted text.
