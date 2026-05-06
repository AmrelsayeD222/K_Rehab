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
| `FIREBASE_TOKEN` | Your Firebase CI token (see below) |
| `SUPABASE_URL` | Your Supabase project URL |
| `SUPABASE_ANON_KEY` | Your Supabase anon key |
| `GEMINI_API_KEY` | Your Gemini API key |
| `AUTH_CALLBACK_URL` | Your auth callback URL |

---

## How to Get FIREBASE_TOKEN

Since you are using a Firebase Token instead of a Service Account:
1. Install the Firebase CLI on your computer if you haven't already: `npm install -g firebase-tools`
2. Open your terminal and run: `firebase login:ci`
3. A browser window will open. Log in with the Google account that has admin access to your Firebase project.
4. After logging in successfully, your terminal will print a token (usually a long alphanumeric string).
5. Copy this token and paste it as the `FIREBASE_TOKEN` secret in GitHub.

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

This project is configured to use **Manual Triggers** (`workflow_dispatch`) to save GitHub Actions minutes and give you full control over when to release.

To trigger a build:
1. Go to your GitHub repository in the browser.
2. Click on the **Actions** tab.
3. On the left sidebar, select either **🧪 Development Distribution** or **🚀 Production Distribution**.
4. Click the **Run workflow** dropdown button on the right.
5. Select the branch (`development` or `main`) and click **Run workflow**.

```
Manual Run (Dev Action)   →  builds dev APK  →  sends to internal-testers group
Manual Run (Prod Action)  →  builds prod APK →  sends to qa-testers group
```
