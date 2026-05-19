# Dare accesso all'agente Cursor (autonomia completa)

Per deploy e gestione Vercel **senza** che tu ripeta i passaggi, servono **due canali** (GitHub è già ok su questa macchina).

## 1. CLI Vercel (obbligatoria per `vercel link`, `deploy`, `git connect`)

Scegli **una** opzione:

### A) Login interattivo (consigliato, una tantum)

Nel terminale integrato di Cursor:

```bash
vercel login
```

Completa il browser/device code. Le credenziali restano in `~/.local/share/com.vercel.cli/` e valgono per tutti i progetti.

### B) Token in ambiente (ideale per agenti senza browser)

1. Crea un token: [vercel.com/account/tokens](https://vercel.com/account/tokens) (scope: deploy).
2. Aggiungi a `~/.zshrc` (non committare mai il token):

```bash
export VERCEL_TOKEN="vercel_xxxxxxxx"
```

3. Riapri il terminale in Cursor oppure: `source ~/.zshrc`
4. Verifica: `vercel whoami`

**Non incollare il token in chat** — solo in file locali o variabili d'ambiente.

### C) Solo per questo progetto (gitignored)

Crea `/Users/m/static-html-vercel/.env.local`:

```
VERCEL_TOKEN=vercel_xxxxxxxx
```

Poi prima dei comandi: `set -a && source .env.local && set +a`

Aggiungi `.env.local` a `.gitignore` se non c'è già.

---

## 2. Plugin Vercel MCP in Cursor

Già autenticato con `mcp_auth` (strumenti: `list_projects`, `list_deployments`, log, documentazione).

Il tool `deploy_to_vercel` **non** sostituisce la CLI: dopo il login/token usa comunque:

```bash
cd /Users/m/static-html-vercel
./scripts/finish-vercel-deploy.sh
```

---

## 3. GitHub (già configurato)

- `gh auth status` → account attivo
- Repo: https://github.com/marcopollara-vitanuova/static-html-vercel
- App [Vercel for GitHub](https://github.com/apps/vercel) installata sul tuo account/org (necessaria per `vercel git connect`)

---

## 4. Cosa dire all'agente dopo il setup

```
Ho completato vercel login (o VERCEL_TOKEN è in ~/.zshrc).
Completa il deploy su Vercel per static-html-vercel: link, deploy, git connect, verifica URL.
Puoi operare in autonomia senza chiedermi conferme intermedie; chiedi solo prima di vercel --prod.
```

Oppure: `/deploy-static-html-vercel`

---

## Verifica rapida (tu o l'agente)

```bash
vercel whoami
gh auth status
cd /Users/m/static-html-vercel && git remote -v
```

Tutti e tre OK → l'agente può chiudere il deploy da solo.
