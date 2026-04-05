# Intune-MAA

Manage Microsoft Intune Multi Admin Approval (MAA) requests with PowerShell. Provides a full-screen terminal UI for reviewing pending approval requests, viewing payload details, and approving or denying requests with justification. Just run `Start-MAAApproval` — works out of the box with no configuration, or bring your own app registration for full control.

![Intune-MAA demo](Intune-MAA%20(2).gif)

## Installation

```powershell
Install-Module -Name Intune-MAA
```

## Quick Start

Configure your app registration (one-time setup):

```powershell
Configure-IntuneMAA
```

Launch the approval manager TUI:

```powershell
Start-MAAApproval
```

## Functions

| Function | Description |
|----------|-------------|
| `Start-MAAApproval` | Launch the interactive approval manager |
| `Configure-IntuneMAA` | Interactively configure and save app registration credentials |
| `Clear-IntuneMAA` | Remove saved app registration configuration |
| `Approve-MAARequest` | Approve a request by ID |
| `Cancel-MAARequest` | Deny/reject a request by ID |
| `Get-PendingMAARequests` | Get all pending MAA requests |

## Requirements

- PowerShell 7.0+
- Microsoft.Graph.Authentication module (v2.0.0+)
- One of: Az.Accounts module OR NuGet Microsoft.Identity.Client package (for MSAL browser auth)

### Required Graph API Permissions (Delegated)

- DeviceManagementConfiguration.ReadWrite.All
- DeviceManagementRBAC.ReadWrite.All
- DeviceManagementManagedDevices.ReadWrite.All
- DeviceManagementApps.ReadWrite.All
- DeviceManagementScripts.ReadWrite.All

### Custom App Registration

If using a custom app registration:

1. Platform: **Mobile and desktop applications**
2. Redirect URI: `http://localhost`
3. Allow public client flows: **Yes**
4. Add the delegated API permissions listed above

## Configuration

Use the built-in configuration command to save your app registration credentials:

Save your app registration credentials:

```powershell
Configure-IntuneMAA
```

Remove saved configuration:

```powershell
Clear-IntuneMAA
```

Or pass parameters directly each time:

```powershell
Start-MAAApproval -ClientId "your-app-id" -TenantId "your-tenant-id"
```

On macOS, `Configure-IntuneMAA` will also offer to add the credentials to your PowerShell profile for persistence across sessions.

## Payload Review

When viewing a request, you can open the payload directly in **VS Code** or **Notepad** for a detailed review. Scripts are decoded and opened as `.ps1` files, and policies open as a formatted summary of settings and assignments.

## Supported Resource Types

- Apps (Win32, MSI, Store, Web)
- Configuration profiles
- Settings catalog policies
- Compliance policies
- Remediation scripts
- Platform scripts
- Group policies
- Autopilot profiles
- Update profiles (Feature, Quality, Driver)
- Enrollment configurations
- Approval policies
- Device categories
- Role definitions
- Device actions (Wipe, Retire, Delete)

## License

[MIT](LICENSE)
