# Prerequisiti una tantum — Deploy HTML su Vercel + GitHub

Verifica eseguita il 2026-05-19.

| Prerequisito | Stato | Azione se mancante |
|--------------|-------|-------------------|
| CLI Vercel | OK (`vercel` 50.15.1) | `npm i -g vercel` |
| Login Vercel | **Da fare** | `vercel login` (apre il browser) |
| GitHub CLI | OK (`gh` autenticato) | `gh auth login` |
| App Vercel for GitHub | Da verificare in dashboard | [github.com/apps/vercel](https://github.com/apps/vercel) |
| Token Vercel (opzionale) | Non impostato | Dashboard → Settings → Tokens → `export VERCEL_TOKEN=...` |

## Comandi di verifica rapida

```bash
vercel --version
vercel whoami
gh auth status
```

## Dopo il login Vercel

Dalla root del progetto (`static-html-vercel`):

```bash
cd /Users/m/static-html-vercel
vercel link --yes
vercel deploy --yes
vercel git connect --yes
vercel --prod --yes   # solo dopo conferma esplicita
```

Oppure invoca l'agente con `/deploy-static-html-vercel` o incolla il prompt da `~/.cursor/snippets/deploy-static-html-vercel.prompt.md`.
