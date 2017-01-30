package com.igor.notification;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * @author igor on 30.01.17.
 */
public class Notification {

    static final private String FROMEMAIL = "summerjava570@gmail.com";
    static final private String MYPASS = "Cryptography";
    static private Properties props;

    public void send(String text) {

        createProps();

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROMEMAIL, MYPASS);
            }
        });

        try {
            Message message = new MimeMessage(session);
            //від кого
            message.setFrom(new InternetAddress(FROMEMAIL));
            //кому
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("joyukr@ukr.net"));
            //тема
            message.setSubject("IGK-MTD-12");
            //текст
            message.setText(text);
            //відправка
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static void createProps() {
        props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
    }
}
