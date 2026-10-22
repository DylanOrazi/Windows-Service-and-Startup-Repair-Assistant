Windows Service and Startup Repair Assistant

Project Category:
PowerShell Automation / IT Support Utility

Overview:
The Windows Service and Startup Repair Assistant is a PowerShell GUI tool designed to help IT technicians review important Windows services, inspect startup items, perform safe repair actions, log technician activities, and export a TXT troubleshooting report.

This project was built to demonstrate practical IT support automation using PowerShell and Windows Forms while keeping system changes controlled and safe.

Purpose:
The purpose of this project is to provide a technician-friendly interface for common Windows troubleshooting tasks. The tool helps identify stopped, disabled, protected, monitor-only, and review-needed services. It also provides startup item visibility and technician recommendations without making risky automatic changes.

Main Features:
- PowerShell Windows Forms GUI
- Safe Windows service monitoring
- Categorized service health table
- Startup item review
- Technician recommendation box 
- Protected service safety rules 
- Safe restart option for approved services only
- Dedicated Print Spooler repair workflow
- Confirmation prompts before repair actions
- Timestamped technician activity log
- TXT troubleshooting report export

Safe Service Monitoring:
The tool monitors important Windows services across categories such as printing, Windows Update, security, networking, system stability, and remote support.

Examples include: 
- Print Spooler
- Windows Update
- Background Intelligent Transfer Service
- Microsoft Defender Antivirus
- Windows Defender Firewall
- DHCP Client
- DNS Client
- Network Location Awareness
- WLAN AutoConfig
- Task Scheduler
- Windows Event Log
- Windows Time
- User Profile Service

Safety Design:

This project is designed with safety in mind. Protected, monitor-only, read-only, and startup review entries are not automatically modified. Service restart actions are limited to approved services and require confirmation before continuing.

The tool does not delete startup entries, disable services, force risky system changes, or restart protected services automatically.

Technology Used: 
- PowerShell
- Windows Forms
- Windows service commands
- CIM/WMI service information
- TXT file export
- Visual Studio Code

Report Export:
The tool can export a TXT troubleshooting report containing:
- System readiness summary
- Current table results
- Technician recommendations
- Technician activity log
- Safety notes

Example report file:
reports\service_startup_repair_report.txt

Skills Demonstrated:
- PowerShell scripting
- Windows Forms GUI development
- Windows service troubleshooting
- Startup item review
- Safe automation design
- Technician workflow planning
- Error handling
- Activity logging
- TXT report generation
- IT support documentation

Screenshots:
Screenshots are included to show the main GUI, service scan results, startup item review, protected service blocking, and Print Spooler repair confirmation.

Limitations:
This tool is intended for local Windows workstation troubleshooting. Some repair actions may require admin permissions. The tool does not connect to enterprise management platforms, Microsoft Intune, Active Directory, or remote machines.

How to Run:

1. Download `ServiceStartupRepairAssistant.ps1` from the `scripts` folder.
2. Open PowerShell in the folder containing the script by clicking the address bar at the top and type PowerShell.
3. Temporarily allow script execution for the current PowerShell session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

then type -> .\Scripts\ServiceStartupRepairAssistant.ps1
then click enter.
























