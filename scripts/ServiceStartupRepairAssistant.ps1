# Service and Startup Repair Assistant
# PowerShell Automation / IT Support Utility

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing 

# -----------------------------
# Application Settings
# -----------------------------

$appTitle = "Windows Service and Startup Repair Assistant"

# -----------------------------
# Main Form
# -----------------------------

$form = New-Object System.Windows.Forms.Form
$form.Text = $appTitle
$form.Size = New-Object System.Drawing.Size(1050, 700)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(245, 247, 250)

# -----------------------------
# Header Panel
# -----------------------------

$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(1050, 85)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 45, 64)
$form.Controls.Add($headerPanel)

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Windows Service and Startup Repair Assistant"
$titleLabel.Location = New-Object System.Drawing.Point(25, 18)
$titleLabel.Size = New-Object System.Drawing.Size(850, 30)
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$headerPanel.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Safe Windows Service Monitoring and Startup Troubleshooting Utility" 
$subtitleLabel.Location = New-Object System.Drawing.Point(27, 50)
$subtitleLabel.Size = New-Object System.Drawing.Size(600, 22)
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(210, 220, 230)
$headerPanel.Controls.Add($subtitleLabel)

# -----------------------------
# Status Summary Panel
# -----------------------------

$summaryPanel = New-Object System.Windows.Forms.Panel
$summaryPanel.Location = New-Object System.Drawing.Point(20, 105)
$summaryPanel.Size = New-Object System.Drawing.Size(990, 80)
$summaryPanel.BackColor = [System.Drawing.Color]::White
$summaryPanel.BorderStyle = "FixedSingle"
$form.Controls.Add($summaryPanel)

$summaryTitleLabel = New-Object System.Windows.Forms.Label
$summaryTitleLabel.Text = "System Readiness Summary"
$summaryTitleLabel.Location = New-Object System.Drawing.Point(15, 12)
$summaryTitleLabel.Size = New-Object System.Drawing.Size(300, 24)
$summaryTitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$summaryTitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(32, 45, 64)
$summaryPanel.Controls.Add($summaryTitleLabel)

$summaryStatusLabel = New-Object System.Windows.Forms.Label
$summaryStatusLabel.Text = "Ready - no scan has been run yet."
$summaryStatusLabel.Location = New-Object System.Drawing.Point(15, 42)
$summaryStatusLabel.Size = New-Object System.Drawing.Size(600, 24)
$summaryStatusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$summaryStatusLabel.ForeColor = [System.Drawing.Color]::FromArgb(80, 80, 80)
$summaryPanel.Controls.Add($summaryStatusLabel)

# -----------------------------
# Main Content Placeholder
# -----------------------------

$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(20, 205)
$contentPanel.Size = New-Object System.Drawing.Size(990, 380)
$contentPanel.BackColor = [System.Drawing.Color]::White
$contentPanel.BorderStyle = "FixedSingle"
$form.Controls.Add($contentPanel)

$contentTitleLabel = New-Object System.Windows.Forms.Label
$contentTitleLabel.Text = "Service and Startup Results"
$contentTitleLabel.Location = New-Object System.Drawing.Point(15, 12)
$contentTitleLabel.Size = New-Object System.Drawing.Size(350, 24)
$contentTitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$contentTitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(32, 45, 64)
$contentPanel.Controls.Add($placeholderLabel)

# -----------------------------
# Phase 2 - Service Results Table
# -----------------------------

$serviceGrid = New-Object System.Windows.Forms.DataGridView
$serviceGrid.Location = New-Object System.Drawing.Point(15, 85)
$serviceGrid.Size = New-Object System.Drawing.Size(960, 145)
$serviceGrid.BackgroundColor = [System.Drawing.Color]::White
$serviceGrid.BorderStyle = "FixedSingle"
$serviceGrid.AllowUserToAddRows = $false
$serviceGrid.AllowUserToDeleteRows = $false
$serviceGrid.AllowUserToResizeRows = $false
$serviceGrid.ReadOnly = $true
$serviceGrid.RowHeadersVisible = $false
$serviceGrid.SelectionMode = "FullRowSelect"
$serviceGrid.MultiSelect = $false
$serviceGrid.AutoSizeColumnsMode = "Fill"
$serviceGrid.Font = New-Object System.Drawing.Font("Segoe UT", 9)
$serviceGrid.EnableHeadersVisualStyles = $false
$serviceGrid.ColumnHeadersDefaultCellStyle.BackColor = [System.Drawing.Color]::FromArgb(230, 235, 242)
$serviceGrid.ColumnHeadersDefaultCellStyle.ForeColor = [System.Drawing.Color]::FromArgb(32, 45, 64)
$serviceGrid.ColumnHeadersDefaultCellStyle.Font = New-Object System.Drawing.Font("Segeoe UI", 9, [System.Drawing.FontStyle]::Bold)

[void]$serviceGrid.Columns.Add("Category", "Category")
[void]$serviceGrid.Columns.Add("ServiceName", "Service Name")
[void]$serviceGrid.Columns.Add("DisplayName", "Display Name") 
[void]$serviceGrid.Columns.Add("Status", "Status")
[void]$serviceGrid.Columns.Add("StartupType", "Startup Type")
[void]$serviceGrid.Columns.Add("Health", "Health")
[void]$serviceGrid.Columns.Add("RestartEligible", "Restart Eligible") 

[void]$serviceGrid.Rows.Add(
    "Printing",
    "Spooler",
    "Print Spooler",
    "Not scanned",
    "Unknown",
    "Pending",
    "Yes"
)

[void]$serviceGrid.Rows.Add(
    "Network",
    "Dhcp",
    "DHCP Client",
    "Not scanned",
    "Unknown",
    "Pending",
    "Protected"
)

[void]$serviceGrid.Rows.Add(
    "Security",
    "WinDefend",
    "Microsoft Defender Antivirus",
    "Not scanned",
    "Unknown",
    "Pending",
    "Protected"
)

$contentPanel.Controls.Add($serviceGrid)

# -----------------------------
# Phase 2 - Recommendations Box
# -----------------------------

$recommendationLabel = New-Object System.Windows.Forms.Label
$recommendationLabel.Text = "Technician Recommendations"
$recommendationLabel.Location = New-Object System.Drawing.Point(15, 245)
$recommendationLabel.Size = New-Object System.Drawing.Size(300, 22)
$recommendationLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$recommendationLabel.ForeColor = [System.Drawing.Color]::FromArgb(32, 45, 64)
$contentPanel.Controls.Add($recommendationLabel)

$recommendationBox = New-Object System.Windows.Forms.TextBox
$recommendationBox.Location = New-Object System.Drawing.Point(15, 270)
$recommendationBox.Size = New-Object System.Drawing.Size(470, 90)
$recommendationBox.Multiline = $true
$recommendationBox.ReadOnly = $true
$recommendationBox.ScrollBars = "Vertical"
$recommendationBox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$recommendationBox.Text = "No recommendations yet. Run a service scan or review startup items."
$contentPanel.Controls.Add($recommendationBox)

# -----------------------------
# Phase 2 - Activity Log Box
# -----------------------------

$activityLogLabel = New-Object System.Windows.Forms.Label
$activityLogLabel.Text = "Technician Activity Log"
$activityLogLabel.Location = New-Object System.Drawing.Point(505, 245)
$activityLogLabel.Size = New-Object System.Drawing.Size(300, 22)
$activityLogLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$activityLogLabel.ForeColor = [System.Drawing.Color]::FromArgb(32, 45, 64)
$contentPanel.Controls.Add($activityLogLabel)

$activityLogBox = New-Object System.Windows.Forms.TextBox
$activityLogBox.Location = New-Object System.Drawing.Point(505, 270)
$activityLogBox.Size = New-Object System.Drawing.Size(470, 90)
$activityLogBox.Multiline = $true
$activityLogBox.ReadOnly = $true 
$activityLogBox.ScrollBars = "Vertical"
$activityLogBox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$activityLogBox.Text = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))] INFO - Application opened. Ready for technician action."
$contentPanel.Controls.Add($activityLogBox) 

$placeholderLabel = New-Object System.Windows.Forms.Label
$placeholderLabel.Visible = $false
$placeholderLabel.Location = New-Object System.Drawing.Point(15, 50)
$placeholderLabel.Size = New-Object System.Drawing.Size(700, 24)
$placeholderLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$placeholderLabel.ForeColor = [System.Drawing.Color]::FromArgb(90, 90, 90)
$contentPanel.Controls.Add($placeholderLabel)

# -----------------------------
# Bottom Button Panel
# -----------------------------

$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(20, 605)
$buttonPanel.Size = New-Object System.Drawing.Size(990, 45)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(245, 247, 250)
$form.Controls.Add($buttonPanel)

$runScanButton = New-Object System.Windows.Forms.Button
$runScanButton.Text = "Run Service Scan"
$runScanButton.Location = New-Object System.Drawing.Point(0, 5)
$runScanButton.Size = New-Object System.Drawing.Size(150, 32)
$runScanButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($runScanButton)

$startupReviewButton = New-Object System.Windows.Forms.Button
$startupReviewButton.Text = "Review Startup Items"
$startupReviewButton.Location = New-Object System.Drawing.Point(165, 5)
$startupReviewButton.Size = New-Object System.Drawing.Size(150, 32)
$startupReviewButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($startupReviewButton)

$restartServiceButton = New-Object System.Windows.Forms.Button
$restartServiceButton.Text = "Restart Safe Service"
$restartServiceButton.Location = New-Object System.Drawing.Point(330, 5)
$restartServiceButton.Size = New-Object System.Drawing.Size(170, 32)
$restartServiceButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($restartServiceButton)

$printSpoolerRepairButton = New-Object System.Windows.Forms.Button
$printSpoolerRepairButton.Text = "Print Spooler Repair"
$printSpoolerRepairButton.Location = New-Object System.Drawing.Point(515, 5)
$printSpoolerRepairButton.Size = New-Object System.Drawing.Size(170, 32)
$printSpoolerRepairButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($printSpoolerRepairButton) 

$exportButton = New-Object System.Windows.Forms.Button
$exportButton.Text = "Export TXT Report"
$exportButton.Location = New-Object System.Drawing.Point(700, 5)
$exportButton.Size = New-Object System.Drawing.Size(150, 32)
$exportButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($exportButton)

$clearButton = New-Object System.Windows.Forms.Button
$clearButton.Text = "Clear"
$clearButton.Location = New-Object System.Drawing.Point(865, 5)
$clearButton.Size = New-Object System.Drawing.Size(100, 32)
$clearButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($clearButton)

$closeButton = New-Object System.Windows.Forms.Button
$closeButton.Text = "Close"
$closeButton.Location = New-Object System.Drawing.Point(0, 5)
$closeButton.Size = New-Object System.Drawing.Size(100, 32)
$closeButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$buttonPanel.Controls.Add($closeButton)

# -----------------------------
# Phase 3 - Safe Monitored Service List
# -----------------------------

$MonitoredServices = @(
    [PSCustomObject]@{
        Category = "Printing"
        Name = "Spooler"
        DisplayName = "Print Spooler"
        RestartEligible = "Yes"
    },
    [PSCustomObject]@{
        Category = "Windows Update"
        Name = "wuauserv"
        DisplayName = "Windows Update"
        RestartEligible = "Yes"
    },
    [PSCustomObject]@{
        Category = "Windows Update"
        Name = "BITS"
        DisplayName = "Background Intelligent Transfer Service"
        RestartEligible = "Yes"
    },
    [PSCustomObject]@{
        Category = "Windows Update"
        Name = "UsoSvc"
        DisplayName = "Update Orchestrator Service"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Security"
        Name = "WinDefend"
        DisplayName = "Microsoft Defender Antivirus"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Security"
        Name = "SecurityHealthService"
        DisplayName = "Windows Security Service"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Security"
        Name = "mpssvc"
        DisplayName = "Windows Defender Firewall"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Security"
        Name = "EventLog"
        DisplayName = "Windows Event Log"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Network"
        Name = "Dhcp"
        DisplayName = "DHCP Client"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Network"
        Name = "Dnscache"
        DisplayName = "DNS Client"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Network"
        Name = "NlaSvc"
        DisplayName = "Network Location Awareness"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Network"
        Name = "Netman"
        DisplayName = "Network Connections"
        RestartEligible = "Monitor Only"
    },
    [PSCustomObject]@{
        Category = "Network"
        Name = "WlanSvc"
        DisplayName = "WLAN AutoConfig"
        RestartEligible = "Monitor Only"
    },
    [PSCustomObject]@{
        Category = "System Stability"
        Name = "W32Time"
        DisplayName = "Windows Time"
        RestartEligible = "Yes"
    },
    [PSCustomObject]@{
        Category = "System Stability"
        Name = "Schedule"
        DisplayName = "Task Scheduler"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "System Stability"
        Name = "LanmanWorkstation"
        DisplayName = "Workstation"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "System Stability"
        Name = "ProfSvc"
        DisplayName = "User Profile Service"
        RestartEligible = "Protected"
    },
    [PSCustomObject]@{
        Category = "Remote Support"
        Name = "TermService"
        DisplayName = "Remote Desktop Services"
        RestartEligible = "Monitor Only"
    },
    [PSCustomObject]@{
        Category = "Remote Support"
        Name = "RemoteRegistry"
        DisplayName = "Remote Registry"
        RestartEligible = "Monitor Only"
    }
)

# -----------------------------
# Phase 3 - Service Scan Helper Functions
# -----------------------------

function Get-ServiceHealthStatus {
    param (
        [string]$ServiceStatus,
        [string]$StartupType,
        [string]$ServiceName
    )

    if ($ServiceStatus -eq "Not Found") {
        return "Not Found"
    }

    if ($StartupType -eq "Disabled") {
        return "Review"
    }

    if ($ServiceStatus -eq "Running") {
        return "Healthy"
    }

    if ($ServiceStatus -eq "Stopped" -and ($StartupType -eq "Auto" -or $StartupType -eq "Automatic")) {
        return "Warning"
    }

    if ($ServiceStatus -eq "Stopped") {
        return "Review"
    }

    return "Review"
}

function Get-ServiceRecommendation {
    param (
        [string]$Category,
        [string]$ServiceName,
        [string]$DisplayName,
        [string]$Status,
        [string]$StartupType,
        [string]$Health,
        [string]$RestartEligible
    )

    if ($Health -eq "Healthy") {
        return $null 
    }

    if ($Health -eq "Not Found") {
        return "Not Found: $DisplayName was not found on this system. This may be normal depending on the Windows edition or installed features."
    }

    if ($RestartEligible -eq "Protected") {
        if ($Status -eq "Stopped") {
            return "Protected Review: $DisplayName is stopped with startup type $StartupType. Review manually before taking action. Automatic restart is disabled for safety."
        }

        if ($StartupType -eq "Disabled") {
            return "Protected Review: $DisplayName is disabled. This service is protected in this tool, so review manually before making changes."
        }

        return "Protected Review: $DisplayName needs review. This tool will not automatically restart protected services."
    }

    if ($RestartEligible -eq "Monitor Only") {
        return "Monitor Only: $DisplayName is $Status with startup type $StartupType. This may be normal. Review only if the user reports related issues."
    }

    if ($RestartEligible -eq "Yes") {
        if ($Status -eq "Stopped" -and ($StartupType -eq "Auto" -or $StartupType -eq "Automatic")) {
            return "Action Available: $DisplayName is stopped but appears expected to run. This may be eligible for a safe restart in a later phase."
        }

        if ($Status -eq "Stopped") {
            return "Review: $DisplayName is stopped with startup type $StartupType. Restart may be useful only if the issue matches this service."
        }

        if ($StartupType -eq "Disabled") {
            return "Review: $DisplayName is disabled. Do not change startup type automatically; verify the reason first."
        }
    }

    return "Review: $DisplayName is $Status with startup type $StartupType. Continue technician review."
}
function Add-ServiceGridRow {
    param (
        [string]$Category,
        [string]$ServiceName,
        [string]$DisplayName,
        [string]$Status,
        [string]$StartupType,
        [string]$Health,
        [string]$RestartEligible
    )

    $rowIndex = $serviceGrid.Rows.Add(
        $Category,
        $ServiceName,
        $DisplayName,
        $Status,
        $StartupType,
        $Health,
        $RestartEligible
    )

    $row = $serviceGrid.Rows[$rowIndex]

    if ($Health -eq "Healthy") {
        $row.DefaultCellStyle.BackColor = [System.Drawing.Color]::FromArgb(225, 245, 235)
    }
    elseif ($Health -eq "Warning") {
        $row.DefaultCellStyle.BackColor = [System.Drawing.Color]::FromArgb(255, 245, 220)
    }
    elseif ($Health -eq "Review") {
        $row.DefaultCellStyle.BackColor = [System.Drawing.Color]::FromArgb(235, 240, 250)
    }
    elseif ($Health -eq "Not Found") {
        $row.DefaultCellStyle.BackColor = [System.Drawing.Color]::FromArgb(255, 230, 230)
    }
}

function Initialize-PendingServiceRows {
    $serviceGrid.Rows.Clear()

    foreach ($item in $MonitoredServices) {
        Add-ServiceGridRow `
            -Category $item.Category `
            -ServiceName $item.Name `
            -DisplayName $item.DisplayName `
            -Status "Not scanned" `
            -StartupType "Unknown" `
            -Health "Pending" `
            -RestartEligible $item.RestartEligible
    }
}

function Run-SafeServiceScan {
    $serviceGrid.Rows.Clear()

    $healthyCount = 0
    $warningCount = 0
    $reviewCount = 0
    $notFoundCount = 0

    $recommendations = New-Object System.Collections.Generic.List[string]

    foreach ($item in $MonitoredServices) {
        $service = Get-Service -Name $item.Name -ErrorAction SilentlyContinue
        $cimService = Get-CimInstance -ClassName Win32_Service -Filter "Name='$($item.Name)'" -ErrorAction SilentlyContinue

        if ($null -eq $service) {
            $status = "Not Found"
            $startupType = "Unknown"
            $health = "Not Found"
            $notFoundCount++
        }
        else {
            $status = $service.Status.ToString()

            if ($null -ne $cimService) {
                $startupType = $cimService.StartMode
            }
            else {
                $startupType = "Unknown"
            }

            $health = Get-ServiceHealthStatus -ServiceStatus $status -StartupType $startupType -ServiceName $item.Name

            if ($health -eq "Healthy") {
                $healthyCount++
            }
            elseif ($health -eq "Warning") {
                $warningCount++
            }
            elseif ($health -eq "Review") {
                $reviewCount++
            }
            elseif ($health -eq "Not Found") {
                $notFoundCount++
            }
        }

        $recommendation = Get-ServiceRecommendation -Category $item.Category -ServiceName $item.Name -DisplayName $item.DisplayName -Status $status -StartupType $startupType -Health $health -RestartEligible $item.RestartEligible

        if ($null -ne $recommendation) {
            $recommendations.Add($recommendation)
        }

        Add-ServiceGridRow -Category $item.Category -ServiceName $item.Name -DisplayName $item.DisplayName -Status $status -StartupType $startupType -Health $health -RestartEligible $item.RestartEligible
    }

    $summaryStatusLabel.Text = "Scan complete - Healthy: $healthyCount | Warning: $warningCount | Review: $reviewCount | Not Found: $notFoundCount"

    if ($recommendations.Count -eq 0) {
        $recommendationBox.Text = "No major service issues detected. All monitored services are either healthy or in an expected state. Continue normal troubleshooting if the user still reports problems."
    }
    else {
        $recommendationBox.Text = ($recommendations -join "`r`n")
    }

    Add-TechnicianLogEntry -Category "SCAN" -Message "Service scan completed with updated recommendations."
}

function Run-StartupItemReview {
    $serviceGrid.Rows.Clear()

    $startupItems = New-Object System.Collections.Generic.List[object]
    $recommendations = New-Object System.Collections.Generic.List[string]

    $startupLocations = @(
        [PSCustomObject]@{
            Category = "Current User Startup"
            Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
        },
        [PSCustomObject]@{
            Category = "Local Machine Startup"
            Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
        },
        [PSCustomObject]@{
            Category = "Local Machine Startup 32-bit"
            Path = "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run"
        }
    )

    foreach ($location in $startupLocations) {
        if (Test-Path $location.Path) {
            $properties = Get-ItemProperty -Path $location.Path

            foreach ($property in $properties.PSObject.Properties) {
                if ($property.Name -notin @("PSPath", "PSParentPath", "PSChildName", "PSDrive", "PSProvider")) {
                    $startupItems.Add(
                        [PSCustomObject]@{
                            Category = $location.Category
                            Name = $property.Name
                            Command = $property.Value
                        }
                    )
                }
            }
        }
    }

    if ($startupItems.Count -eq 0) {
        [void]$serviceGrid.Rows.Add(
            "Startup Review",
            "No items found",
            "No startup items detected",
            "Not applicable",
            "Not applicable",
            "Healthy",
            "Read Only"
        )

        $summaryStatusLabel.Text = "Startup review complete - no startup items found."
        $recommendationBox.Text = "No startup items were found in the monitored startup registry locations."
    }
    else {
        foreach ($item in $startupItems) {
            $health = "Review"

            if ($item.Command -match "Microsoft|OneDrive|Teams|Windows|SecurityHealth") {
                $health = "Expected"
            }

            [void]$serviceGrid.Rows.Add(
                $item.Category,
                $item.Name,
                $item.Command,
                "Enabled",
                "Startup Entry",
                $health,
                "Read Only"
            )

            if ($health -eq "Review") {
                $recommendations.Add("Review startup item: $($item.Name). Confirm this startup entry is expected before making manual changes.")
            }
        }

        $summaryStatusLabel.Text = "Startup review complete - Items found: $($startupItems.Count)"

        if ($recommendations.Count -eq 0) {
            $recommendationBox.Text = "Startup items found, but no unusual entries were flagged by this basic review. Continue normal troubleshooting if startup performance issues remain."
        }
        else {
            $recommendationBox.Text = ($recommendations -join "`r`n")
        }
    }

    Add-TechnicianLogEntry -Category "REVIEW" -Message "Startup item review completed."
}

function Restart-SelectedSafeService {
    if ($serviceGrid.SelectedRows.Count -eq 0) {
        $summaryStatusLabel.Text = "No service selected. Select a restart-eligible service first."
        $recommendationBox.Text = "Select a service row marked Restart Eligible = Yes before using the safe restart action."
        Add-TechnicianLogEntry -Category "BLOCKED" -Message "Restart action blocked because no row was selected."
        return 
    }

    $selectedRow = $serviceGrid.SelectedRows[0]

    $serviceName = [string]$selectedRow.Cells["ServiceName"].Value
    $displayName = [string]$selectedRow.Cells["DisplayName"].Value
    $restartEligible = [string]$selectedRow.Cells["RestartEligible"].Value
    $status = [string]$selectedRow.Cells["Status"].Value

    if ($restartEligible -ne "Yes") {
        $summaryStatusLabel.Text = "Restart blocked - selected item is not eligible for automatic restart."
        $recommendationBox.Text = "$displayName is marked as '$restartEligible'. This tool will not restart protected, monitored only, read only, or startup review entries."
        Add-TechnicianLogEntry -Category "BLOCKED" -Message "Restart blocked for $serviceName because restart eligibility is $restartEligible."
        return 
    }

    $safeRestartServices = @("Spooler", "wuauserv", "BITS", "W32Time")

    if ($serviceName -notin $safeRestartServices) {
        $summaryStatusLabel.Text = "Restart blocked - service is not the safe restart list."
        $recommendationBox.Text = "$displayName is not included in the approved safe restart list. Review manually if troubleshooting requires action."
        Add-TechnicianLogEntry -Category "BLOCKED" -Message "Restart blocked for $serviceName because it is not in the safe restart list."
        return 
    }

    $confirmResult = [System.Windows.Forms.MessageBox]::Show(
        "Restart safe service '$displayName' ($serviceName)?",
        "Confirm Safe Restart",
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Question
    )

    if ($confirmResult -ne [System.Windows.Forms.DialogResult]::Yes) {
        $summaryStatusLabel.Text = "Restart cancelled by technician."
        Add-TechnicianLogEntry -Category "CANCELLED" -Message "Restart cancelled for $serviceName."
        return 
    }

    try {
        $service = Get-Service -Name $serviceName -ErrorAction Stop

        if ($service.Status -eq "Running") {
            Restart-Service -Name $serviceName -Force -ErrorAction Stop
            $actionTaken = "restarted"
        }
        else {
            Start-Service -Name $serviceName -ErrorAction Stop
            $actionTaken = "started"
        }

        $summaryStatusLabel.Text = "$displayName was $actionTaken successfully." 
        $recommendationBox.Text = "$displayName was $actionTaken using the safe service action. Run Service Scan again to refresh the table."
        Add-TechnicianLogEntry -Category "REPAIR" -Message "Safe service action completed. $displayName was $actionTaken."
    }
    catch {
        $summaryStatusLabel.Text = "Safe service action failed for $displayName."
        $recommendationBox.Text = "Unable to restart or start $displayName. Administrator permission may be required, or Windows may be preventing the action. Error: $($_.Exception.Message)"
        Add-TechnicianLogEntry -Category "ERROR" -Message "Safe service action failed for $serviceName."
    }
}

function InvokeSpoolerRepairWorkflow {
    $serviceName = "Spooler"
    $displayName = "Print Spooler"

    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
    $cimService = Get-CimInstance -ClassName Win32_Service -Filter "Name-'Spooler'" -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        $summaryStatusLabel.Text = "Print Spooler was not found on this system."
        $recommendationBox.Text = "Print Spooler service was not found. This is unusual for a standard Windows workstation. Review the Windows installation or printer configuration manually."
        Add-TechnicianLogEntry -Category "BLOCKED" -Message "Print Spooler repair blocked because the service was not found."
        return 
    }

    $status = $service.Status.ToString()

    if ($null -ne $cimService) {
        $startupType = $cimService.StartMode
    }
    else {
        $startupType = "Unknown"
    }

    $recommendationText = "Print Spooler Status: $status`r`nStartup Type: $startupType`r`n`r`n"

    if ($status -eq "Running") {
        $recommendationText += "The Print Spooler is currently running. Restarting it may help with stuck print jobs, printer queue issues, or  printers showing offline incorrectly."
    }
    elseif ($status -eq "Stopped") {
        $recommendationText += "The Print Spooler is currently stopped. Starting it may restore printing functionality."
    }
    else {
        $recommendationText += "The Print Spooler is in state '$status'. Review before taking action."
    }

    $recommendationText += "`r`n`r`nThis workflow will ask for confirmation before making any changes."

    $summaryStatusLabel.Text = "Print Spooler review complete - confirmation required before repair."
    $recommendationBox.Text = $recommendationText
    Add-TechnicianLogEntry -Category "REVIEW" -Message "Print Spooler repair workflow reviewed service state."

    $confirmResult = [System.Windows.Forms.MessageBox]::Show(
        "Print Spooler is currently $status.`r`n`r`nRestart or start Print Spooler now?",
        "Confirm Print Spooler Repair",
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Question
    )

    if ($confirmResult -ne [System.Windows.Forms.DialogResult]::Yes) {
        $summaryStatusLabel.Text = "Print Spooler repair cancelled by technician."
        Add-TechnicianLogEntry -Category "CANCELLED" -Message "Print Spooler repair cancelled by technician"
        return 
    }
    
    try {
        if ($service.Status -eq "Running") {
            Restart-Service -Name $serviceName -Force -ErrorAction Stop
            $actionTaken = "restarted"
        }
        else {
            Start-Service -Name $serviceName -ErrorAction Stop
            $actionTaken = "started" 
        }

        $summaryStatusLabel.Text = "Print Spooler was $actionTaken successfully."
        $recommendationBox.Text = "Print Spooler was $actionTaken successfully. Run Service Scan again to refresh the service table. Ask the user to retry printing if this was related to a printer issue."
        Add-TechnicianLogEntry -Category "REPAIR" -Message "Print Spooler was $actionTaken."
    }
    catch {
        $summaryStatusLabel.Text = "Print Spooler repair failed."
        $recommendationBox.Text = "Unable to restart or start Print Spooler. Administrator permission may be required, or Windows may be preventing the action. Error: $($_.Exception.Message)"
        Add-TechnicianLogEntry -Category "ERROR" -Message "Print Spooler repair failed."
    }
}

function Add-TechnicianLogEntry {
    param (
        [string]$Category,
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $activityLogBox.AppendText("`r`n[$timestamp] $Category - $Message")
}

function Export-TxtReport {
    $projectRoot = Split-Path -Parent $PSScriptRoot
    $reportsFolder = Join-Path $projectRoot "reports"
    $reportPath = Join-Path $reportsFolder "service_startup_repair_report.txt"

    if (-not (Test-Path $reportsFolder)) {
        New-Item -Path $reportsFolder -ItemType Directory | Out-Null
    }

    $reportLines = New-Object System.Collections.Generic.List[string]

    $reportLines.Add("WINDOWS SERVICE AND STARTUP REPAIR ASSISTANT")
    $reportLines.Add("Project 29 - PowerShell Automation / IT Support Utility")
    $reportLines.Add("TXT Troubleshooting Report")
    $reportLines.Add("============================================================")
    $reportLines.Add("")
    $reportLines.Add("Export Timestamp: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
    $reportLines.Add("Computer Name: $env:COMPUTERNAME")
    $reportLines.Add("User Name: $env:USERNAME")
    $reportLines.Add("")
    $reportLines.Add("SYSTEM READINESS SUMMARY")
    $reportLines.Add("------------------------------------------------------------")
    $reportLines.Add($summaryStatusLabel.Text)
    $reportLines.Add("")
    $reportLines.Add("CURRENT TABLE RESULTS")
    $reportLines.Add("------------------------------------------------------------")

    if ($serviceGrid.Rows.Count -eq 0) {
        $reportLines.Add("No table results available.")
    }
    else {
        foreach ($row in $serviceGrid.Rows) {
            if (-not $row.IsNewRow) {
                $category = [string]$row.Cells["Category"].Value
                $serviceName = [string]$row.Cells["ServiceName"].Value
                $displayName = [string]$row.Cells["DisplayName"].Value
                $status = [string]$row.Cells["Status"].Value
                $startupType = [string]$row.Cells["StartupType"].Value
                $health = [string]$row.Cells["Health"].Value
                $restartEligible = [string]$row.Cells["RestartEligible"].Value

                $reportLines.Add("Category: $category")
                $reportLines.Add("Name: $serviceName")
                $reportLines.Add("Display Name / Command: $displayName")
                $reportLines.Add("Status: $status")
                $reportLines.Add("Startup Type: $startupType")
                $reportLines.Add("Health: $health")
                $reportLines.Add("Restart Eligible: $restartEligible")
                $reportLines.Add("")
            }
        }
    }

    $reportLines.Add("")
    $reportLines.Add("TECHNICIAN RECOMMENDATIONS")
    $reportLines.Add("------------------------------------------------------------")

    if ([string]::IsNullOrWhiteSpace($recommendationBox.Text)) {
        $reportLines.Add("No recommendations available.")
    }
    else {
        $recommendationLines = $recommendationBox.Text -split "`r`n|`n"

        foreach ($line in $recommendationLines) {
            if (-not [string]::IsNullOrWhiteSpace($line)) {
                $reportLines.Add($line)
            }
        }
    }

    $reportLines.Add("")
    $reportLines.Add("TECHNICIAN ACTIVITY LOG")
    $reportLines.Add("------------------------------------------------------------")

    if ([string]::IsNullOrWhiteSpace($activityLogBox.Text)) {
        $reportLines.Add("No technician activity recorded.")
    }
    else {
        $activityLines = $activityLogBox.Text -split "`r`n|`n"

        foreach ($line in $activityLines) {
            if (-not [string]::IsNullOrWhiteSpace($line)) {
                $reportLines.Add($line)
            }
        }
    }

    $reportLines.Add("")
    $reportLines.Add("SAFETY NOTES")
    $reportLines.Add("------------------------------------------------------------")
    $reportLines.Add("This tool is designed for safe IT support troubleshooting.")
    $reportLines.Add("Protected, monitor-only, read-only, and startup review entries are not automatically modified.")
    $reportLines.Add("Service restart actions require technician confirmation.")
    $reportLines.Add("")
    $reportLines.Add("END OF REPORT")

    try {
        Set-Content -Path $reportPath -Value $reportLines -Encoding UTF8

        $summaryStatusLabel.Text = "TXT report exported successfully to the reports folder."
        $recommendationBox.Text = "Report exported successfully to:`r`n$reportPath"
        Add-TechnicianLogEntry -Category "EXPORT" -Message "TXT troubleshooting report exported successfully."

        [System.Windows.Forms.MessageBox]::Show(
            "TXT report exported successfully.`r`n`r`n$reportPath",
            "Export Complete",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        ) | Out-Null
    }
    catch {
        $summaryStatusLabel.Text = "TXT report export failed."
        $recommendationBox.Text = "Unable to export TXT report. Error: $($_.Exception.Message)"
        Add-TechnicianLogEntry -Category "ERROR" -Message "TXT report export failed."

        [System.Windows.Forms.MessageBox]::Show(
            "TXT report export failed.`r`n`r`nError: $($_.Exception.Message)",
            "Export Failed",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        ) | Out-Null
    }
}

Initialize-PendingServiceRows

# -----------------------------
# Button Events
# -----------------------------

$runScanButton.Add_Click({
    Run-SafeServiceScan
})

$startupReviewButton.Add_Click({
    Run-StartupItemReview
})

$restartServiceButton.Add_Click({
    Restart-SelectedSafeService
})

$printSpoolerRepairButton.Add_Click({
    InvokeSpoolerRepairWorkflow
})

$exportButton.Add_Click({
    Export-TxtReport
})

$clearButton.Add_Click({
    $summaryStatusLabel.Text = "Ready - no scan has been run yet."
    $recommendationBox.Text = "No recommendations yet. Run a service scan or review startup items."
    $activityLogBox.Text = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] INFO - Results cleared. Ready for technician action." 
    Initialize-PendingServiceRows
})

$closeButton.Add_Click({
    $form.Close()
})

# -----------------------------
# Run Application
# -----------------------------

[void]$form.ShowDialog()