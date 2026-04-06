@{
    RootModule        = 'Intune-MAA.psm1'
    ModuleVersion     = '1.0.2'
    GUID              = 'a3f7c8d1-4e2b-4a9f-b6c3-8d5e1f2a7b90'
    Author            = 'Mark Orr'
    CompanyName       = 'orr365'
    Copyright         = '(c) 2026 Mark Orr. All rights reserved.'
    Description       = 'Intune Multi Admin Approval (MAA) module for reviewing, approving, and denying MAA requests via a terminal UI. Provides a full-screen terminal interface for reviewing pending approval requests, viewing payload details, and approving or denying requests with justification. Works with Microsoft Graph beta API and supports custom app registrations.'

    PowerShellVersion = '7.0'

    # Microsoft.Graph.Authentication is required at runtime but auto-installed by Connect-ToGraph
    # RequiredModules is omitted to avoid blocking install on systems without it pre-installed

    FunctionsToExport = @(
        'Start-MAAApproval',
        'Configure-IntuneMAA',
        'Clear-IntuneMAA',
        'Approve-MAARequest',
        'Cancel-MAARequest',
        'Get-PendingMAARequests'
    )

    CmdletsToExport   = @()
    VariablesToExport  = @()
    AliasesToExport    = @()

    PrivateData = @{
        PSData = @{
            Tags         = @('Intune', 'MAA', 'MultiAdminApproval', 'MicrosoftGraph', 'Approval', 'MEM', 'Endpoint')
            LicenseUri   = 'https://github.com/markorr321/Intune-MAA/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/markorr321/Intune-MAA'
            ReleaseNotes = @'
## 1.0.2
- Updated auth page branding to Intune-MAA
- Matched teal colorway across auth pages
'@
        }
    }
}
