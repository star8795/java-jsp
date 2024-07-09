package emailsender;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    public static void sendEmail(String to) {
        // SMTP 서버 설정
        String host = "smtp.example.com"; // SMTP 서버 주소
        final String username = "your_email@example.com"; // 이메일 계정
        final String password = "your_password"; // 이메일 비밀번호

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            String code = generateCode();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("이메일 인증 코드");
            message.setText("인증 코드: " + code);

            Transport.send(message);

            // 인증 코드를 리턴하여 JSP 페이지에서 세션에 저장할 수 있도록 함
            return code;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static String generateCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // 100000부터 999999 사이의 난수 생성
        return String.valueOf(code);
    }
}
