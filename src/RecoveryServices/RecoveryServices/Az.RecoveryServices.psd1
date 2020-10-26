#
# Module manifest for module 'Az.RecoveryServices'
#
# Generated by: Microsoft Corporation
#
# Generated on: 10/23/2020
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '3.0.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '5af71f43-17ca-45bd-b534-34524b801ade'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Recovery Services cmdlets for Azure Resource Manager in Windows PowerShell and PowerShell Core.

For more information on Recovery Services Backup, please visit the following: https://docs.microsoft.com/azure/backup/
For more information on Site Recovery, please visit the following: https://docs.microsoft.com/azure/site-recovery/'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '2.1.0'; })

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = 'AutoMapper.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Models.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Helpers.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Logger.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Providers.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.ServiceClientAdapter.dll', 
               'Microsoft.Azure.Management.RecoveryServices.Backup.dll', 
               'Microsoft.Azure.Management.RecoveryServices.dll', 
               'Microsoft.Azure.Management.RecoveryServices.SiteRecovery.dll', 
               'System.Configuration.ConfigurationManager.dll', 
               'TimeZoneConverter.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'RecoveryServices.Backup.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.SiteRecovery.dll')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Get-AzRecoveryServicesBackupProperty', 
               'Get-AzRecoveryServicesVault', 
               'Get-AzRecoveryServicesVaultSettingsFile', 
               'New-AzRecoveryServicesVault', 'Remove-AzRecoveryServicesVault', 
               'Add-AzRecoveryServicesAsrReplicationProtectedItemDisk', 
               'Edit-AzRecoveryServicesAsrRecoveryPlan', 
               'Get-AzRecoveryServicesAsrAlertSetting', 
               'Get-AzRecoveryServicesAsrEvent', 'Get-AzRecoveryServicesAsrFabric', 
               'Get-AzRecoveryServicesAsrJob', 'Get-AzRecoveryServicesAsrNetwork', 
               'Get-AzRecoveryServicesAsrNetworkMapping', 
               'Get-AzRecoveryServicesAsrPolicy', 
               'Get-AzRecoveryServicesAsrProtectableItem', 
               'Get-AzRecoveryServicesAsrProtectionContainer', 
               'Get-AzRecoveryServicesAsrProtectionContainerMapping', 
               'Get-AzRecoveryServicesAsrRecoveryPlan', 
               'Get-AzRecoveryServicesAsrRecoveryPoint', 
               'Get-AzRecoveryServicesAsrReplicationProtectedItem', 
               'Get-AzRecoveryServicesAsrServicesProvider', 
               'Get-AzRecoveryServicesAsrStorageClassification', 
               'Get-AzRecoveryServicesAsrStorageClassificationMapping', 
               'Get-AzRecoveryServicesAsrVaultContext', 
               'Get-AzRecoveryServicesAsrvCenter', 
               'Import-AzRecoveryServicesAsrVaultSettingsFile', 
               'New-AzRecoveryServicesAsrFabric', 
               'New-AzRecoveryServicesAsrInMageAzureV2DiskInput', 
               'New-AzRecoveryServicesAsrNetworkMapping', 
               'New-AzRecoveryServicesAsrPolicy', 
               'New-AzRecoveryServicesAsrProtectableItem', 
               'New-AzRecoveryServicesAsrProtectionContainer', 
               'New-AzRecoveryServicesAsrProtectionContainerMapping', 
               'New-AzRecoveryServicesAsrRecoveryPlan', 
               'New-AzRecoveryServicesAsrReplicationProtectedItem', 
               'New-AzRecoveryServicesAsrStorageClassificationMapping', 
               'New-AzRecoveryServicesAsrvCenter', 
               'New-AzRecoveryServicesAsrAzureToAzureDiskReplicationConfig', 
               'New-AzRecoveryServicesAsrVMNicConfig', 
               'Remove-AzRecoveryServicesAsrFabric', 
               'Remove-AzRecoveryServicesAsrNetworkMapping', 
               'Remove-AzRecoveryServicesAsrPolicy', 
               'Remove-AzRecoveryServicesAsrProtectionContainer', 
               'Remove-AzRecoveryServicesAsrProtectionContainerMapping', 
               'Remove-AzRecoveryServicesAsrRecoveryPlan', 
               'Remove-AzRecoveryServicesAsrReplicationProtectedItem', 
               'Remove-AzRecoveryServicesAsrReplicationProtectedItemDisk', 
               'Remove-AzRecoveryServicesAsrServicesProvider', 
               'Remove-AzRecoveryServicesAsrStorageClassificationMapping', 
               'Remove-AzRecoveryServicesAsrvCenter', 
               'Restart-AzRecoveryServicesAsrJob', 
               'Resume-AzRecoveryServicesAsrJob', 
               'Set-AzRecoveryServicesAsrAlertSetting', 
               'Set-AzRecoveryServicesAsrReplicationProtectedItem', 
               'Set-AzRecoveryServicesAsrVaultContext', 
               'Start-AzRecoveryServicesAsrApplyRecoveryPoint', 
               'Start-AzRecoveryServicesAsrCommitFailoverJob', 
               'Start-AzRecoveryServicesAsrPlannedFailoverJob', 
               'Start-AzRecoveryServicesAsrResynchronizeReplicationJob', 
               'Start-AzRecoveryServicesAsrSwitchProcessServerJob', 
               'Start-AzRecoveryServicesAsrTestFailoverCleanupJob', 
               'Start-AzRecoveryServicesAsrTestFailoverJob', 
               'Start-AzRecoveryServicesAsrUnplannedFailoverJob', 
               'Stop-AzRecoveryServicesAsrJob', 
               'Update-AzRecoveryServicesAsrMobilityService', 
               'Update-AzRecoveryServicesAsrNetworkMapping', 
               'Update-AzRecoveryServicesAsrPolicy', 
               'Update-AzRecoveryServicesAsrProtectionContainerMapping', 
               'Update-AzRecoveryServicesAsrProtectionDirection', 
               'Update-AzRecoveryServicesAsrRecoveryPlan', 
               'Update-AzRecoveryServicesAsrServicesProvider', 
               'Update-AzRecoveryServicesAsrvCenter', 
               'Set-AzRecoveryServicesBackupProperty', 
               'Set-AzRecoveryServicesVaultContext', 
               'Backup-AzRecoveryServicesBackupItem', 
               'Get-AzRecoveryServicesBackupManagementServer', 
               'Get-AzRecoveryServicesBackupContainer', 
               'Register-AzRecoveryServicesBackupContainer', 
               'Unregister-AzRecoveryServicesBackupContainer', 
               'Disable-AzRecoveryServicesBackupProtection', 
               'Enable-AzRecoveryServicesBackupProtection', 
               'Enable-AzRecoveryServicesBackupAutoProtection', 
               'Disable-AzRecoveryServicesBackupAutoProtection', 
               'Get-AzRecoveryServicesBackupItem', 
               'Get-AzRecoveryServicesBackupProtectableItem', 
               'Initialize-AzRecoveryServicesBackupProtectableItem', 
               'Get-AzRecoveryServicesBackupJob', 
               'Get-AzRecoveryServicesBackupJobDetail', 
               'Stop-AzRecoveryServicesBackupJob', 
               'Wait-AzRecoveryServicesBackupJob', 
               'Get-AzRecoveryServicesBackupProtectionPolicy', 
               'Get-AzRecoveryServicesBackupRetentionPolicyObject', 
               'Get-AzRecoveryServicesBackupSchedulePolicyObject', 
               'New-AzRecoveryServicesBackupProtectionPolicy', 
               'Remove-AzRecoveryServicesBackupProtectionPolicy', 
               'Set-AzRecoveryServicesBackupProtectionPolicy', 
               'Get-AzRecoveryServicesBackupRecoveryPoint', 
               'Get-AzRecoveryServicesBackupRecoveryLogChain', 
               'Restore-AzRecoveryServicesBackupItem', 
               'Get-AzRecoveryServicesBackupWorkloadRecoveryConfig', 
               'Unregister-AzRecoveryServicesBackupManagementServer', 
               'Get-AzRecoveryServicesBackupRPMountScript', 
               'Disable-AzRecoveryServicesBackupRPMountScript', 
               'Get-AzRecoveryServicesBackupStatus', 
               'Undo-AzRecoveryServicesBackupItemDeletion', 
               'Set-AzRecoveryServicesVaultProperty', 
               'Get-AzRecoveryServicesVaultProperty', 
               'Copy-AzRecoveryServicesVault'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-AzRecoveryServicesBackupProperties', 
               'Add-ASRReplicationProtectedItemDisk', 'Edit-ASRRP', 
               'Edit-ASRRecoveryPlan', 'Get-ASRAlertSetting', 'Get-ASREvent', 
               'Get-ASRFabric', 'Get-ASRJob', 'Get-ASRNetwork', 
               'Get-ASRNetworkMapping', 'Get-ASRNotificationSetting', 
               'Get-ASRPolicy', 'Get-ASRProtectableItem', 
               'Get-ASRProtectionContainer', 'Get-ASRProtectionContainerMapping', 
               'Get-ASRRP', 'Get-ASRRecoveryPlan', 'Get-ASRRecoveryPoint', 
               'Get-ASRReplicationProtectedItem', 'Get-ASRServicesProvider', 
               'Get-ASRStorageClassification', 
               'Get-ASRStorageClassificationMapping', 'Set-ASRVaultContext', 
               'Set-ASRVaultSettings', 'Get-ASRvCenter', 
               'Get-AzRecoveryServicesAsrNotificationSetting', 
               'Get-AzRecoveryServicesAsrVaultSettings', 'New-ASRFabric', 
               'New-AsrInMageAzureV2DiskInput', 'New-ASRNetworkMapping', 
               'New-ASRPolicy', 'New-ASRProtectableItem', 
               'New-ASRProtectionContainerMapping', 'New-ASRRP', 
               'New-ASRRecoveryPlan', 'New-ASRReplicationProtectedItem', 
               'New-ASRStorageClassificationMapping', 'New-ASRvCenter', 
               'New-ASRVMNicConfig', 'Remove-ASRFabric', 'Remove-ASRNetworkMapping', 
               'Remove-ASRPolicy', 'Remove-ASRProtectionContainerMapping', 
               'Remove-ASRRP', 'Remove-ASRRecoveryPlan', 
               'Remove-ASRReplicationProtectedItem', 'Remove-ASRServicesProvider', 
               'Remove-ASRReplicationProtectedItemDisk', 
               'Remove-ASRStorageClassificationMapping', 'Remove-ASRvCenter', 
               'Restart-ASRJob', 'Resume-ASRJob', 'Set-ASRAlertSetting', 
               'Set-ASRNotificationSetting', 'Set-ASRReplicationProtectedItem', 
               'Set-AzRecoveryServicesAsrNotificationSetting', 
               'Set-AzRecoveryServicesAsrVaultSettings', 
               'Start-ASRApplyRecoveryPoint', 'Start-ASRCommitFailover', 
               'Start-ASRCommitFailoverJob', 'Start-ASRFO', 'Start-ASRPFO', 
               'Start-ASRPlannedFailoverJob', 'Start-ASRResyncJob', 
               'Start-ASRResynchronizeReplicationJob', 
               'Start-ASRSwitchProcessServerJob', 'Start-ASRTFO', 
               'Start-ASRTFOCleanupJob', 'Start-ASRTestFailoverCleanupJob', 
               'Start-ASRTestFailoverJob', 'Start-ASRUnplannedFailoverJob', 
               'Stop-ASRJob', 'Update-ASRMobilityService', 'Update-ASRPolicy', 
               'Update-ASRProtectionContainerMapping', 
               'Update-ASRProtectionDirection', 'Update-ASRRecoveryPlan', 
               'Update-ASRServicesProvider', 'Update-ASRvCenter', 
               'Set-AzRecoveryServicesBackupProperties', 
               'Get-AzRecoveryServicesBackupJobDetails'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ResourceManager','ARM','RecoveryServices'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Fixing Workload Restore for contributor permissions.
* Added new parameter sets and validations for Restore-AzRecoveryServicesBackupItem cmdlet.'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

