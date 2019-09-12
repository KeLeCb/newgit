/**
 *   
 */
package cn.store.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


/**   
 *ClassName: EmailUtil <br>
 *Description: ����util�������ʼ�����֤�� <br>  
 *@author Administrator
 *@date 2019��3��30�� ����8:53:24   
 */  
public class EmailUtil {
	
	/**   
	 * Title: sendMail <br> 
	 * Description: ����������֤�� <br>    
	 *@return: void      
	 *@param email   �Է�������
	 *@param activeCode		��֤��
	 *@throws AddressException
	 *@throws MessagingException   
	 */  
	public static void sendMail(String email, int activeCode) throws AddressException, MessagingException {
		// 1.����һ���������ʼ��������Ự���� Session
		// ������������, ���������ʼ��������Ĳ�������
		Properties props = new Properties(); // ��������
		props.setProperty("mail.transport.protocol", "SMTP");// ʹ�õ�Э�飨JavaMail�淶Ҫ��
		props.setProperty("mail.host", "smtp.163.com");// // �����˵������ SMTP ��������ַ
		props.setProperty("mail.smtp.auth", "true");// ������֤���������������ʵ���й� ָ����֤Ϊtrue
		props.setProperty("username", "yt275647614@163.com");
		props.setProperty("password", "980602");
		// ������֤��
		Authenticator auth = new Authenticator() {
			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				// ��������Yang_li_g �û��� hao123��Ȩ��,��Ϊ�Լ����˺ź�����
				return new PasswordAuthentication("yt275647614@163.com", "cb980602");
			}
		};
		String emailMsg = "��ƽ�����С���������֤��Ϊ" + activeCode + "������Ǳ��ˣ�����Դ�������";
		Session session = Session.getInstance(props, auth);

		// 2.����һ��Message�����൱�����ʼ�����
		Message message = new MimeMessage(session);

		// ����ҲҪ�ĺ������Ӧ��ע���׺���������õ�һ����Ȼ�ᱨ��
		message.setFrom(new InternetAddress("yt275647614@163.com")); // ���÷�����

		message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(props.getProperty("username")));
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // ���÷��ͷ�ʽ�������

		message.setSubject("�û�����");
		// message.setText("����һ�⼤���ʼ�����<a href='#'>���</a>");

		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.���� Transport���ڽ��ʼ�����

		Transport.send(message);

	}
	
	/**   
	 * Title: getActiveCode <br> 
	 * Description: ��ȡ��֤�� <br>    
	 *@return: int  ������������
	 *@return   ���ػ�õ���֤��    
	 */  
/*	public static int getActiveCode() {
		int activeCode=(int) (Math.random()*(999999-100000)+100000);
		return activeCode;
	}*/


}
