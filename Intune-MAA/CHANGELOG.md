# Changelog

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
