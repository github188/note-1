package com.v6.base.XsmIntegrationV6;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class AesTest {
	public static void main(String[] args) {
//		initKey();
		encrypt( "D://github/javaWeb_3.5年_张文杰_个人简历.pdf" );
		decrypt( "D://github/my/testrlt.txt", "简历.pdf" );
	}
	
	public static void initKey(){
		try {
			SecretKey key = KeyGenerator.getInstance("AES").generateKey();
			System.out.print( key );
			FileOutputStream fosKey = new FileOutputStream("D://github/my.key");
			ObjectOutputStream oosSecterKey = new ObjectOutputStream(fosKey);
			oosSecterKey.writeObject(key);
			oosSecterKey.close();
			fosKey.close();
		} catch ( Exception e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void encrypt( String file ){
		try {
			Cipher cipher = Cipher.getInstance("AES");
			FileInputStream fisKey = new FileInputStream("D://github/my.key");
			ObjectInputStream oisKey = new ObjectInputStream(fisKey);
			Key key = (Key) oisKey.readObject();
			oisKey.close();
			fisKey.close();
			cipher.init(Cipher.ENCRYPT_MODE, key);
			
			FileInputStream fileInput = new FileInputStream( file );
			FileOutputStream rltOutStream = new FileOutputStream("D://github/my/testrlt.txt");
			
			byte[] src = new byte[fileInput.available()];
			int len = fileInput.read(src);
			int totle = 0;
			while (totle < src.length) {
				totle += len;
				len = fileInput.read(src, totle, src.length - totle);
			}
			byte[] rlt = cipher.doFinal( src ); 
			rltOutStream.write( rlt );
			
			fileInput.close();
			rltOutStream.flush();
			rltOutStream.close();
		} catch ( Exception e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void decrypt( String file, String decryptName ){
		try {
			Cipher cipher = Cipher.getInstance("AES");
			FileInputStream fisKey = new FileInputStream("D://github/my.key");
			ObjectInputStream oisKey = new ObjectInputStream(fisKey);
			Key key = (Key) oisKey.readObject();
			oisKey.close();
			fisKey.close();
			cipher.init(Cipher.DECRYPT_MODE, key);
			
			FileInputStream fileInput = new FileInputStream( file );
			FileOutputStream rltOutStream = new FileOutputStream("D://github/my/" + decryptName);
			
			byte[] src = new byte[fileInput.available()];
			int len = fileInput.read(src);
			int totle = 0;
			while (totle < src.length) {
				totle += len;
				len = fileInput.read(src, totle, src.length - totle);
			}
			byte[] rlt = cipher.doFinal( src ); 
			rltOutStream.write( rlt );
			
			fileInput.close();
			rltOutStream.flush();
			rltOutStream.close();
		} catch ( Exception e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
