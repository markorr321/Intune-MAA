# Changelog

## 1.1.0 - 2026-11-12

### Fixed
- Pending requests never loaded in tenants with a large approval history — `Get-PendingMAARequests` asked Graph for every `operationApprovalRequest` in one response, which exceeds Intune's ~15s backend limit once a tenant accumulates a few hundred records (each carries up to ~96KB of `entitySnapshot`/`patchPayload`) and returns `503 DQCancelledOnRequestTimeout`. The request now pages with `$top=50` and a narrow `$select`
- A failed fetch displayed "No requests pending your approval" — the error was written to the host, then immediately erased by the `Clear-Host` in `Show-Header`. Failures now render with the Graph error and a retry prompt, so a service outage can't be mistaken for an empty queue
- Payload details were missing for some requests — the collection endpoint returns `payload` and `patchPayload` as `null` for certain records; selecting a request now fetches the full entity, which returns them populated

### Changed
- Each page is retried up to 3 times with backoff; per-page latency varies enough that a page can succeed and then time out on the next attempt
- Approving or rejecting no longer re-walks every request in the tenant. Actioned requests are removed from the list in place, and `[R]` still forces a refresh

### Notes
- A full fetch takes ~40s for ~500 requests and can't be made meaningfully faster: this endpoint ignores `$skip` and `$orderby`, applies `$filter` after paging, and supports neither `/delta` nor `$apply`
- Growth is bounded — Intune retains each request for 30 days after its last status change, so the record count tracks change-request volume rather than elapsed time

## 1.0.9 - 2026-09-02

### Fixed
- Pressing `[S]` or `[N]` on an Assign-type request (DeviceHealthScript, Platform Script) opened the `.txt` details file instead of the actual `.ps1` script — `Get-ScriptContentFromPayload` now applies the same `entitySnapshot` fallback introduced in 1.0.8 for `Get-PayloadSummary`

## 1.0.8 - 2026-09-01

### Fixed
- "Unable to parse payload" shown in Details for Assign operations (Apps, Configuration Policies, and other workload types) — the Graph API returns a .NET type name string in `payload` for these requests; the fix falls back to `entitySnapshot`, which carries the full resource details
- Whitespace-only payload strings no longer slip past the null check

## 1.0.7 - 2026-06-28

### Added
- "Reject All" bulk action to reject every pending request at once (main menu `D`)
- Justification prompt when rejecting a request (single and bulk), matching the approve flow

### Changed
- `Cancel-MAARequest` now accepts a `-Justification` parameter and returns detailed Graph error messages

## 1.0.6 - 2026-04-10

### Added
- Group type detection (Users, Devices, Mixed, Empty) displayed on assignment lines
- Member count shown inline for each group assignment
- GUID stripping from group display names for cleaner output

### Changed
- Assignment change indicators now use color coding only (green/red) instead of [NEW]/[REMOVED] text labels

## 1.0.5 - 2026-04-08

### Fixed
- Assignments incorrectly marked as [NEW] after policy rename
- Scope tags incorrectly marked as [NEW] when no baseline exists
- Authenticode signature blocks in scripts not preserved when viewing in editor

### Added
- Name change detection showing "OldName -> NewName" in review screen
- Resource ID-based matching for previous approval requests (survives renames)

## 1.0.4 - 2026-04-07

### Added
- [NEW] / [REMOVED] labels for assignment changes (green/red highlighting)
- Scope tag change detection with display name resolution
- Group name resolution via Group.Read.All permission

### Fixed
- Description truncation for clean terminal display

## 1.0.3 - 2026-04-06

### Changed
- TUI header version is now dynamic from module manifest

## 1.0.2 - 2026-04-06

### Changed
- Auth page branding updated from "MAA Manager" to "Intune-MAA"
- Teal colorway applied to auth pages

## 1.0.1 - 2026-04-06

### Added
- Help menu accessible via `[H]` from the main TUI
- Automatic update check on module launch

### Fixed
- Project and license URLs in module manifest

## 1.0.0 - 2026-04-05

### Added
- Initial release of Intune-MAA module
- `Start-MAAApproval` - Full-screen terminal UI for reviewing and approving MAA requests
- `Approve-MAARequest` - Approve a single request by ID with justification
- `Cancel-MAARequest` - Deny/reject a request by ID
- `Get-PendingMAARequests` - Retrieve all pending MAA requests
- Payload detail view for all Intune resource types (apps, policies, scripts, devices, roles, etc.)
- Script content viewer with VS Code and Notepad support
- Bulk approve all pending requests
- MSAL browser-based authentication (no WAM dependency)
- Custom app registration support via ClientId/TenantId parameters
- Environment variable config persistence (MAA_CLIENT_ID, MAA_TENANT_ID)
