ファイル説明
CheckPort.ps1         :ポート監視用PowerShellスクリプト
CheckPort_smtpauth.ps1:ポート監視用PowerShellスクリプト(SMTP認証対応) 
CheckPort_fast.ps1    :ポート監視用PowerShellスクリプト(高速)
                       TimeOut時間経過後に疎通確認コマンドの応答を待たずにNG判定をします。
CheckPort_fast_smtpauth.ps1    :ポート監視用PowerShellスクリプト(高速)(SMTP認証対応)

kanshi.csv            :監視対象IP設定ファイル
設置方法.txt          :タスクスケジューラ登録用メモ

説明
kanshi.csvファイルに記述された監視対象のIP、ポート番号に対して
Test-NetConnectionコマンドで疎通確認を行い、NG判定されると指定宛先にメール通知をします。
