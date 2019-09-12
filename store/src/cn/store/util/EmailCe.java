package cn.store.util;

import javax.mail.MessagingException;

/**
 * @description:
 * @author: Cb
 * @time: 2019/9/3 16:49
 */
public class EmailCe {
    public static void main(String[] args) {
        int n=0;
        while(n<5){
            int activeCode=(int) (Math.random()*(999999-100000)+100000);
            String email="275647614@qq.com";
            try {
                //user.getEmail()  ：是注册人的邮件用户名
                EmailUtil.sendMail(email,activeCode );
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            n++;
            System.out.println(n);
        }
    }
}
