package com.janditour.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;

public class Util {
	
	/**
	 * 지정된 암호화 알고리즘에 따라 문자열 데이터를 암호화 처리
	 * 
	 * @param source 암호화 대상 문자열
	 * @param algorithm 암호화 알고리즘 문자열 (SHA-1, MD5, SHA-256 ...)
	 * @return 암호화된 데이터
	 */
	public static byte[] getHashedData(String source, String algorithm) {
		
		byte[] hashedData = null;
		
		try {
			//암호화 처리 인스턴스 생성
			MessageDigest md = MessageDigest.getInstance(algorithm);
			hashedData = md.digest(source.getBytes());//지정된 알고리즘으로 암호화
		} catch (NoSuchAlgorithmException ex) {	
			hashedData = null;
		}
		
		return hashedData;
	}
	
	/**
	 * 문자열을 암호화 알고리즘에 따라 암호화 하고 결과를 문자열로 변환
	 * @param source
	 * @param algorithm
	 * @return
	 */
	public static String getHashedString(String source, String algorithm) {
		
		byte[] hashedData = getHashedData(source, algorithm);
		
		if (hashedData == null) return null;
		 
		String hashedString = "";
		for (int i = 0; i < hashedData.length; i++) {
			String hexString = 
				Integer.toHexString((int)hashedData[i] & 0x000000ff);
			if (hexString.length() < 2)
				hexString = "0" + hexString;
			
			hashedString += hexString;
		}
		
		return hashedString;
	}
	
	//////////////////////////////////////////////////////////////////
	/**
	 * 특정 폴더에서 고유한 파일 이름을 만드는 메서드 <br> 
	 * 파일이름이 중복되면 뒤에 .1, .2와 같은 접미사 추가
	 * @param path
	 * @param fileName
	 * @return
	 */
	public static String getUniqueFileName(String path, String fileName)
    {	
        String name =
            fileName.substring(0, fileName.lastIndexOf("."));
        String ext =
            fileName.substring(fileName.lastIndexOf("."));
        int index = 1;
        while (true) {
        	File file = 
        		new File(path + "\\" + name + "_" + index + ext);
        	if (file.exists())
        		index++;
        	else
        		break;
        }

        return name + "_" + index + ext;
    }
	
	/**
	 * 고유한 파일 이름을 만드는 메서드
	 * @param fileName
	 * @return
	 */
	public static String getUniqueFileName(String fileName)
    {   
        String ext =
            fileName.substring(fileName.lastIndexOf("."));
        
        String name = UUID.randomUUID().toString();

        return name + ext;
    }
	
	///////////////////////////////////////////////////
	
	public static String makeQueryString(
		String queryString, String toAdd, String[] toRemove, String encoding)
		throws UnsupportedEncodingException {
		
		if (queryString == null || queryString.length() == 0) {
			return null;
		}
		if (encoding == null || encoding.length() == 0) {
			encoding = "utf-8";
		}
		queryString = queryString.replace("?", "");
		String[] ar = queryString.split("&");
		HashMap<String, String> result = new HashMap<>();
		for (String q : ar) {
			String[] ar2 = q.split("=");
			if (ar2.length != 2) {
				throw new RuntimeException("Invalid Format");
			}
			result.put(ar2[0], 
				new String(ar2[1].getBytes(encoding), "ISO-8859-1"));
		}
		
		if(toRemove != null && toRemove.length > 0) {
			for (String d : toRemove) {
				result.remove(d);
			}
		}
		
		if (toAdd != null && toAdd.length() > 0) {
			ar = toAdd.trim().split("&");
			for (String a : ar) {
				String[] ar2 = a.split("=");
				if (ar2.length != 2) {
					throw new RuntimeException("Invalid Format");
				}
				result.replace(ar2[0], 
					new String(ar2[1].getBytes(encoding), "ISO-8859-1"));
			}
		}
		
		Set<String> keys = result.keySet();
		StringBuilder sb = new StringBuilder();
		for (String key : keys) {
			sb.append(String.format("&%s=%s", key, result.get(key)));
		}
		sb = sb.replace(0, 1, "?");
		
		return sb.toString();
	}
	
	/**
	 * 원본 이미지로 썸네일 이미지 만드는 메서드
	 * 
	 * @param filePath 파일이 저장된 디렉터리 경로
	 * @param fileName 파일 이름
	 * @param dw 너비(도트단위)
	 * @param dh 높이(도트단위)
	 * @throws Exception
	 */
	public static void makeThumbnail(
			String filePath, String fileName, int dw, int dh) throws Exception {

	    // 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
	    BufferedImage srcImg = ImageIO.read(new File(filePath, fileName));

	    // 원본 이미지의 너비와 높이 입니다.
	    int ow = srcImg.getWidth();
	    int oh = srcImg.getHeight();
	    
	    // 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
	    int nw = ow;
	    int nh = (ow * dh) / dw;
	    
	    // 계산된 높이가 원본보다 높다면 crop이 안되므로
	    // 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
	    if(nh > oh) {
	        nw = (oh * dw) / dh;
	        nh = oh;
	    }
	  	
	    // 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
	    BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);

	    // crop된 이미지로 썸네일을 생성합니다.
	    BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
	    
	    // 썸네일을 저장합니다. 이미지 이름 앞에 "thumb_" 를 붙여 표시.
	    int dotIndex = fileName.lastIndexOf(".");
	    String thumbName = "thumb_" + fileName;
	    File thumbFile = new File(filePath, thumbName);
	    
	    ImageIO.write(destImg, 
	    		fileName.substring(dotIndex + 1).toUpperCase(), 
	    		thumbFile);
	}

}
