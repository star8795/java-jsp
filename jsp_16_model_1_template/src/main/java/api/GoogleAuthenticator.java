package api;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthenticator extends Authenticator{
	
	PasswordAuthentication passwordAuthentication;
	
	public GoogleAuthenticator() {
		
		try {
			Properties prop = new Properties();
			String path = getClass().getResource("../prop/mail.properties").getPath();
			prop.load(new FileReader(path));
			String auth = prop.getProperty("gmail_auth");
			String pass = prop.getProperty("gmail_pass");
			// new PasswordAuthentication("계정", "비밀번호");
			System.out.println("auth : " + auth);
			System.out.println("pass : " + pass );
			passwordAuthentication = new PasswordAuthentication("star879518@gmail.com", "khty egiw enfa mkji");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
	
	public Properties getProp() {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		return props;
	}
}