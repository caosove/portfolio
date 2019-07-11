package user;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class Utility {
	
	//��й�ȣ ��ȣȭ
	public static String encrypt(String source, String algorithm) {
		String password="";
		try {
			MessageDigest md=MessageDigest.getInstance(algorithm);
			md.update(source.getBytes());
			byte[] digest=md.digest();
			for(int i=0;i<digest.length;i++) {
				password+=Integer.toHexString(digest[i]&0xFF);
			}
		} catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return password;
	}

	//�ӽ� ��й�ȣ
	public static String randomPassword() {
		return UUID.randomUUID().toString().replace("-", "").substring(0, 8).toUpperCase();
	}
	
	//��� ���
	public static String getTerms(int n) throws Exception {
		String terms="";
		String filePath=("C:\\java\\workspace\\this\\WebContent\\WEB-INF\\");
		BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(new File(filePath,"terms"+n+".txt")),"MS949"));
		//BufferedReader br=new BufferedReader(new FileReader(new File(filePath,"terms"+n+".txt")));
		//System.out.println(br.readLine());
		while(true) { 
			String temp=br.readLine(); 
			if(temp==null) break; 
			temp=temp+"\n";
			terms+=temp;
		}
		br.close();
		return terms;
	}
}
