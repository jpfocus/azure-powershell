$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

. $PSScriptRoot/ManagedHsmDatePlaneTests.ps1
# ImportModules
$hsmName = 'hsm29568'
$signInName = 'yeliu@microsoft.com'

Describe "AddAzManagedHsmKey" {
    It "Create a RSA key inside a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        $keyType = "RSA"
        $rsaKey = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType $keyType
        $rsaKey.VaultName | Should -BeExactly $hsmName
        $rsaKey.Name | Should -BeExactly $keyName
        $rsaKey.Attributes.KeyType | Should -Be "RSA-HSM"
    }

    It "Create an EC key with curve P-256 inside a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        $keyType = "EC"
        $curveName = "P-256"
        $rsaKey = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType $keyType -CurveName $curveName
        $rsaKey.VaultName | Should -BeExactly $hsmName
        $rsaKey.Name | Should -BeExactly $keyName
        $rsaKey.Attributes.KeyType | Should -Be "EC-HSM"
        $rsaKey.Key.CurveName | Should -Be $curveName
    }

    It "Create an oct key inside a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        $keyType = "oct"
        $rsaKey = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType $keyType
        $rsaKey.VaultName | Should -BeExactly $hsmName
        $rsaKey.Name | Should -BeExactly $keyName
        $rsaKey.Attributes.KeyType | Should -Be "oct-HSM"
    }

    It "Create an oct key inside a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        $keyType = "oct"
        $rsaKey = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType $keyType
        $rsaKey.VaultName | Should -BeExactly $hsmName
        $rsaKey.Name | Should -BeExactly $keyName
        $rsaKey.Attributes.KeyType | Should -Be "oct-HSM"
    }

    It "Create a key with non-default values inside a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        $keyType = "RSA"
        $KeyOps = 'decrypt', 'verify'
        # Expires & NotBefore is hard to cmpare, may add in the furture
        $Tags = @{'Severity' = 'high'; 'Accounting' = "true" }

        $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType $keyType -KeyOps $KeyOps -Disable -Tag $Tags

        $key.Attributes.KeyOps | Should -Be $KeyOps
        $key.Tags.Count | Should -Be 2
        $key.Enabled | Should -Be $false
    }

    # It "Import a RSA key from pfx file into a managed HSM" {
    #     $keyName = GetRandomName -Prefix "key"
    #     $keyFilePath = Join-Path $PSScriptRoot ../Resources/testImportKey.pfx -Resolve
    #     $keyFilePwd = $null
    #     $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyFilePath $keyFilePath -KeyFilePassword $keyFilePwd
    #     $key.Name | Should -BeExactly $keyName
    # }
}

Describe "GetAzManagedHsmKey" {
    BeforeEach {
        # Add a key
        $keyName = GetRandomName -Prefix "key"
        $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType "RSA"
    }

    It "List all the keys in a managed HSM" {
        $keys = Get-AzKeyVaultKey -HsmName $hsmName
        $keys.Count | Should -BeGreaterThan 0
    }

    It "Get a specific key in a managed HSM" {
        $got = Get-AzKeyVaultKey -HsmName $hsmName -KeyName $keyName
        $got.Id | Should -Be $key.Id
    }

    It "List all the keys that have been deleted in a managed HSM" {
        Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -Force
        $deletedKey = Get-AzKeyVaultKey -HsmName $hsmName -KeyName $keyName -InRemovedState
        $deletedKey.Id | Should -Be $key.Id
    }

    It "Download a key from a managed HSM" {
        $filePath = "$PSScriptRoot\public.pem"
        Get-AzKeyVaultKey -HsmName $hsmName -KeyName $keyName -OutFile $filePath
        $filePath | Should -Exist
    }
}

Describe "RemoveAzManagedHsmKey" {
    It "Remove a key from a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType "RSA"
        $deletedKey = Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -Force -PassThru
        $deletedKey.Id | Should -Be $key.Id
    }

    It "Purge a deleted key from a managed HSM" {
        $keyName = GetRandomName -Prefix "key"
        Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType "RSA"
        Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -Force -PassThru
        Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -InRemovedState -Force -PassThru
        $deletedKey = Get-AzKeyVaultKey -HsmName $hsmName -Name $keyName -InRemovedState
        $deletedKey | Should -Be $null
    }

    It "Remove keys by using piping" {
        Get-AzKeyVaultKey -HsmName $hsmName | Remove-AzKeyVaultKey -Force
        $keys = Get-AzKeyVaultKey -HsmName $hsmName
        $keys.Count | Should -Be 0
    }
}

Describe "UpdateAzManagedHsmKey" {
    It "Enable a key and set tags" {
        $keyName = GetRandomName -Prefix "key"
        $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType "RSA" -Disable
        $Tags = @{'Severity' = 'high'; 'Accounting' = 'true' }

        $updatedKey = Update-AzKeyVaultKey -HsmName $hsmName -Name $keyName -Enable $True -Tag $Tags -PassThru

        $updatedKey.Id | Should -Be $key.Id
        $updatedKey.Enabled | Should -Be $True
        $updatedKey.Tags.Count | Should -Be 2
    }
}

Describe "UndoAzManagedHsmKeyRemoval" {
    It "Undo a key removal" {
        $keyName = GetRandomName -Prefix "key"
        $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType "RSA"
        $deletedKey = Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -Force -PassThru
        $recoveredKey = $deletedKey | Undo-AzKeyVaultKeyRemoval
        $recoveredKey.Id | Should -Be $key.Id
    }
}

Describe "BackupAndRestoreAzManagedHsmKey" {
    It "Backup and restore a key" {
        $keyName = GetRandomName -Prefix "key"
        $key = Add-AzKeyVaultKey -HsmName $hsmName -Name $keyName -KeyType "RSA"
        $filePath = "$PSScriptRoot/backupkey.blob"
        $key | Backup-AzKeyVaultKey -OutputFile $filePath -Force
        $filePath | Should -Exist

        Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -Force
        Remove-AzKeyVaultKey -HsmName $hsmName -Name $keyName -InRemovedState -Force
        $restoredKey = Restore-AzKeyVaultKey -HsmName $hsmName -InputFile $filePath
        $restoredKey.Id | Should -Be $key.Id
    }
}

Describe "BackupAndRestoreAzManagedHsm" {
    BeforeEach {
        $sasToken = ConvertTo-SecureString -AsPlainText -Force "?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2020-10-21T13:11:01Z&st=2020-10-21T05:11:01Z&spr=https&sig=******"
        $containerUri = "https://{accountName}.blob.core.windows.net/{containerName}"
    }

    It "Backup a managed HSM" {
        $uri = Backup-AzManagedHsm -Name $hsmName -StorageContainerUri $containerUri -SasToken $sasToken
        $uri | Should -Not -Be $null
    }

    It "Restore a managed HSM" {
        $restoreResult = Restore-AzManagedHsm -Name $hsmName -StorageContainerUri $containerUri -BackupFolder "mhsm-$hsmName-2020102105402658" -SasToken $sasToken -PassThru
        $restoreResult | Should -Be $True
    }
}

Describe "GetAzManagedHsmRoleDefinition" {
    It "List all the roles at '/' scope" {
        $roles = Get-AzKeyVaultRoleDefinition -HsmName $hsmName -Scope "/"
        $roles.Count | Should -BeGreaterThan 0
    }

    It "Get a specific role" {
        $backupRole = Get-AzKeyVaultRoleDefinition -HsmName $hsmName -RoleDefinitionName "managed hsm backup"
        $backupRole | Should -Not -Be $null
        $backupRole.Permissions | Should -Not -Be $null
        $backupRole.Permissions.AllowedDataActions | Should -Not -Be $null
    }
}

Describe "NewAzManagedHsmRoleAssignment" {
    BeforeEach {
        $roleDefinitionName = "Managed HSM Backup"
        # Clean role
        $roleAssignment = Get-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        if ($roleAssignment) {
            Remove-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        }
    }

    It "Assign a role to user" {
        # Assign role
        $roleAssignment = New-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        $roleAssignment | Should -Not -Be $null
        $roleAssignment.RoleDefinitionName | Should -Be $roleDefinitionName
    }
}

Describe "RemoveAzManagedHsmRoleAssignment" {
    BeforeEach {
        # Assign role
        $roleDefinitionName = "Managed HSM Backup"
        $roleAssignment = Get-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        if (!$roleAssignment) {
            $roleAssignment = New-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        }
    }

    It "Revoke a role from user at '/' scope" {
        Remove-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName -Scope "/"
        $roleAssignment = Get-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        $roleAssignment | Should -Be $null
    }
}

Describe "GetAzManagedHsmRoleAssignment" {
    BeforeEach {
        # Assign role
        $roleDefinitionName = "Managed HSM Backup"
        $roleAssignment = Get-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        if (!$roleAssignment) {
            $roleAssignment = New-AzKeyVaultRoleAssignment -HsmName $hsmName -RoleDefinitionName $roleDefinitionName -SignInName $signInName
        }
    }

    It "List all role assignmentss in a managed HSM" {
        $roleAssignments = Get-AzKeyVaultRoleAssignment -HsmName $hsmName
        $roleAssignments | Should -Not -Be $null
        $roleAssignments.Count | Should -BeGreaterThan 0
    }

    It "List a user's role assignments in a managed HSM on '/' scope" {
        $roleAssignments = Get-AzKeyVaultRoleAssignment -HsmName $hsmName -SignInName $signInName -Scope "/"
        $roleAssignments | Should -Not -Be $null
        $roleAssignments.Count | Should -BeGreaterThan 0
    }
}

# to do: manually remove all stuffs in resource group
# AfterAll {
# $hsm = Get-AzManagedHsm -Name $hsmName
# Remove-AzResourceGroup -Name $hsm.ResourceGroupName -Force
# }