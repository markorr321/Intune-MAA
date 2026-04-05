# Intune-MAA

PowerShell module for managing Multi Admin Approval (MAA) requests in Microsoft Intune.

Provides a full-screen terminal UI for reviewing pending approval requests, viewing payload details, and approving or denying requests with justification.

## Installation

```powershell
Install-Module -Name Intune-MAA
```

## Quick Start

```powershell
# Launch the approval manager TUI
Start-MAAApproval

# Configure your app registration (one-time setup)
Configure-IntuneMAA
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

- PowerShell 5.1+
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

```powershell
# Interactive setup — prompts for Client ID and Tenant ID, saves as user-level environment variables
Configure-IntuneMAA

# To remove saved configuration
Clear-IntuneMAA
```

Alternatively, pass parameters directly each time:

```powershell
Start-MAAApproval -ClientId "your-app-id" -TenantId "your-tenant-id"
```

On macOS, `Configure-IntuneMAA` will also offer to add the credentials to your PowerShell profile for persistence across sessions.

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
