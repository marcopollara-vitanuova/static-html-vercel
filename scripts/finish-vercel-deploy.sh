#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> Verifica login Vercel"
vercel whoami

echo "==> Collegamento progetto"
vercel link --yes

echo "==> Preview deploy"
vercel deploy --yes

echo "==> Collegamento GitHub (deploy automatici su push)"
vercel git connect --yes

echo "==> Deploy production (conferma richiesta)"
read -r -p "Deploy in production? [y/N] " ans
if [[ "${ans,,}" == "y" || "${ans,,}" == "yes" ]]; then
  vercel --prod --yes
fi

echo "==> Ultimi deployment"
vercel ls
