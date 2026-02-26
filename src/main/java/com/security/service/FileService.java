package com.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@Service
public class FileService {

    private static final Logger logger = LoggerFactory.getLogger(FileService.class);

    public void readTxtFile(String sourceFile) {
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(sourceFile))) {
            String aline;
            while ((aline = bufferedReader.readLine()) != null) {
                logger.debug("{}", aline);
            }
        } catch (IOException e) {
            logger.error("文件读取异常：{}", sourceFile, e);
        }
    }
}
