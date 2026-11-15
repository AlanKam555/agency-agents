# Start here — Singapore Maid Agency Kit

**Who this is for:** Any **licensed employment agency (EA)** in Singapore that places migrant domestic workers (MDWs / helpers).

**Cost:** Free under the MIT licence. Fork it, copy it, use it in your branch — no vendor lock-in.

**Not legal advice.** Always verify fees, insurance, advertising, and Work Permit rules on [mom.gov.sg](https://www.mom.gov.sg/).

---

## Pick your path (3 minutes)

| Your situation | Do this |
|----------------|---------|
| You only use **ChatGPT / Claude / Gemini** in a browser | → [Path A](#path-a--chat-apps-no-install) |
| You use **Cursor** or **Claude Code** | → [Path B](#path-b--one-command-install) |
| You want **forms & SOPs** even without AI | → [Path C](#path-c--toolkit-no-ai-required) |

Then read the [operating loop](#daily-operating-loop) once.

---

## Path A — Chat apps (no install)

1. Open [CHAT-PROMPTS.md](CHAT-PROMPTS.md).
2. Copy the **system prompt** for the job (e.g. Matching or Ad Compliance).
3. Paste into a new Custom GPT / Claude Project / Gemini Gem, **or** paste at the top of a new chat.
4. Send the **activation message** under that prompt with your real case details.

Tip: create one chat/project per desk (Sales, Matching, Compliance, Marketing) so staff do not mix contexts.

---

## Path B — One-command install

From this repo root:

```bash
# Install ONLY Singapore Maid Agency agents (recommended for EAs)
./scripts/install-singapore-maid-agency.sh

# Or target one tool explicitly
./scripts/install-singapore-maid-agency.sh --tool cursor
./scripts/install-singapore-maid-agency.sh --tool claude-code
```

What it does:
- Converts SG agents for your tool
- Installs them into Cursor rules / Claude Code agents / etc.
- Skips the rest of The Agency (engineering, game-dev, …) so consultants are not flooded

After install, activate with:

```
Activate MDW Matching Consultant.

Employer needs: elderly care, HDB, Mandarin preferred, within 3 weeks.
Produce Needs Brief + shortlist of 3 with scorecards.
```

Full roster: [README.md](README.md).

---

## Path C — Toolkit (no AI required)

Print or copy these into your Google Drive / Notion / WhatsApp templates:

| Template | Use |
|----------|-----|
| [toolkit/employer-needs-brief.md](toolkit/employer-needs-brief.md) | Intake before biodata |
| [toolkit/match-scorecard.md](toolkit/match-scorecard.md) | Score each shortlisted helper |
| [toolkit/lead-qualification.md](toolkit/lead-qualification.md) | WhatsApp / form fields |
| [toolkit/ad-compliance-checklist.md](toolkit/ad-compliance-checklist.md) | Before boosting any ad |
| [toolkit/day7-checkin.md](toolkit/day7-checkin.md) | Settling call script |

Playbooks: [matching](playbook-matching.md) · [marketing](playbook-marketing.md).

---

## Daily operating loop

```
Marketing (compliant ads) → Sales qualify → Matching + Interview
→ MOM Compliance → Placement → Support check-ins
→ Retention learning → better ads & scorecards
```

If you do only **two** things this week:
1. Run every public ad through **MOM Ad Compliance Reviewer** (or the checklist).
2. Stop sending biodata before a completed **Employer Needs Brief**.

---

## Multi-branch / multi-agency use

- Each EA can fork this repo or copy `singapore-maid-agency/` into their own Drive.
- Put your **EA full name + licence number** in ad footers and landers (MOM requirement).
- Customise salary bands and package names — keep MOM compliance rules intact.
- Do **not** remove dignity / no-fee-bait advertising rules to “compete on cheap”.

---

## Get help in-repo

| Need | Link |
|------|------|
| Agent roster | [README.md](README.md) |
| Copy-paste prompts | [CHAT-PROMPTS.md](CHAT-PROMPTS.md) |
| Matching + marketing workflow | [../examples/workflow-singapore-maid-matching-marketing.md](../examples/workflow-singapore-maid-matching-marketing.md) |
| Placement ops workflow | [../examples/workflow-singapore-maid-agency-placement.md](../examples/workflow-singapore-maid-agency-placement.md) |
| MOM (official) | https://www.mom.gov.sg/employment-agencies |
