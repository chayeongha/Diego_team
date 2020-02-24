package com.diego.mid.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class MemberFile {
	
	public String save(String realPath, MultipartFile image) throws Exception {
		File file = new File(realPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		
		String fname = UUID.randomUUID()+"_"+image.getOriginalFilename();
		file = new File(realPath, fname);
		image.transferTo(file);
		
		return fname;
	}

}
