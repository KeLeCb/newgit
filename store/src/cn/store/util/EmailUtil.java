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
 *Description: 邮箱util，发送邮件，验证码 <br>  
 *@author Administrator
 *@date 2019年3月30日 下午8:53:24   
 */  
public class EmailUtil {
	
	/**   
	 * Title: sendMail <br> 
	 * Description: 发送邮箱验证码 <br>    
	 *@return: void      
	 *@param email   对方的邮箱
	 *@param activeCode		验证码
	 *@throws AddressException
	 *@throws MessagingException   
	 */  
	public static void sendMail(String email, int activeCode) throws AddressException, MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session
		// 创建参数配置, 用于连接邮件服务器的参数配置
		Properties props = new Properties(); // 参数配置
		props.setProperty("mail.transport.protocol", "SMTP");// 使用的协议（JavaMail规范要求）
		props.setProperty("mail.host", "smtp.163.com");// // 发件人的邮箱的 SMTP 服务器地址
		props.setProperty("mail.smtp.auth", "true");// 请求认证，参数名称与具体实现有关 指定验证为true
		props.setProperty("username", "yt275647614@163.com");
		props.setProperty("password", "980602");
		// 创建验证器
		Authenticator auth = new Authenticator() {
			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				// 网易邮箱Yang_li_g 用户名 hao123授权码,改为自己的账号和密码
				return new PasswordAuthentication("yt275647614@163.com", "cb980602");
			}
		};
		String emailMsg = "【平安银行】，您的验证码为" + activeCode + "如果不是本人，请忽略此条数据";
		Session session = Session.getInstance(props, auth);

		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);

		// 这里也要改和上面对应，注意后缀和上面设置的一样不然会报错
		message.setFrom(new InternetAddress("yt275647614@163.com")); // 设置发送者

		message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(props.getProperty("username")));
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者

		message.setSubject("用户激活");
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.创建 Transport用于将邮件发送

		Transport.send(message);

	}
	
	/**   
	 * Title: getActiveCode <br> 
	 * Description: 获取验证码 <br>    
	 *@return: int  返回数据类型
	 *@return   返回获得的验证码    
	 */  
/*	public static int getActiveCode() {
		int activeCode=(int) (Math.random()*(999999-100000)+100000);
		return activeCode;
	}*/


}
