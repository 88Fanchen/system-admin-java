package com.fanchen.utils;

import cn.hutool.core.util.StrUtil;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

/**
 * @author fanchen
 * @date 2021/12/10
 * @time 15:48
 */
@SuppressWarnings("all")
public class UploadUtil {
    public static String uploadImg(MultipartFile file){
        Calendar calendar = Calendar.getInstance();
        String prePath = "/" + calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1);
        File trueFile = new File("F:/upload" + prePath);
        if (!trueFile.exists()){
            if (!trueFile.mkdirs()){
                return null;
            }
        }
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        if (StrUtil.isEmpty(extension)){
            extension = MimeTypeUtils.getExtension(file.getContentType());
        }
        String filename = uuid + "." + extension;
        try {
            file.transferTo(new File("F:/upload" + prePath + "/" + filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prePath + "/" + filename;
    }
}
