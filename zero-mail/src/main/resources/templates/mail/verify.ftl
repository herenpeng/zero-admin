<html>
<body>
    <pre>
尊敬的<span style="font-weight: bolder;">${username}</span>用户，您好：
    您的邮箱<span style="color: red; font-weight: bolder;">${toMail}</span>正在进行验证，邮箱验证码为：<span
                style="color: red; font-weight: bolder;">${verify}</span>，该邮箱验证码有效期为5分钟，邮箱验证码过期后失效，请注意保管，不要泄露给其他人。
    如果该邮箱验证非本人操作，忽略该邮件即可。
    </pre>
    <div style="text-align: right;">${.now?string("yyyy年MM月dd日 HH:mm:ss")}</div>
</body>
</html>