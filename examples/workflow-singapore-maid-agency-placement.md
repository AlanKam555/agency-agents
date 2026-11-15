# Multi-Agent Workflow: Singapore Maid Agency Placement

> End-to-end example: convert a first-time employer enquiry into a compliant MDW placement, then support the first 30 days.

## The Scenario

A dual-income couple in a 4-room HDB needs a helper for a 6-month-old and light housework. They are first-time employers, prefer an English-speaking helper, and want arrival within a month if possible. Budget: market salary + normal levy; agency package flexible if matching quality is high.

## Agent Team

| Agent | Role in this workflow |
|-------|---------------------|
| Agency Sales Closer | Qualify and propose packages |
| Employer Advisor | Cost sheet + EOP + household readiness |
| MDW Matching Consultant | Needs brief + shortlist scorecards |
| MOM Compliance Officer | IPA, bond, insurance, SIP, WP issuance |
| Placement Coordinator | Arrival logistics + handover |
| Employer Support Desk | Day 3/7/30 settling |
| EA Operations Manager | File quality spot-check |

## The Workflow

### Day 0 — Enquiry

**Activate Agency Sales Closer**

```
Activate Agency Sales Closer.

Lead via Facebook: first-time employers, 4-room HDB, infant 6 months,
want English-speaking helper, hope to have someone within 1 month.
Language: English. No EOP yet.

Qualify the lead and recommend new vs transfer. Do not dump biodata yet.
Include plain-language note on 6-month service-fee refund rule.
```

### Day 0–1 — Educate

**Activate Employer Advisor**

```
Activate Employer Advisor.

Produce a Total Cost of Hire sheet for a first helper (levy SGD 300 baseline,
flag concession only if they might qualify). Include EOP, SIP, insurance/bond,
WP fees, and remind that insurance/bond cannot be passed to the helper.

Also output a Household Readiness checklist focused on infant care + rest day.
```

### Day 1–3 — Match

**Activate MDW Matching Consultant**

```
Activate MDW Matching Consultant.

Use this employer context: [paste Sales + Advisor outputs]

Create an Employer Needs Brief and shortlist 3 helpers max with Match Scorecards.
Prioritise infant-care experience. Flag any first-time MDW + newborn risk.
```

### Day 3–10 — Compliance filing

**Activate MOM Compliance Officer**

```
Activate MOM Compliance Officer.

Employer chose Helper B (ex-Singapore transfer with infant care).
EOP will be completed this weekend.

Give a Placement Compliance Checklist for a transfer pathway:
IPA steps, insurance/bond if applicable, medicals, safety agreement,
and what must be true before handover.
```

### Arrival week — Logistics

**Activate Placement Coordinator**

```
Activate Placement Coordinator.

IPA approved. Arrival Saturday 15:40 Changi.
Build Arrival-to-Handover Timeline including medical, WP issuance steps,
safety agreement, and Day-1 handover pack. SIP only if MOM requires for this helper’s status — say so explicitly.
```

### Days 3 / 7 / 30 — Support

**Activate Employer Support Desk**

```
Activate Employer Support Desk.

Placement handed over Monday.
Run Day-3 and Day-7 check-in scripts for infant-care settling.
Employer complains helper is “on phone too much while baby naps.”
Propose a fair house-rule clarification before any replacement talk.
```

### Weekly — Ops quality

**Activate EA Operations Manager**

```
Activate EA Operations Manager.

Spot-check this placement file against the internal audit list
(match brief, fees vs contract, insurance evidence, safety agreement, check-ins).
List any gaps that could become MOM complaint risk.
```

## If the match fails at month 2

**Activate Replacement & Refund Specialist**

```
Activate Replacement & Refund Specialist.

Employment started [date]. Employer notified us before cancellation.
Reason: infant care confidence still low after training plan.

Open a Termination Case File, screen Rule 13A refund eligibility,
and present Option A replacement vs Option B ≥50% service-fee refund
with the 14-working-day clock explained.
```

## Success criteria for this workflow

- Employer signed with eyes open on levy + insurance + refund rule  
- Match brief exists before IPA  
- Handover includes safety agreement + support WhatsApp  
- Day-7 check-in logged  
- If early exit: documented eligibility screen before money moves  
