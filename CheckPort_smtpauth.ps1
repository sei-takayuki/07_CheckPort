# 監視対象
$VMs = Import-CSV E:\TEMP\kanshi.csv


# メール送信
function Send-Mail( $Subject, $Body ) {
    $MailSv = "SMTPサーバ"
    $Port = 25
    $Encode = "UTF8"
    $address = "メールアドレス"
    $addressid = "メールID"

    $pwd = "パスワード" | ConvertTo-SecureString -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential $addressid,$pwd

    Send-MailMessage `
        -To $address `
        -From $address `
        -SmtpServer $MailSv `
        -Credential $cred `
        -Encoding "UTF8" `
        -Port $Port `
        -Subject $Subject `
        -Body $Body 
}



# ping 
    foreach ($vm in $VMs){

        # Port疎通テストを実行します。
        $pingAlive = @(Test-NetConnection $vm.IP -Port $vm.Port -InformationLevel Quiet)

        if ($pingAlive -eq $True) {
            $message = "Check-DeadOrAlive SUCCESS:" + $vm.HostName + ":" + $vm.IP + ":" + $vm.Port
            echo $message


        } else {

                # ログを記録する
                [string]$message = "Check-DeadOrAlive ERROR:" + $vm.HostName + ":" + $vm.IP + ":" + $vm.Port
                echo $message

                # メールを送信する
                $subject = $vm.HostName + ":" + $vm.IP + ":" + $vm.Port + " IS DEAD"
                [String]$date = Get-Date
                $body = $date + "`r`n" + $subject + "`r`nfrom Operation Management Server(PCLI Server)"
                Send-Mail $subject $body


        }
    }


