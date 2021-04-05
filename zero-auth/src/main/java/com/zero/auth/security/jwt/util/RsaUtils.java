package com.zero.auth.security.jwt.util;

import com.zero.auth.security.jwt.properties.RsaProperties;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

/**
 * @author herenpeng
 * @since 2021-04-05 13:17
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class RsaUtils {

    private final RsaProperties rsaProperties;

    /**
     * 默认的密文长度，在默认的密文长度和指定的密文长度之间选择最大的值，即密文长度不可以小于默认的密文长度
     */
    private static final int DEFAULT_KEY_SIZE = 2048;
    /**
     * 默认的加密算法
     */
    private static final String DEFAULT_KEY_ALGORITHM = "RSA";

    /**
     * 私钥对象
     */
    @Getter
    private PrivateKey privateKey;
    /**
     * 公钥对象
     */
    @Getter
    private PublicKey publicKey;

    /**
     * 在创建对象之后生成秘钥和公钥文件
     * 该方法用于初始化公钥和私钥的内容，在对象创建之后加载，之间使用属性缓存起来，这样就不需要每次都进行读取
     */
    @PostConstruct
    public void initRsaKey() throws Exception {
        // 生成私钥和公钥文件
        generateKey(rsaProperties.getPublicFile(), rsaProperties.getPrivateFile(), rsaProperties.getSecret());
        // 读取私钥对象
        if (StringUtils.isNotBlank(rsaProperties.getPrivateFile())) {
            privateKey = getPrivateKey(rsaProperties.getPrivateFile());
        }
        // 读取公钥对象
        if (StringUtils.isNotBlank(rsaProperties.getPublicFile())) {
            publicKey = getPublicKey(rsaProperties.getPublicFile());
        }
    }

    /**
     * 从文件中读取公钥
     *
     * @param filePath 公钥保存路径，相对于classpath
     * @return 公钥对象
     * @throws Exception 抛出异常
     */
    private PublicKey getPublicKey(String filePath) throws Exception {
        byte[] bytes = readFile(filePath);
        bytes = Base64.getDecoder().decode(bytes);
        X509EncodedKeySpec spec = new X509EncodedKeySpec(bytes);
        KeyFactory factory = KeyFactory.getInstance(DEFAULT_KEY_ALGORITHM);
        return factory.generatePublic(spec);
    }

    /**
     * 从文件中读取密钥
     *
     * @param filePath 私钥保存路径，相对于classpath
     * @return 私钥对象
     * @throws Exception
     */
    private PrivateKey getPrivateKey(String filePath) throws Exception {
        byte[] bytes = readFile(filePath);
        bytes = Base64.getDecoder().decode(bytes);
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(bytes);
        KeyFactory factory = KeyFactory.getInstance(DEFAULT_KEY_ALGORITHM);
        return factory.generatePrivate(spec);
    }

    /**
     * 根据密文，生成 rsa 公钥和私钥，并写入指定文件
     * 重载方法，使用默认的密文长度
     *
     * @param publicKeyFilePath  公钥文件路径
     * @param privateKeyFilePath 私钥文件路径
     * @param secret             生成密钥的密文
     * @throws Exception 抛出异常
     */
    private void generateKey(String publicKeyFilePath, String privateKeyFilePath, String secret) throws Exception {
        generateKey(publicKeyFilePath, privateKeyFilePath, secret, DEFAULT_KEY_SIZE);
    }

    /**
     * 根据密文，生成 rsa 公钥和私钥，并写入指定文件
     *
     * @param publicKeyFilePath  公钥文件路径
     * @param privateKeyFilePath 私钥文件路径
     * @param secret             生成密钥的密文
     * @param keySize            密文文长度
     * @throws Exception 抛出异常
     */
    private void generateKey(String publicKeyFilePath, String privateKeyFilePath, String secret, int keySize) throws Exception {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        SecureRandom secureRandom = new SecureRandom(secret.getBytes());
        keyPairGenerator.initialize(Math.max(keySize, DEFAULT_KEY_SIZE), secureRandom);
        KeyPair keyPair = keyPairGenerator.genKeyPair();
        // 获取公钥并写出
        byte[] publicKeyBytes = keyPair.getPublic().getEncoded();
        publicKeyBytes = Base64.getEncoder().encode(publicKeyBytes);
        writeFile(publicKeyFilePath, publicKeyBytes);
        // 获取私钥并写出
        byte[] privateKeyBytes = keyPair.getPrivate().getEncoded();
        privateKeyBytes = Base64.getEncoder().encode(privateKeyBytes);
        writeFile(privateKeyFilePath, privateKeyBytes);
    }

    /**
     * 读取对应文件的数据，并返回字节数组
     *
     * @param filePath 文件路径
     * @return 文件字节数组
     * @throws Exception 抛出异常
     */
    private byte[] readFile(String filePath) throws Exception {
        return Files.readAllBytes(new File(filePath).toPath());
    }

    /**
     * 将一个字节数组写入到一个文件中
     *
     * @param destPath 写入文件路径
     * @param bytes    字节数组
     * @throws IOException IO异常
     */
    private void writeFile(String destPath, byte[] bytes) throws IOException {
        File dest = new File(destPath);
        File parentFile = dest.getParentFile();
        if (!parentFile.exists()) {
            parentFile.mkdirs();
        }
        if (!dest.exists()) {
            dest.createNewFile();
        }
        Files.write(dest.toPath(), bytes);
    }

}
