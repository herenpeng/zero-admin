<html>
<body>
    <pre>
尊敬的<span style="font-weight: bolder;">${username}</span>用户，您好：
    您的账号刚刚进行了登录操作，以下为登录的具体信息。
    <ul>
        <li>登录时间：${loginTime?string("yyyy年MM月dd日 HH:mm:ss")}</li>
        <li>登录地址：${loginAddress}</li>
        <li>登录IP：${loginIp}</li>
    </ul>
    如果该登录操作非本人操作，请及时登录系统账号，并修改账号密码，或者联系我们进行处理。
    如果该登录操作为本人操作，忽略该邮件即可。
    </pre>
    <div style="text-align: right;">${.now?string("yyyy年MM月dd日 HH:mm:ss")}</div>
</body>
</html>