# CI/CD Setup Guide — K-Rehab

## Overview

| Branch | Flavor | Firebase App |
|---|---|---|
| `development` | development (`com.amr.krehab.dev`) | Dev Firebase App |
| `main` | production (`com.amr.krehab`) | Prod Firebase App |

---

## Required GitHub Secrets

Go to: **GitHub Repo → Settings → Secrets and variables → Actions → New repository secret**

| Secret Name | Value |
|---|---|
| `DEV_FIREBASE_APP_ID` | `1:966938704373:android:0e461be786869c4704c8bc` |
| `PROD_FIREBASE_APP_ID` | `1:966938704373:android:fe1ae8146174cf7704c8bc` |
| `FIREBASE_SERVICE_CREDENTIALS` | JSON content of Firebase Service Account (see below) |
| `SUPABASE_URL` | Your Supabase project URL |
| `SUPABASE_ANON_KEY` | Your Supabase anon key |
| `GEMINI_API_KEY` | Your Gemini API key |
| `AUTH_CALLBACK_URL` | Your auth callback URL |

---

## How to Get FIREBASE_SERVICE_CREDENTIALS

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Select project: **krehab-a4be7**
3. Navigate to: **IAM & Admin → Service Accounts**
4. Click **Create Service Account**
   - Name: `github-actions-distributor`
   - Role: **Firebase App Distribution Admin**
4. FIREBASE_TOKEN **insted now**
5. After creating, click the account → **Keys tab → Add Key → JSON**
6. Copy the **entire JSON file content** and paste it as the `FIREBASE_SERVICE_CREDENTIALS` secret

---

## How to Add Testers in Firebase

1. Go to [Firebase Console](https://console.firebase.google.com) → **App Distribution**
2. Select your app (Dev or Prod)
3. Go to **Testers & Groups** tab
4. Create groups:
   - `internal-testers` → for development builds
   - `qa-testers` → for production builds
5. Add testers' emails to each group

---

## Workflow Triggers

```
push to development  →  builds dev APK  →  sends to internal-testers group
push to main         →  builds prod APK →  sends to qa-testers group
```
