# MochiAI — Full-stack starter

This project includes:
- Real account registration and login (bcrypt password hashes, signed JWTs).
- SQLite-backed users, personas, and chat history.
- Unlimited personas per account (no app-imposed count limit).
- Custom persona name, personality, description, image, voice, and voice style.
- User display name, bio, and profile picture.
- Dark/pastel theme.
- Live two-way voice via OpenAI Realtime API over WebRTC, with server-minted short-lived client secrets.
- Adult mature-theme preference with an 18+ confirmation; this preference does not override provider safety rules.
- Session-only gallery video background.
- Import conversations from ChatGPT `conversations.json`, common role/content JSON exports, or role-labeled TXT/Markdown/HTML text exports. Imported messages are appended to the selected persona chat (up to 500 messages per import).

## Run locally

1. Install Node.js 20+ (Node 22+ recommended).
2. In this folder, run `npm install`.
3. Copy `.env.example` to `.env`.
4. Add your own OpenAI API key to `.env`, then set a long random `JWT_SECRET`.
5. Run `npm start`.
6. Open http://localhost:3000

Never put the standard OpenAI API key in `public/index.html`, commit `.env`, or expose it to the browser. The browser only receives a short-lived Realtime client secret for voice.

## Notes

- Text replies use `OPENAI_MODEL`; if your account does not have access to the default model, change it to a model available to your project.
- Voice uses `REALTIME_MODEL` and a supported voice from the app's voice picker. Browser microphone permission is required. Production deployments must use HTTPS.
- API usage is billed by the provider and can be rate-limited. "Unlimited" means no message/persona cap is imposed by this app, not free or unlimited provider usage.
- Persona/profile image uploads are stored as data URLs in SQLite. This is simple for a small starter; use object storage and a file-size/type validation pipeline for production.
- NSFW is a mature-tone preference only. It does not disable safety systems or enable illegal, exploitative, or non-consensual content.
- Before public deployment, add email verification, password reset, rate limiting, CSRF/security headers, backups, privacy/retention controls, and a production database/object store. This starter intentionally does not claim to be production-audited.
